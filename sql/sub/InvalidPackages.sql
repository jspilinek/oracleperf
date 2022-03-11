SELECT owner, 
    object_name 
FROM dba_objects 
WHERE owner IN (&&schema_list)
    AND object_type='PACKAGE BODY' 
    AND status='INVALID';
