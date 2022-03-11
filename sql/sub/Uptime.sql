SELECT inst_id, 
TO_CHAR(startup_time, 'yyyy-mm-dd hh24:mi:ss') AS "Startup Time",
ROUND((SYSDATE - startup_time)) AS "Days Up",
86400 * (SYSDATE - startup_time) AS "Seconds Up"
FROM GV$INSTANCE
ORDER BY inst_id;
