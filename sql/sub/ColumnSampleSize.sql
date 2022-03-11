SELECT col.owner,
  col.table_name,
  col.column_name,
  tab.num_rows,
  col.sample_size,
  ROUND((col.sample_size/NVL(NULLIF(tab.num_rows-col.num_nulls,0),1))*100,2) AS "Sample Percent",
  TO_CHAR(col.last_analyzed,'YYYY-MM-DD HH24:MI:SS') AS "Column LAST_ANALYZED",
  TO_CHAR(tab.last_analyzed,'YYYY-MM-DD HH24:MI:SS') AS "Table LAST_ANALYZED"
FROM dba_tab_columns col, dba_tables tab
WHERE col.owner IN (&&schema_list)
 AND tab.table_name=col.table_name 
 AND tab.owner=col.owner
 AND tab.num_rows > 0
 AND ROUND((col.sample_size/NVL(NULLIF(tab.num_rows-col.num_nulls,0),1))*100,2) < 5
ORDER BY col.owner, col.table_name, col.column_name;
