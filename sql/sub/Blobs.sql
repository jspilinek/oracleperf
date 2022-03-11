SELECT seg.owner, seg.tablespace_name, lob.table_name, lob.column_name, seg.segment_name, ROUND(SUM(seg.bytes)/1073741824,1) AS GB
FROM DBA_SEGMENTS seg, DBA_LOBS lob
WHERE seg.owner IN (&&schema_list)
AND seg.segment_name=lob.segment_name
GROUP BY seg.owner, lob.table_name,lob.column_name,seg.tablespace_name,seg.segment_name,seg.segment_type
HAVING SUM(seg.bytes)/1073741824 > 1 -- Filter by 1 GB
ORDER BY GB DESC;
