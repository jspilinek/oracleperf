SELECT 
plan_hash_value,
TO_CHAR(last_active_time, 'YYYY-MM-DD HH24:MI:SS') AS last_active_time,
executions,
parse_calls,
round(elapsed_time/1000000,3) as elapsed_time_secs,
rows_processed,
fetches,
buffer_gets,
disk_reads,
direct_writes,
direct_reads,
round(cpu_time/1000000,3) as cpu_time_secs,
round(user_io_wait_time/1000000,3) as user_io_wait_time,
round(application_wait_time/1000000) as application_wait_time,
round(concurrency_wait_time/1000000) as concurrency_wait_time,
round(cluster_wait_time/1000000) as cluster_wait_time,
round(plsql_exec_time/1000000) as plsql_exec_time
FROM v$sqlstats 
WHERE sql_id = '&&enteredSQLID';
