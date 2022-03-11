SELECT COUNT(*) child_cursors, s.sql_id, 
  (SELECT v.sql_text FROM gv$sql v WHERE v.sql_id = s.sql_id AND ROWNUM = 1) sql_text
FROM gv$sql s
GROUP BY s.sql_id
HAVING COUNT(*) > 49
ORDER BY child_cursors DESC, s.sql_id;
