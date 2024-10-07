SELECT sql_text
FROM v$sqltext
WHERE sql_id = '&&enteredSQLID'
ORDER BY piece asc;
