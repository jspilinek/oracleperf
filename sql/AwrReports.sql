DEF filename = '99_AwrReports-Driver.sql';

SET TERMOUT ON;
PRO Generating &&filename
SET TERMOUT OFF;

set serveroutput on size unlimited;
set linesize 1000;
SET HEADING OFF;
SET MARKUP HTML ENTMAP OFF;

SPOOL html/00_oracleperf.html APPEND
PRO <br>
SPOOL sql/99_AwrReports-Driver.sql REPLACE

DECLARE /*gather_info_script*/

    lv_dbid v$database.dbid%TYPE;
    lv_instance_number v$instance.instance_number%TYPE;
    v_snap_id_start number;
    v_snap_id_end number;
    v_total_time number;

BEGIN
dbms_output.put_line('--generated by AwrReports.sql');
    SELECT dbid INTO lv_dbid FROM v$database;
    SELECT instance_number INTO lv_instance_number FROM v$instance;
    
    FOR cur_snap IN (select snap_start, snap_end, total_time from (
    select start_snap.snap_id snap_start, end_snap.snap_id snap_end, start_snap.total_time
    from
        (select sqlstat.snap_id, round(sum(sqlstat.ELAPSED_TIME_DELTA)/1000000) total_time, snap.startup_time 
        from dba_hist_sqlstat sqlstat, dba_hist_snapshot snap 
        where sqlstat.snap_id not in (select max(snap_id) from dba_hist_sqlstat) 
            and sqlstat.snap_id = snap.snap_id
            and snap.begin_interval_time >= SYSDATE - 7 --Only consider the last 7 days
        group by sqlstat.snap_id, snap.startup_time 
        order by total_time desc) start_snap, dba_hist_snapshot end_snap
    where start_snap.snap_id+1 = end_snap.snap_id
        and end_snap.startup_time = start_snap.startup_time --Eliminates snapshots where DB was restarted
    order by start_snap.total_time desc
    ) where rownum <= 5)
    LOOP
        dbms_output.put_line('SET TERMOUT ON;');
        dbms_output.put_line('PRO Generating AWR-Report-'||cur_snap.snap_start||'-'||cur_snap.snap_end||'.html');
        dbms_output.put_line('SET TERMOUT OFF;');
        dbms_output.put_line('SPOOL html/AWR-Report-'||cur_snap.snap_start||'-'||cur_snap.snap_end||'.html REPLACE');
        dbms_output.put_line('SELECT output FROM TABLE(DBMS_WORKLOAD_REPOSITORY.awr_report_html('||lv_dbid||','||lv_instance_number||','||cur_snap.snap_start||','||cur_snap.snap_end||'));');
        dbms_output.put_line('SPOOL html/00_oracleperf.html APPEND');
        dbms_output.put_line('PRO <li><a href="AWR-Report-'||cur_snap.snap_start||'-'||cur_snap.snap_end||'.html">AWR-Report-'||cur_snap.snap_start||'-'||cur_snap.snap_end||'</a> total_sec: '||cur_snap.total_time||'</li>');
        dbms_output.put_line('SPOOL OFF');
    END LOOP;
END;
/
SPOOL OFF
@@sql/99_AwrReports-Driver.sql

SET HEADING ON;