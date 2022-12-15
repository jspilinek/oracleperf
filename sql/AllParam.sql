DEF title = 'All Parameters (GV$SYSTEM_PARAMETER2)';
DEF filename = 'AllParam.html';
DEF nextpage = 'OsStat.html';
DEF prevpage = 'ModifiedParam.html';
@@00_begin.sql

@@sql/sub/AllParam.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>View all parameters</p>

PRO <script>HighlightHiddenParam()</script>

@@00_end.sql
