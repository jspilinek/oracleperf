COL dbtime NEW_VALUE dbtime;
SELECT ROUND(value/1000000,2) AS dbtime FROM V$SYS_TIME_MODEL WHERE stat_name='DB time';
