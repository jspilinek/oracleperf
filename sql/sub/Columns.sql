SELECT col.owner,
    col.table_name,
    col.column_name,
    col.num_distinct,
    col.density,
    col.num_nulls,
    col.nullable,
    tab.num_rows,
    col.sample_size,
    ROUND((col.sample_size/NVL(NULLIF(tab.num_rows-col.num_nulls,0),1))*100,2) AS "Sample Percent",
    TO_CHAR(col.last_analyzed,'YYYY-MM-DD HH24:MI:SS') AS LAST_ANALYZED,
    col.histogram,
    col.num_buckets,
    col.data_length,
    col.avg_col_len,
    col.data_type
FROM dba_tab_columns col, dba_tables tab
WHERE col.owner IN (&&schema_list)
    AND tab.table_name=col.table_name 
    AND tab.owner=col.owner
    AND col.num_distinct > 0
ORDER BY col.owner, col.table_name, col.column_name
;
