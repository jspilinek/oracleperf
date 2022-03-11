WITH SgaMax AS (
SELECT ROUND(bytes/1048576,1) AS SgaMaxMB, inst_id
FROM GV$SGAINFO 
WHERE name = 'Maximum SGA Size'
)
SELECT s.name, ROUND(s.bytes/1048576,1) AS MB, ROUND(s.bytes/1048576/SgaMax.SgaMaxMB*100) AS "Percentage", s.resizeable, s.inst_id 
FROM GV$SGAINFO s, SgaMax
WHERE s.inst_id = SgaMax.inst_id
ORDER BY s.inst_id, MB DESC;
