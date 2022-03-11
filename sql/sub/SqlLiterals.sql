WITH fms AS (
SELECT force_matching_signature, COUNT(*) AS count, MIN(sql_id) AS min_sql_id
FROM gv$sqlarea
WHERE force_matching_signature > 0
GROUP BY force_matching_signature
HAVING COUNT(*) > 49)
SELECT fms.count, s.force_matching_signature, s.parsing_schema_name, 
  CASE WHEN o.object_name IS NOT NULL THEN o.object_name||'('||s.program_line#||')' END source,
  s.sql_text
FROM fms, gv$sqlarea s, dba_objects o
WHERE fms.force_matching_signature = s.force_matching_signature
  AND fms.min_sql_id = s.sql_id
  AND o.object_id(+) = s.program_id
ORDER BY fms.count DESC, s.force_matching_signature;
