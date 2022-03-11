SELECT stat_name, 
    ROUND(value/1000000,2) AS "Time (s)",
    ROUND(value/1000000 / &&dbtime * 100,2) AS "% of DB Time" 
FROM V$SYS_TIME_MODEL 
WHERE value > 0
  AND stat_name NOT LIKE 'background%' 
  AND stat_name NOT LIKE 'RMAN%' 
  AND stat_name NOT LIKE 'DB time' 
ORDER BY value DESC;
