-- Set numwidth so we don't display numbers in scientific notation (could go as high as 50)
SET NUMWIDTH 30; 

--Uptime.html
COLUMN "Seconds Up" FORMAT 999999999999999999

--Instance.html
COLUMN startup_time FORMAT A12;
COLUMN parallel FORMAT A8;
COLUMN archiver FORMAT A8;
COLUMN shutdown_pending FORMAT A16;
COLUMN active_state FORMAT A12;
COLUMN blocked FORMAT A7;
COLUMN instance_mode FORMAT A13;

--ImportantParam.html
COLUMN isdefault FORMAT A14;
COLUMN isses_modifiable FORMAT A16;
COLUMN issys_modifiable FORMAT A16;
COLUMN ispdb_modifiable FORMAT A16;
COLUMN isinstance_modifiable FORMAT A21;
COLUMN ismodified FORMAT A10;
COLUMN isadjusted FORMAT A10;
COLUMN isdeprecated FORMAT A12;
COLUMN isbasic FORMAT A7;

--OsStat.html
COLUMN cumulative FORMAT A10;

--TimeModel.html
COLUMN "Time (s)" FORMAT 999,999,990.99
COLUMN "% of DB Time" FORMAT 990.99
COLUMN seconds FORMAT 999,999,990.99

--SgaInfo.html
COLUMN mb FORMAT 999,999,990.9
COLUMN resizeable FORMAT a10;

--SgaTargetAdvice.html
COLUMN sga_size FORMAT 999,999,999,999,999
COLUMN sga_size_factor FORMAT 990.0000
COLUMN estd_db_time_factor FORMAT 999,999,990.0000

--DbCacheAdvice.html
COLUMN advice_status FORMAT a13;
COLUMN size_factor FORMAT 990.0000
COLUMN estd_physical_read_factor FORMAT 990.0000
COLUMN estd_pct_of_db_time_for_reads FORMAT 9999990.0

--PgaTargetAdvice.html
COLUMN pga_target_for_estimate FORMAT 999,999,999,999,999
COLUMN pga_target_factor FORMAT 990.0000

--SharedPoolAdvice.html
COLUMN shared_pool_size_for_estimate FORMAT 999,999,999,999,999
COLUMN shared_pool_size_factor FORMAT 990.0000
COLUMN estd_lc_time_saved_factor FORMAT 990.0000
COLUMN estd_lc_load_time_factor FORMAT 990.0000

--CursorCheck.html
COLUMN Cursors 999,999,999,999,999

--ScalabilityInfo.html
COLUMN percCPU heading "%CPU" FORMAT 90.99
COLUMN percDisk heading "%DISK" FORMAT 90.99

--RedoLogs.html
COLUMN archived FORMAT a8;
COLUMN is_recovery_dest_file FORMAT a21;
COLUMN DAY   FORMAT a10
COLUMN H00   FORMAT 999     HEADING '00'
COLUMN H01   FORMAT 999     HEADING '01'
COLUMN H02   FORMAT 999     HEADING '02'
COLUMN H03   FORMAT 999     HEADING '03'
COLUMN H04   FORMAT 999     HEADING '04'
COLUMN H05   FORMAT 999     HEADING '05'
COLUMN H06   FORMAT 999     HEADING '06'
COLUMN H07   FORMAT 999     HEADING '07'
COLUMN H08   FORMAT 999     HEADING '08'
COLUMN H09   FORMAT 999     HEADING '09'
COLUMN H10   FORMAT 999     HEADING '10'
COLUMN H11   FORMAT 999     HEADING '11'
COLUMN H12   FORMAT 999     HEADING '12'
COLUMN H13   FORMAT 999     HEADING '13'
COLUMN H14   FORMAT 999     HEADING '14'
COLUMN H15   FORMAT 999     HEADING '15'
COLUMN H16   FORMAT 999     HEADING '16'
COLUMN H17   FORMAT 999     HEADING '17'
COLUMN H18   FORMAT 999     HEADING '18'
COLUMN H19   FORMAT 999     HEADING '19'
COLUMN H20   FORMAT 999     HEADING '20'
COLUMN H21   FORMAT 999     HEADING '21'
COLUMN H22   FORMAT 999     HEADING '22'
COLUMN H23   FORMAT 999     HEADING '23'
COLUMN TOTAL FORMAT 999,999 HEADING 'Total'

