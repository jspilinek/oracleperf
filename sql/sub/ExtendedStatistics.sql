SELECT stat.owner,
  stat.table_name,
  stat.column_name, 
  ext.extension extension,
  stat.num_distinct,
  stat.histogram,
  stat.num_nulls,
  stat.avg_col_len
FROM dba_stat_extensions ext, dba_tab_col_statistics stat 
WHERE stat.owner IN (&&schema_list)
    AND ext.extension_name=stat.column_name
    AND stat.owner=ext.owner
    AND stat.table_name=ext.table_name
ORDER BY stat.owner, stat.table_name, stat.column_name;
