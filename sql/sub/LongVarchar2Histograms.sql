SELECT col.owner,
    col.table_name,
    col.column_name,
    col.num_distinct,
    col.num_buckets,
    col.histogram,
    col.avg_col_len,
    col.data_length,
    col.data_type
FROM dba_tab_columns col
WHERE col.owner IN (&&schema_list)
 AND col.histogram <> 'NONE'
 AND col.data_type = 'VARCHAR2'
 AND col.num_buckets > 253
 AND col.avg_col_len > 32
ORDER BY col.owner, col.table_name, col.column_name;