--SchedulerJobs.html
COLUMN schedule_type FORMAT A13;
COLUMN auto_drop FORMAT A9;
COLUMN restart_on_recovery FORMAT A19;
COLUMN restart_on_failure FORMAT A18;
COLUMN logging_level FORMAT A13;
COLUMN store_output FORMAT A12;
COLUMN stop_on_window_close FORMAT A20;
COLUMN instance_stickiness FORMAT A19;
COLUMN "system" FORMAT A6;
COLUMN deferred_drop FORMAT A13;
COLUMN allow_runs_in_restricted_mode FORMAT A29;
COLUMN restartable FORMAT A11;

--FreeTablespace.html
COLUMN fileCount heading "File Count" FORMAT 999999
COLUMN sizeMB heading "Size(MB)" FORMAT 999,999,999.99
COLUMN freeMB heading "Free(MB)" FORMAT 999,999,999.99
COLUMN usedMB heading "Used(MB)" FORMAT 999,999,999.99
COLUMN maxExtMB  heading "Max Ext(MB)" FORMAT 999,999,999.99
COLUMN percFree heading "%Free" FORMAT 90.99
COLUMN tablespace_name FORMAT a20
COLUMN autoextensible FORMAT A14;
COLUMN online_status FORMAT A13;

--UndoCheck.html
COLUMN actualUndo heading "ACTUAL UNDO SIZE [MB]" FORMAT 999,999,999
COLUMN neededUndo heading "NEEDED UNDO SIZE [MB]" FORMAT 999,999,999
COLUMN undoRetention heading "UNDO RETENTION [Sec]" FORMAT 999,999,999

--Tables.html
COLUMN num_rows FORMAT 9,999,999,999
COLUMN sample_size FORMAT 9,999,999,999
COLUMN blocks FORMAT 999,999,999
COLUMN avg_row_len FORMAT 999,999
COLUMN chain_cnt FORMAT 999,999,999
COLUMN "owner" FORMAT a20
COLUMN table_name FORMAT a30
COLUMN last_analyzed FORMAT A19

--TableEmptySpace.html
COLUMN allocated_space_MB FORMAT 999,999,990.00
COLUMN used_space_MB FORMAT 999,999,990.00
COLUMN unused_MB FORMAT 999,999,990.00

--QueueEntry.html
COLUMN "Count" FORMAT 999,999,999,999,999

--Indexes.html
COLUMN distinct_keys FORMAT 9,999,999,999
COLUMN index_name FORMAT a30 
COLUMN column_name FORMAT a32
COLUMN column_position FORMAT 99
COLUMN "Column#" FORMAT 99
COLUMN "Sample Percent" FORMAT 999
COLUMN clustering_factor FORMAT 999,999,999,999,999
COLUMN leaf_blocks FORMAT 999,999,999
COLUMN blevel FORMAT 99
COLUMN index_type FORMAT a27 

--IndexStaleStats.html
COLUMN stale_stats FORMAT a11;

--Columns.html
COLUMN num_distinct FORMAT 9,999,999,999
COLUMN density FORMAT 0.999999 -- This is a truncated density to make more columns visible on the left side of Columns.txt
COLUMN num_nulls FORMAT 9,999,999,999
COLUMN nullable FORMAT a8
COLUMN histogram FORMAT a15
COLUMN num_buckets FORMAT 999,999
COLUMN data_length FORMAT 999,999
COLUMN avg_col_len FORMAT 999,999
COLUMN data_type FORMAT a30
COLUMN "Full Density" FORMAT 0.9999999999999999 -- Full density displayed as the last column on the right side of Columns.txt

