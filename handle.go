package mndt

import (
	"database/sql"
	"fmt"
	"sync"
	"time"
)

func Start(db *sql.DB) error {
	if db == nil {
		return fmt.Errorf("db is nil")
	}
	if gHandler != nil {
		return nil
	}
	gHandler = &handler{
		ch: make(chan struct{}, 1),
		db:        db,
		handleMap: make(map[int32]eventHandleFunc),
	}
	return gHandler.start()
}

func Stop() {
	if gHandler != nil {
		gHandler.stop()
	}
}

func Register(eventType int32, f eventHandleFunc) {
	if gHandler != nil {
		gHandler.register(eventType, f)
	}
}

const (
	interval      = time.Millisecond * 10
	maxRetryCnt   = 30
	timeout       = 3600000 //ms
	retryInterval = 3000    //ms
	maxEventNum   = 100
)

var gHandler *handler

type eventHandleFunc func(tx *sql.Tx, param string) error

type handler struct {
	wg sync.WaitGroup
	ch chan struct{}

	db        *sql.DB
	handleMap map[int32]eventHandleFunc
}

func (h *handler) start() error {
	h.wg.Add(1)
	go func() {
		defer h.wg.Done()
		ticker := time.NewTicker(interval)
		defer ticker.Stop()
		for {
			select {
			case <-ticker.C:
				h.handle()
			case <-h.ch:
				return
			}
		}
	}()
	return nil
}

func (h *handler) stop() {
	close(h.ch)
	h.wg.Wait()
}

func (h *handler) register(eventType int32, f eventHandleFunc) {
	h.handleMap[eventType] = f
}

func (h *handler) handle() {
	rows, err := h.db.Query(`select id, event_id, event_key, event_type, param, state, retry_cnt, 
    	create_time, update_time from dt_event where state = 0 and retry_cnt < ? and create_time > ? and 
    	update_time < ? limit ?`, maxRetryCnt, CurMs()-timeout, CurMs()-retryInterval, maxEventNum)
	if err != nil {
		fmt.Printf("[ERRO] select dt_event failed err=%v\n", err)
		return
	}
	defer rows.Close()
	for rows.Next() {
		de := &dtEvent{}
		err = rows.Scan(&de.Id, &de.EventId, &de.EventKey, &de.EventType, &de.Param,
			&de.State, &de.RetryCnt, &de.CreateTime, &de.UpdateTime)
		if err != nil {
			fmt.Printf("[ERRO] select dt_event Scan failed err=%v\n", err)
			return
		}
		go h.handleOne(de)
	}
}

func (h *handler) handleOne(de *dtEvent) {
	handleFunc, ok := h.handleMap[de.EventType]
	if !ok {
		fmt.Printf("[ERRO] no register\n")
		return
	}

	tx, err := h.db.Begin()
	if err != nil {
		fmt.Printf("[ERRO] Begin failed err=%v\n", err)
		return
	}

	defer func() {
		if err == nil {
			if err = tx.Commit(); err != nil {
				fmt.Printf("[ERRO] Commit failed err=%v\n", err)
			}
		}
		if err != nil {
			if er := tx.Rollback(); er != nil {
				fmt.Printf("[ERRO] Rollback failed err=%v\n", er)
			}
		}
	}()

	if err = handleFunc(tx, de.Param); err != nil {
		fmt.Printf("[ERRO] handleFunc failed err=%v\n", err)
		if er := h.updateDtEventForRetry(de.Id); er != nil {
			fmt.Printf("[ERRO] updateDtEventForRetry failed err=%v\n", er)
		}
		return
	}

	if err = updateDtEventForState(tx, de.Id); err != nil {
		fmt.Printf("[ERRO] updateDtEventForState failed err=%v\n", err)
	}
}

func (h *handler) updateDtEventForRetry(id uint64) error {
	_, err := h.db.Exec(`update dt_event set retry_cnt = retry_cnt + 1, update_time = ? where id = ?`,
		CurMs(), id)
	if err != nil {
		return fmt.Errorf("update dt_event err: %v", err)
	}
	return nil
}

func updateDtEventForState(tx *sql.Tx, id uint64) error {
	res, err := tx.Exec(`update dt_event set state = 1, update_time = ? where id = ? and state = 0`,
		CurMs(), id)
	if err != nil {
		return fmt.Errorf("update dt_event err: %v", err)
	}
	n, err := res.RowsAffected()
	if err != nil {
		return fmt.Errorf("update dt_event RowsAffected err: %v", err)
	}
	if n != 1 {
		return fmt.Errorf("update dt_event no RowsAffected")
	}
	return nil
}
