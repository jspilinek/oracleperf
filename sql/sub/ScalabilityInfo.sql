select CPU_TIME_secs,
  ELAPSED_TIME_Secs,
  ROUND(CPU_TIME_secs/ELAPSED_TIME_Secs*100,2) as percCPU,
  FETCHES,
  ROWS_PROCESSED,
  EXECUTIONS,
  LOADS,
  PARSE_CALLS,
  DISK_READS,
  BUFFER_GETS,
  ROUND(DISK_READS/BUFFER_GETS*100,2) as percDisk
from 
(select sum(CPU_TIME*0.000001) CPU_TIME_secs,
sum(ELAPSED_TIME*0.000001) ELAPSED_TIME_Secs,
sum(FETCHES) FETCHES,
sum(ROWS_PROCESSED) ROWS_PROCESSED,
sum(EXECUTIONS) EXECUTIONS,
sum(LOADS) LOADS,
sum(PARSE_CALLS) PARSE_CALLS,
sum(DISK_READS) DISK_READS,
sum(BUFFER_GETS) BUFFER_GETS
from v$sqlstats) vss;
