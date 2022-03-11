DEF title = 'Long VARCHAR2 Columns with Histograms (DBA_TAB_COLUMNS)';
DEF filename = 'LongVarchar2Histograms.html';
DEF nextpage = 'ColumnSampleSize.html';
DEF prevpage = 'FrequencyHistograms.html';
@@00_begin.sql

@@sql/sub/LongVarchar2Histograms.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>VARCHAR2 columns with <b>AVG_COL_LEN</b> > 32 and histogram <b>NUM_BUCKETS</b> > 253</p>
PRO <p>The information in this report is useful when tuning SQL. Oracle will only consider the 
PRO first 32 characters (64 characters in 12c) in the column when generating histogram. If the
PRO first 32 characters does not vary much, then the histograms can be way off. Generally
PRO ignorable. Used for advanced analysis.</p>
PRO <p>See <a href="https://www.ptc.com/en/support/article?n=CS45132">CS45132</a> for example
PRO commands to drop a histogram and set table preference so the histogram will not be recreated.</p>

@@00_end.sql
