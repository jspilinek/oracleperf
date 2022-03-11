DEF title = 'Worst SQL by Average Elapsed Time (V$SQLSTATS)';
DEF filename = 'SqlByAverageElapsedTime.html';
DEF nextpage = 'SqlByBufferGets.html';
DEF prevpage = 'SqlByElapsedTime.html';
@@00_begin.sql

SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sub/SqlByAverageElapsedTime.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Similar the "Worst SQL by Elapsed Time" section except this section is ordered by largest
PRO average elapsed time. This generally results in longer running statements which have only
PRO executed a few times appearing at the top. There is almost always SQL which can be tuned, the
PRO import thing is to concentrate on tuning the most important statements. For this reason long
PRO running SQL statements which have only executed once or twice are not addressed. Although in
PRO some cases particularly when the statement takes more than several minutes to complete it can 
PRO be wise to look into tuning these statements because a several minute operation will probably 
PRO cause other SQL statements to run more slowly.</p>

@@00_end.sql
