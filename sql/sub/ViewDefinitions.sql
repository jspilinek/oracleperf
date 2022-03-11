SELECT owner,
    view_name,
    text
FROM DBA_VIEWS 
WHERE owner IN (&&schema_list)
ORDER BY owner, view_name;