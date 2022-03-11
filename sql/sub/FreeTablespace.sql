SELECT ts.tablespace_name,
fileCount,
TRUNC(sizeMB, 2) as sizeMB,
TRUNC(sizeMB - freeMB, 2) as usedMB,
df.maxExtMB,
TRUNC(fr.freeMB, 2) as freeMB,
(fr.freeMB / df.sizeMB) * 100 as percFree
FROM (SELECT tablespace_name,
SUM(bytes) / (1024 * 1024) as freeMB
FROM dba_free_space
GROUP BY tablespace_name) fr,
(SELECT tablespace_name,
SUM(bytes) / (1024 * 1024) as sizeMB,
COUNT(*) as fileCount,
SUM(maxbytes) / (1024 * 1024) as maxExtMB
FROM dba_data_files
GROUP BY tablespace_name) df,
(SELECT tablespace_name
FROM dba_tablespaces) ts
WHERE fr.tablespace_name = df.tablespace_name (+)
AND fr.tablespace_name = ts.tablespace_name (+)
ORDER BY percFree;
