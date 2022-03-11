SELECT * FROM (
SELECT signature, 
  sql_handle, 
  SUBSTR(sql_text,0,128) AS sql_text,
  plan_name,
  creator,
  origin,
  parsing_schema_name,
  description,
  version,
  created,
  last_modified,
  last_executed,
  last_verified,
  enabled,
  accepted,
  fixed,
  reproduced,
  autopurge,
  adaptive,
  optimizer_cost
  module,
  action,
  executions,
  elapsed_time,
  cpu_time,
  buffer_gets,
  disk_reads,
  direct_writes,
  rows_processed,
  fetches,
  end_of_fetch_count
FROM DBA_SQL_PLAN_BASELINES
WHERE parsing_schema_name IN (&&schema_list)
ORDER BY last_executed DESC)
WHERE ROWNUM <= 100;
