SELECT i.owner, i.table_name,i.index_name, i.FUNCIDX_STATUS,i.STATUS
FROM dba_indexes i
WHERE i.owner IN (&&schema_list) 
AND (i.FUNCIDX_STATUS ='DISABLED' OR i.STATUS !='VALID')
ORDER BY i.owner, i.table_name, i.index_name;
