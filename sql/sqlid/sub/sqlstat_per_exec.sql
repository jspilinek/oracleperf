SELECT
plan_hash_value,
round(elapsed_time/1000000/nvl(nullif(executions,0),1),3) as Elap_per_Exec,
round(rows_processed/nvl(nullif(executions,0),1)) rows_per_exec,
round(fetches/nvl(nullif(executions,0),1)) fetches_per_exec,
round(buffer_gets/nvl(nullif(executions,0),1)) as Buffer_Gets_per_Exec,
round(disk_reads/nvl(nullif(executions,0),1)) as Disk_Reads_per_Exec,
round(direct_writes/nvl(nullif(executions,0),1)) as Direct_Writes_per_Exec,
round(direct_reads/nvl(nullif(executions,0),1)) as Direct_Reads_per_Exec,
round(cpu_time/1000000/nvl(nullif(cpu_time,0),1),3) as CPU_per_Exec,
round(user_io_wait_time/1000000/nvl(nullif(user_io_wait_time,0),1),3) as User_IO_Wait_per_Exec,
round(application_wait_time/1000000/nvl(nullif(application_wait_time,0),1),3) as Application_Wait_per_Exec,
round(concurrency_wait_time/1000000/nvl(nullif(concurrency_wait_time,0),1),3) as Concurrency_Wait_per_Exec,
round(cluster_wait_time/1000000/nvl(nullif(cluster_wait_time,0),1),3) as Cluster_Wait_per_Exec,
round(plsql_exec_time/1000000/nvl(nullif(plsql_exec_time,0),1),3) as Plsql_per_Exec
FROM v$sqlstats 
WHERE sql_id = '&&enteredSQLID';
