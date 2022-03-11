SELECT 
(SELECT ROUND(VALUE/1073741824) FROM V$OSSTAT WHERE stat_name = 'PHYSICAL_MEMORY_BYTES') AS Total_Physical_Memory_GB, 
(SELECT ROUND(SUM(bytes)/1073741824) FROM
    (SELECT bytes FROM v$sgastat 
    union select value bytes 
        FROM V$SESSTAT s, V$STATNAME n
        WHERE n.STATISTIC# = s.STATISTIC# 
        AND n.name = 'session pga memory'
    )
) AS Oracle_Memory_GB,
(SELECT ROUND(VALUE/1073741824) FROM V$OSSTAT WHERE stat_name = 'FREE_MEMORY_BYTES') AS Free_Memory_GB
FROM dual;
