DEF title = 'Worst SQL by Execution Count (V$SQLSTATS)';
DEF filename = 'SqlByExecutionCount.html';
DEF nextpage = 'SqlByRowCount.html';
DEF prevpage = 'SqlByDiskReads.html';
@@00_begin.sql

SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sub/SqlByExecutionCount.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>SQL statements which execute tens of thousands or hundreds of thousands of time generally indicate an
PRO application SPR. It is sometimes possible to use this information to check for SPRs but in other cases
PRO a POM log or profiler for "too slow" operations are necessary in order to correct the problem.
PRO The exception to this is spotting when there is cache thrashing occurring.  If queries for 
PRO the remoteObjectInfo and either the WTUser or WTGroup table appear here, it indicates the principal cache is undersized.</p>

@@00_end.sql
