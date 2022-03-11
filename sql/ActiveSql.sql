DEF title = 'Active SQL (GV$SESSION GV$SQLTEXT)';
DEF filename = 'ActiveSql.html';
DEF nextpage = 'BlockingSql.html';
DEF prevpage = 'DmlActivity.html';
@@00_begin.sql


SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sub/ActiveSql.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>This is useful to find queries that currently executing and never complete. Queries with
PRO zero completed executions will not show up in the worst SQL reports.</p>
PRO <p><b>ELAPSED_TIME</b> format is <i>dd hh:mi:ss</i></p>
PRO <p>When a query has multiple plans use <b>sql_hash_value</b> and <b>sql_child_number</b> to determine if there is a specific plan causing performance hit.</p>

@@00_end.sql
