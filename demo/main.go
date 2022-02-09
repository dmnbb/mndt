package main

import (
	"database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"mndt"
	"strings"
	"time"
)

//create database dtdb
func main() {
	db, err := sql.Open("mysql", "root:123456@tcp(127.0.0.1:3306)/dtdb")
	if err != nil {
		fmt.Printf("[ERRO] sql.Open failed err=%v\n", err)
		return
	}

	_, err = db.Exec("CREATE TABLE `dt_event` (\n  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',\n  `event_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '事件id',\n  `event_key` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '事件的key',\n  `event_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '事件类型',\n  `param` text COMMENT '参数',\n  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0-未完成，1-已完成',\n  `retry_cnt` tinyint(4) NOT NULL DEFAULT '0' COMMENT '重试次数',\n  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间（毫秒）',\n  `update_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间（毫秒）',\n  PRIMARY KEY (`id`),\n  KEY `idx_undo` (`state`, `retry_cnt`, `create_time`, `update_time`) USING BTREE\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='子事件表';")
	if err != nil && !strings.Contains(err.Error(), "Error 1050:") {
		fmt.Printf("[ERRO] create table dt_event failed err=%v\n", err)
		return
	}

	if err = mndt.Start(db); err != nil {
		fmt.Printf("[ERRO] Start failed err=%v\n", err)
		return
	}
	defer mndt.Stop()

	mndt.Register(1, func(tx *sql.Tx, param string) error {
		fmt.Printf("[INFO] param=%s\n", param)
		return nil
	})

	add(db)

	time.Sleep(time.Millisecond*100)
}

func add(db *sql.DB) {
	tx, err := db.Begin()
	if err != nil {
		fmt.Printf("[ERRO] Begin failed err=%v\n", err)
		return
	}
	defer func() {
		if err != nil {
			if er := tx.Rollback(); er != nil {
				fmt.Printf("[ERRO] Rollback failed err=%v\n", er)
			}
		} else {
			if er := tx.Commit(); er != nil {
				fmt.Printf("[ERRO] Commit failed err=%v\n", er)
			}
		}
	}()

	err = mndt.Add(tx, &mndt.EventInfo{
		EventId: 1,
		EventKey: 100,
		EventType: 1,
		Param: "{\"name\": \"test\"}",
	})
	if err != nil {
		fmt.Printf("[ERRO] Add failed err=%v\n", err)
		return
	}
}
