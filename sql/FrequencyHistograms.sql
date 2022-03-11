DEF title = 'Columns which *might* have in-appropriate frequency histograms (dba_tab_columns)';
DEF filename = 'FrequencyHistograms.html';
DEF nextpage = 'LongVarchar2Histograms.html';
DEF prevpage = 'ExtendedStatistics.html';
@@00_begin.sql

@@sql/sub/FrequencyHistograms.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>The information in this report is useful when tuning SQL and to understand if Oracle is 
PRO created incorrect frequency histograms because of long data values. Generally ignorable. Used 
PRO for advanced analysis.</p>


@@00_end.sql
