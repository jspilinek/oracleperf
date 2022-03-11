SELECT owner,
  table_name,
  num_rows,
  blocks,
  avg_row_len,
  chain_cnt,
  ROUND((chain_cnt/NVL(NULLIF(num_rows,0),1))*100,2) AS ChainPercent,
  TO_CHAR(last_analyzed,'YYYY-MM-DD HH24:MI:SS') AS last_analyzed,
  sample_size,ROUND((sample_size/NVL(NULLIF(num_rows,0),1))*100,2) sample_per,
  pct_free
FROM dba_tables
WHERE owner IN (&&schema_list)
  AND chain_cnt>0 
  AND (CHAIN_CNT/NVL(NULLIF(num_rows,0),1)) > 0.01
ORDER BY owner, ChainPercent;
