SELECT
plan_hash_value,
loads,
version_count,
invalidations,
px_servers_executions,
round(avg_hard_parse_time/1000000,3) as avg_hard_parse_time,
sorts,
sharable_mem,
total_sharable_mem
FROM v$sqlstats 
WHERE sql_id = '&&enteredSQLID';
