WITH NoInd AS (
SELECT owner, table_name
FROM DBA_TABLES
WHERE owner IN (&&schema_list)
GROUP BY owner, table_name
MINUS
SELECT table_owner AS owner, table_name
FROM DBA_IND_COLUMNS
WHERE table_owner IN (&&schema_list)
GROUP BY table_owner, table_name)
SELECT t.owner, t.table_name, t.num_rows, TO_CHAR(o.created,'YYYY-MM-DD HH24:MI:SS') AS Created
FROM DBA_TABLES t
INNER JOIN NoInd ON NoInd.owner = t.owner AND NoInd.table_name = t.table_name
INNER JOIN DBA_OBJECTS o ON o.owner = t.owner AND o.object_name = t.table_name
WHERE o.object_type = 'TABLE'
ORDER BY t.owner, t.table_name
;
