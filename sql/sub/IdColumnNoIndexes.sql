SELECT owner, table_name, column_name 
FROM dba_tab_columns 
WHERE owner IN (&&schema_list)
    AND column_name LIKE 'ID%' AND NUM_DISTINCT >1 
MINUS
SELECT index_owner as owner, table_name, column_name 
FROM dba_ind_columns
WHERE index_owner IN (&&schema_list)
    AND column_name LIKE 'ID%' 
ORDER BY owner, table_name, column_name;
