SELECT owner,
  table_name,
  stattype_locked 
FROM dba_tab_statistics 
WHERE owner IN (&&schema_list)
  AND stattype_locked IS NOT NULL;