WITH t AS (SELECT COUNT(*) AS count from gv$sql),
ds AS (SELECT COUNT(*) AS count from gv$sql WHERE sql_text LIKE 'SELECT /* DS_SVC */%')
SELECT t.count AS "gv$sql count", ds.count AS "DS_SVC count", 
  ROUND(ds.count/t.count*100,1) AS "% DS_SVC"
FROM t, ds;
