DEF title = 'Table Sample Size (dba_tables)';
DEF filename = 'TableSampleSize.html';
DEF nextpage = 'TableNullAnalyzed.html';
DEF prevpage = 'TablePreferences.html';
@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>Sample Percent < 5%:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/TableSampleSize.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Statistics with a low sample size might cause performance issues.</p>

@@00_end.sql
