DEF title = 'Blocking SQL (GV$SESSION GV$SQLTEXT)';
DEF filename = 'BlockingSql.html';
DEF nextpage = 'SqlLiterals.html';
DEF prevpage = 'ActiveSql.html';
@@00_begin.sql

SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sub/BlockingSql.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Identify blocking and waiting sessions</p>

@@00_end.sql