--ViewDefinitions.html
COLUMN view_name FORMAT a30
COLUMN text FORMAT a300

--Triggers.html
COLUMN trigger_name FORMAT a30
COLUMN triggering_event FORMAT a30
COLUMN trigger_body FORMAT a300

--SegmentStatistics.html
COLUMN "% of Total" FORMAT 90.99
COLUMN logical_reads FORMAT 999,999,999,999,999
COLUMN physical_reads FORMAT 999,999,999,999,999
COLUMN physical_read_requests FORMAT 999,999,999,999,999
COLUMN physical_writes FORMAT 999,999,999,999,999
COLUMN physical_write_requests FORMAT 999,999,999,999,999
COLUMN segment_scans FORMAT 999,999,999,999,999
COLUMN db_block_changes FORMAT 999,999,999,999,999
COLUMN row_lock_waits FORMAT 999,999,999,999,999
COLUMN buffer_busy_waits FORMAT 999,999,999,999,999

--SqlByElapsedTime.html
COLUMN elapsed_time_secs FORMAT 999,999,990.999
COLUMN cpu_time_secs FORMAT 999,999,990.999
COLUMN Elap_per_Exec FORMAT 999,999,990.999
COLUMN executions FORMAT 999,999,999,999,999
COLUMN rows_processed FORMAT 999,999,999,999,999
COLUMN parse_calls FORMAT 999,999,999,999,999
COLUMN disk_reads FORMAT 999,999,999,999,999
COLUMN direct_writes FORMAT 999,999,999,999,999
COLUMN buffer_gets FORMAT 999,999,999,999,999
COLUMN fetches FORMAT 999,999,999,999,999
COLUMN end_of_fetch_count FORMAT 999,999,999,999,999
COLUMN loads FORMAT 999,999,999,999,999
COLUMN version_count FORMAT 999,999,999,999,999
COLUMN sorts FORMAT 999,999,999,999,999
COLUMN sharable_mem FORMAT 999,999,999,999,999
COLUMN total_sharable_mem FORMAT 999,999,999,999,999
COLUMN application_wait_time FORMAT 999,999,999,999,999
COLUMN concurrency_wait_time FORMAT 999,999,999,999,999
COLUMN cluster_wait_time FORMAT 999,999,999,999,999
COLUMN user_io_wait_time FORMAT 999,999,999,999,999
COLUMN plsql_exec_time FORMAT 999,999,999,999,999

--SqlByBufferGets.html
COLUMN "% Total Gets" FORMAT 990.99
COLUMN Gets_per_Exec FORMAT 999,999,999,999,999

--SqlByDiskReads.html
COLUMN "% Total Reads" FORMAT 990.99
COLUMN Reads_per_Exec FORMAT 999,999,999,999,999

--SqlByExecutionCount.html
COLUMN rows_per_exec FORMAT 999,999,999,999,999

--ActiveSql.html
COLUMN elapsed_time FORMAT 999,999,999,999,999

--SqlLiterals.html
COLUMN force_matching_signature FORMAT 99999999999999999999;

--SqlPlanBaselines.html
COLUMN signature FORMAT 999999999999999999999999999999999999999999999999999999999999 --60 digits overkill, but works
COLUMN enabled FORMAT A7;
COLUMN accepted FORMAT A8;
COLUMN fixed FORMAT A5;
COLUMN reproduced FORMAT A10;
COLUMN autopurge FORMAT A9;
COLUMN adaptive FORMAT A8;
COLUMN cpu_time FORMAT 999,999,999,999,999

--FullSqlTextAndPlans.html
COLUMN parsing_schema_name FORMAT a20
COLUMN child_number FORMAT 999999999999
COLUMN plan_hash_value FORMAT 999999999999999
