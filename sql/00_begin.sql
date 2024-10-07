SET TERMOUT ON;
PRO Generating &&filename
SET TERMOUT OFF;

SPOOL html/&&filename REPLACE
@@00_header.sql
PRO <br>
PRO <a href="&&mainPage">Back to main page</a>
PRO <br>
PRO [<a href="&&prevpage">Prev</a>] [<a href="&&nextpage">Next</a>]

SET MARKUP HTML ON TABLE "class=sortable";
