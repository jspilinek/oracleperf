SELECT *
  FROM GV$SYSTEM_PARAMETER2
WHERE name IN (
'memory_max_target',
'memory_target',
'optimizer_adaptive_features',
'optimizer_adaptive_statistics',
'optimizer_dynamic_sampling',
'optimizer_features_enable',
'optimizer_index_caching',
'optimizer_index_cost_adj',
'optimizer_mode',
'pga_aggregate_target',
'sga_max_size',
'sga_target')
 ORDER BY
       name,
       inst_id,
       ordinal;
