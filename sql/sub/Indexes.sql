SELECT ind.owner,
  col.table_name,
  col.index_name,
  col.column_name,
  col.column_position AS "Column#",
  ind.distinct_keys,
  ind.num_rows,
  ind.sample_size,
  ROUND((ind.sample_size/NVL(NULLIF(num_rows,0),1))*100,2) AS "Sample Percent",
  TO_CHAR(ind.last_analyzed,'YYYY-MM-DD HH24:MI:SS') AS LAST_ANALYZED,
  ind.compression,
  ind.clustering_factor,
  ind.avg_data_blocks_per_key,
  ind.avg_leaf_blocks_per_key,
  ind.leaf_blocks,
  ind.blevel,
  ind.index_type
FROM dba_ind_columns col,dba_indexes ind
WHERE ind.owner IN (&&schema_list)
  AND col.index_name=ind.index_name 
  AND col.index_owner=ind.owner
  AND col.table_name NOT LIKE 'AUD\_%' ESCAPE '\'
ORDER BY ind.owner, col.table_name, col.index_name, col.column_position;
