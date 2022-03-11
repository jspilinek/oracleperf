DEF title = 'Extended Statistics (dba_stat_extensions dba_tab_col_statistics)';
DEF filename = 'ExtendedStatistics.html';
DEF nextpage = 'FrequencyHistograms.html';
DEF prevpage = 'Columns.html';
@@00_begin.sql

@@sql/sub/ExtendedStatistics.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>The information in this report is useful when tuning SQL and to understand if the statistics
PRO agree with the tables indexes. Generally ignorable. Used for advanced analysis.</p>

@@00_end.sql
