SELECT 
TO_CHAR(p.timestamp, 'YYYY-MM-DD HH24:MI:SS') AS "timestamp", 
p.*
FROM dba_hist_sql_plan p
WHERE p.sql_id = '&&enteredSQLID'
ORDER BY p.dbid, p.plan_hash_value, p.id ASC;
