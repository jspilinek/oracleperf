SELECT SUM(a.bytes)/1048576 "Undo (MB)", TABLESPACE_NAME
  FROM v$datafile a,
       v$tablespace b,
       dba_tablespaces c
 WHERE c.contents = 'UNDO'
   AND c.status = 'ONLINE'
   AND b.name = c.tablespace_name
   AND a.ts# = b.ts#
   group by TABLESPACE_NAME;
