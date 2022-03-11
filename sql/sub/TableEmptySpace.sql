WITH dbBlockSize AS (
SELECT value FROM v$parameter WHERE name = 'db_block_size'
)
SELECT OWNER,
  TABLE_NAME,
  TRUNC(TRUNC(((((dbBlockSize.value)*blocks)*(1-(pct_free/100)))-(num_rows*avg_row_len))/1024/1024,2)/TRUNC(((dbBlockSize.value)*blocks)/1024/1024,2),2)*100 || '%' AS "% Unused",
  TRUNC(((dbBlockSize.value)*blocks)/1024/1024,2) allocated_space_MB,
  TRUNC((num_rows*avg_row_len)/1024/1024,2) used_space_MB,
  TRUNC(((((dbBlockSize.value)*blocks)*(1-(pct_free/100)))-(num_rows*avg_row_len))/1024/1024,2) unused_MB,
  NUM_ROWS,
  BLOCKS,
  AVG_ROW_LEN,
  PCT_FREE,
  CHAIN_CNT,
  TO_CHAR(LAST_ANALYZED,'YYYY-MM-DD HH24:MI:SS') AS LAST_ANALYZED,
  sample_size,
  ROUND((sample_size/NVL(NULLIF(num_rows,0),1))*100,2) sample_per
FROM dba_tables, dbBlockSize
WHERE OWNER IN (&&schema_list)
   AND TRUNC(((((dbBlockSize.value)*blocks)*(1-(pct_free/100)))-(num_rows*avg_row_len))/1024/1024,2) > 1000 --limit 1000 MB
ORDER BY unused_MB DESC;
