DEF title = 'Worst SQL By Disk Reads (V$SQLSTATS)';
DEF filename = 'SqlByDiskReads.html';
DEF nextpage = 'SqlByExecutionCount.html';
DEF prevpage = 'SqlByBufferGets.html';
@@00_begin.sql

SET MARK HTML ON TABLE "class=sortable" ENTMAP OFF;

@@sql/sub/SqlByDiskReads.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Physical I/O is far more expensive in terms of time (and resources) to execute than a in
PRO memory access (also known as a buffer get or logical I/O). A physical I/O also becomes a
PRO memory access (buffer get). Use this report to catch SQL statements which slipped through the
PRO first two reports.</p>
PRO <p>Generally this report will show SQL statements which are responsible for either a lot of the
PRO physical I/O (there by pushing other SQL statements out of the buffer and requiring them to be
PRO reloaded causing them to be slower than they otherwise would) or statements which are causing a
PRO lot of logical I/O placing a load on the CPU. In most cases this report and the previous two
PRO (total CPU elapsed and total CPU per execution) and what is needed to identify the SQL 
PRO statements which need to be looked at.  The next reports serve to validate these conclusions.</p>

@@00_end.sql
