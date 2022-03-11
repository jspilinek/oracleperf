DEF title = 'Index Sample Size (dba_indexes)';
DEF filename = 'IndexSampleSize.html';
DEF nextpage = 'IndexNullAnalyzed.html';
DEF prevpage = 'IdColumnNoIndexes.html';
@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>Sample Percent < 5%:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/IndexSampleSize.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Statistics with a low sample size might cause performance issues.</p>

@@00_end.sql
