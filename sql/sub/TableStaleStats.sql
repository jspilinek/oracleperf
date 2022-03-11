SELECT tab.owner,
  tab.table_name,
  tab.stale_stats,
  tab.num_rows,
  tab.sample_size,
  ROUND((tab.sample_size/NVL(NULLIF(tab.num_rows,0),1))*100,2) AS "Sample Percent",
  TO_CHAR(tab.last_analyzed,'YYYY-MM-DD HH24:MI:SS') AS LAST_ANALYZED  
FROM dba_tab_statistics tab
WHERE tab.owner IN (&&schema_list)
 AND tab.stale_stats = 'YES'
ORDER BY tab.owner, tab.table_name
;
