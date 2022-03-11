DEF title = 'PCT_FREE \&lt;\&gt; 10 (dba_tables)';
DEF filename = 'PctFree.html';
DEF nextpage = 'Indexes.html';
DEF prevpage = 'TableDOP.html';

@@00_begin.sql

@@sql/sub/PctFree.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>PCT_FREE is the minimum percentage of free space in a block.</p>
PRO <p>Windchill uses PCT_FREE = 10</p>
PRO <p>Generally this is ignorable. Useful to understand if non-default pct_free is causing issues.</p>

@@00_end.sql
