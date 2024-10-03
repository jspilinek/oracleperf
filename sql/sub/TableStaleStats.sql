SELECT m.table_owner as "OWNER",
m.table_name,
s.stale_stats,
s.num_rows,
to_char(s.last_analyzed, 'yyyy-mm-dd hh24:mi:ss') as "LAST_ANALYZED",
(m.inserts + m.updates + m.deletes) as "Total Modifications",
m.inserts,
m.updates,
m.deletes,
to_char(m.timestamp, 'yyyy-mm-dd hh24:mi:ss') as "last modified",
m.truncated
FROM dba_tab_modifications m
LEFT OUTER JOIN dba_tab_statistics s ON s.owner = m.table_owner AND s.table_name = m.table_name
WHERE m.table_owner IN (&&schema_list)
ORDER BY "Total Modifications" DESC
;
