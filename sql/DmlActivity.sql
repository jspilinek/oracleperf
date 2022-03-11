DEF title = 'DML Activity (V$SQL)';
DEF filename = 'DmlActivity.html';
DEF nextpage = 'ActiveSql.html';
DEF prevpage = 'SqlByRowCount.html';
@@00_begin.sql

@@sql/sub/DmlActivity.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Gives an idea of the DML activity in the system.  Not usually important, but can give clues
PRO to if some sort of activity is causing undo load on the system. It is rare to see much returned
PRO here, although certain types of queue problems can show up here.</p>

@@00_end.sql
