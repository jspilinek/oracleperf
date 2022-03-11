SELECT owner,
  table_name,
  num_rows,
  blocks,
  avg_row_len,
  pct_free
FROM dba_tables
WHERE owner IN (&&schema_list)
  AND pct_free <> 10
ORDER BY owner, table_name;
