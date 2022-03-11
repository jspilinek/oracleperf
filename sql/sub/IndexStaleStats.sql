SELECT ind.owner,
  ind.table_name,
  ind.index_name,
  ind.stale_stats,
  ind.distinct_keys,
  ind.num_rows,
  ind.sample_size,
  ROUND((ind.sample_size/NVL(NULLIF(ind.num_rows,0),1))*100,2) AS "Sample Percent",
  TO_CHAR(ind.last_analyzed,'YYYY-MM-DD HH24:MI:SS') AS last_analyzed  
FROM dba_ind_statistics ind
WHERE ind.owner IN (&&schema_list)
 AND ind.stale_stats = 'YES'
ORDER BY ind.owner, ind.table_name,ind.index_name;
