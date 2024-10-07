SELECT
child_number,
plan_hash_value,
disk_reads,
physical_read_requests,
physical_read_bytes,
physical_write_requests,
physical_write_bytes,
round(disk_reads/nvl(nullif(executions,0),1)) as Disk_Reads_per_Exec,
round(physical_read_requests/nvl(nullif(executions,0),1)) as physical_read_requests_per_Exec,
round(physical_read_bytes/nvl(nullif(executions,0),1)) as physical_read_bytes_per_Exec,
round(physical_write_requests/nvl(nullif(executions,0),1)) as physical_write_requests_per_Exec,
round(physical_write_bytes/nvl(nullif(executions,0),1)) as physical_write_bytes_per_Exec
FROM v$sql
WHERE sql_id = '&&enteredSQLID'
ORDER BY last_active_time DESC;
