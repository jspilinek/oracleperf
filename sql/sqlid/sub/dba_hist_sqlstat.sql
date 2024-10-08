SELECT t.end_interval_time, s.*, t.*
FROM dba_hist_sqlstat s
JOIN dba_hist_snapshot t ON t.snap_id = s.snap_id
WHERE s.sql_id = '&&enteredSQLID'
ORDER BY s.dbid, s.snap_id DESC;
