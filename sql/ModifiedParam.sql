DEF title = 'Modified Parameters (GV$SYSTEM_PARAMETER2)';
DEF filename = 'ModifiedParam.html';
DEF nextpage = 'AllParam.html';
DEF prevpage = 'NonDefaultParam.html';
@@00_begin.sql

@@sql/sub/ModifiedParam.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Parameters that have been modified after instance startup with <b>ALTER SESSION</b>.</p>

@@00_end.sql
