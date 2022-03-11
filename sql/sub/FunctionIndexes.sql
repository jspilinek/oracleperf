SELECT i.owner, 
  i.table_name,
  i.index_name, 
  e.column_expression,
  e.column_position,
  i.distinct_keys,
  i.avg_data_blocks_per_key,
  i.avg_leaf_blocks_per_key,
  i.clustering_factor,
  i.leaf_blocks,
  i.blevel
FROM DBA_INDEXES i,DBA_IND_EXPRESSIONS e
WHERE i.owner IN (&&schema_list)
 AND i.index_name=e.index_name 
 AND i.owner= e.index_owner 
ORDER BY i.owner, i.table_name, i.index_name, e.column_position;
