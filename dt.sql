
CREATE TABLE `dt_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `event_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '事件id',
  `event_key` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '事件的key',
  `event_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '事件类型',
  `param` text COMMENT '参数',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0-未完成，1-已完成',
  `retry_cnt` tinyint(4) NOT NULL DEFAULT '0' COMMENT '重试次数',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间（毫秒）',
  `update_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间（毫秒）',
  PRIMARY KEY (`id`),
  KEY `idx_undo` (`state`, `retry_cnt`, `create_time`, `update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='子事件表';