package mndt

import (
	"database/sql"
	"fmt"
)

type EventInfo struct {
	EventId   uint64
	EventKey  uint64
	EventType int32
	Param     string
}

func Add(tx *sql.Tx, e *EventInfo) error {
	de := &dtEvent{
		EventId:    e.EventId,
		EventKey:   e.EventKey,
		EventType:  e.EventType,
		Param:      e.Param,
		State:      0,
		RetryCnt:   0,
		CreateTime: CurMs(),
		UpdateTime: CurMs(),
	}
	_, err := tx.Exec(`insert into dt_event value (?, ?, ?, ?, ?, ?, ?, ?)`,
		de.EventId, de.EventKey, de.EventType, de.Param, de.State, de.RetryCnt, de.CreateTime, de.UpdateTime)
	if err != nil {
		return fmt.Errorf("insert dt_event err: %v", err)
	}
	return nil
}

type dtEvent struct {
	Id         uint64
	EventId    uint64
	EventKey   uint64
	EventType  int32
	Param      string
	State      int32
	RetryCnt   int32
	CreateTime int64
	UpdateTime int64
}
