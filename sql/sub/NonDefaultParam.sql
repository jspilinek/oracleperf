SELECT *
FROM gv$system_parameter2
WHERE isdefault = 'FALSE'
ORDER BY name, inst_id, ordinal;
