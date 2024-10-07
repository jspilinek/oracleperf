SELECT parsing_schema_name,
version_count,
module,
sql_profile,
sql_patch,
sql_plan_baseline
FROM v$sqlarea
WHERE sql_id = '&&enteredSQLID';
