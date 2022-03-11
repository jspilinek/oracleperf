SELECT *
FROM GV$SYSTEM_PARAMETER2
WHERE ismodified = 'MODIFIED'
ORDER BY name, inst_id, ordinal;
