SELECT TO_CHAR(BEGIN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS BEGIN_TIME, 
    UNDOBLKS AS "Undo Blocks Consumed",
    MAXQUERYLEN AS "Longest Query (sec)", 
    UNDOBLKS AS "Undo Blocks Consumed", 
    SSOLDERRCNT AS "ORA-01555 Count", 
    NOSPACEERRCNT AS "No Free Space Count"
FROM V$UNDOSTAT 
ORDER BY BEGIN_TIME;
