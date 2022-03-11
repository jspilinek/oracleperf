DEF title = 'Column Sample Size (dba_tab_columns dba_tables)';
DEF filename = 'ColumnSampleSize.html';
DEF nextpage = 'ColumnNullAnalyzed.html';
DEF prevpage = 'LongVarchar2Histograms.html';
@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>Sample Percent < 5%:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/ColumnSampleSize.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Statistics with a low sample size might cause performance issues.</p>

@@00_end.sql
