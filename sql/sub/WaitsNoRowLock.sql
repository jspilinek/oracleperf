WITH WaitTotal AS (
SELECT SUM(time_waited/100) as total
FROM GV$SYSTEM_EVENT 
WHERE wait_class !='Idle'
AND event != 'enq: TX - row lock contention'
)
SELECT * FROM (
SELECT inst_id,
    event AS "Wait Event",
    wait_class AS "Wait Class",
    ROUND(time_waited/100) AS "Time Waited (s)",
    ROUND(time_Waited/total) AS "Percentage",
    '<a href="https://www.google.com/search?q=' || event || '">https://www.google.com/search?q=' || event || '</a>' as Link
FROM GV$SYSTEM_EVENT, WaitTotal
WHERE wait_class !='Idle'
AND event != 'enq: TX - row lock contention'
ORDER BY time_waited DESC
) WHERE "Percentage" > 1
ORDER BY rownum ASC;
