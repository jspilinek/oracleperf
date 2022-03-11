SELECT owner,
    table_name,
    trigger_name,
    trigger_type,
    triggering_event,
    status,
    trigger_body
FROM DBA_TRIGGERS 
WHERE owner IN (&&schema_list)
ORDER BY owner, table_name;
