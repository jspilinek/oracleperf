SELECT owner, table_name, degree 
FROM dba_tables 
WHERE owner IN (&&schema_list) 
AND degree <> 'DEFAULT'
AND TO_NUMBER(degree) > 1;
