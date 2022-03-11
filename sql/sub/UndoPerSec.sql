SELECT MAX(undoblks/((end_time-begin_time)*3600*24)) as "Undo Blocks per Second"
FROM v$undostat;
