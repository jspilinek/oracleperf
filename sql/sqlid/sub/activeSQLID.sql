SELECT LTRIM(TO_CHAR(FLOOR(s.LAST_CALL_ET/86400), '09')) || ' '
        || LTRIM(TO_CHAR(FLOOR(MOD(s.LAST_CALL_ET,86400)/3600), '09')) || ':'
        || LTRIM(TO_CHAR(FLOOR(MOD(s.LAST_CALL_ET, 3600)/60), '09')) || ':'
        || LTRIM(TO_CHAR(MOD(s.LAST_CALL_ET, 60), '09')) AS "ELAPSED_TIME",
    TO_CHAR(s.SQL_EXEC_START, 'yyyy-mm-dd hh24:mi:ss') AS SQL_EXEC_START,
    s.INST_ID,
    s.SID,
    s.SQL_ID,
    q.plan_hash_value,
    q.child_number,
    s.EVENT,
    t.piece AS LINE#,
    REPLACE(t.SQL_TEXT,CHR(10),'') AS SQL_TEXT, 
    s.WAIT_CLASS,
    s.SECONDS_IN_WAIT,
    s.STATE,
    s.USERNAME,
    s.MODULE,
    s.MACHINE,
    s.blocking_session_status,
    s.blocking_instance,
    s.blocking_session
FROM GV$SESSION s
JOIN GV$SQL q ON (s.SQL_ID = q.SQL_ID
    AND s.SQL_ADDRESS    = q.ADDRESS 
    AND s.SQL_HASH_VALUE = q.HASH_VALUE 
    AND s.INST_ID = q.INST_ID
    AND s.SQL_CHILD_NUMBER = q.CHILD_NUMBER)
JOIN GV$SQLTEXT t ON (s.SQL_ID = t.SQL_ID
    AND s.SQL_ADDRESS    = t.ADDRESS 
    AND s.SQL_HASH_VALUE = t.HASH_VALUE 
    AND s.INST_ID = t.INST_ID)
WHERE s.STATUS = 'ACTIVE'
    AND s.USERNAME IS NOT NULL
    AND s.AUDSID <> USERENV('SESSIONID') 
    AND s.sql_id = '&&enteredSQLID'
ORDER BY ELAPSED_TIME DESC, s.INST_ID, s.SID, t.piece;
