SELECT ind.owner,
  ind.table_name,
  ind.index_name,
  ind.distinct_keys,
  ind.num_rows,
  ind.sample_size,
  ROUND((ind.sample_size/NVL(NULLIF(ind.num_rows,0),1))*100,2) AS "Sample Percent",
  TO_CHAR(ind.last_analyzed,'YYYY-MM-DD HH24:MI:SS') AS LAST_ANALYZED  
FROM dba_indexes ind
WHERE ind.owner IN (&&schema_list)
 AND ind.num_rows > 0
 AND ROUND((ind.sample_size/NVL(NULLIF(ind.num_rows,0),1))*100,2) < 5
ORDER BY ind.owner, ind.table_name,ind.index_name;
