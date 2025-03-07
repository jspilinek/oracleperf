SELECT owner, table_name, degree 
FROM dba_tables 
WHERE owner IN (&&schema_list) 
AND TRIM(degree) <> 'DEFAULT'
AND TRIM(degree) <> '1';
