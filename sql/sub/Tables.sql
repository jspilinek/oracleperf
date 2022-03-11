SELECT OWNER,TABLE_NAME,NUM_ROWS,BLOCKS,AVG_ROW_LEN,CHAIN_CNT,
  TO_CHAR(LAST_ANALYZED,'YYYY-MM-DD HH24:MI:SS') AS LAST_ANALYZED,
  sample_size,ROUND((sample_size/NVL(NULLIF(num_rows,0),1))*100,2) SAMPLE_PERCENT
FROM dba_tables
WHERE OWNER IN (&&schema_list)
ORDER BY OWNER,TABLE_NAME;