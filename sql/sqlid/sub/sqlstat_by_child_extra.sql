SELECT
child_number,
plan_hash_value,
loads,
invalidations,
px_servers_executions,
sorts,
sharable_mem,
optimizer_mode,
optimizer_cost
FROM v$sql 
WHERE sql_id = '&&enteredSQLID'
ORDER BY last_active_time DESC;
