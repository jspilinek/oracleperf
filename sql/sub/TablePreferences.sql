SELECT owner, 
  table_name,
  preference_name,
  preference_value
FROM DBA_TAB_STAT_PREFS
WHERE owner IN (&&schema_list)
ORDER BY owner,table_name;
