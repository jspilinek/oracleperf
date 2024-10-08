SELECT 
dbid,
plan_hash_value,
id, 
rpad('*', depth*2, '*') || operation || ' ' || options AS "Operation",
object_name AS "Name",
cardinality AS "Rows",
bytes,
cost,
CASE
WHEN time IS NULL THEN NULL
ELSE
  TO_CHAR(TRUNC(time/3600),'FM9900') || ':' ||
  TO_CHAR(TRUNC(MOD(time,3600)/60),'FM00') || ':' ||
  TO_CHAR(MOD(time,60),'FM00')
END AS "Time",
cpu_cost,
io_cost,
temp_space,
access_predicates,
filter_predicates
FROM dba_hist_sql_plan
WHERE sql_id = '&&enteredSQLID'
ORDER BY dbid, plan_hash_value, id ASC;