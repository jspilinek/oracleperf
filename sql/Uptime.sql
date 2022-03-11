DEF title = 'Uptime (GV$INSTANCE)';
DEF filename = 'Uptime.html';
DEF nextpage = 'Instance.html';
DEF prevpage = 'WindchillVersionHistory.html';
@@00_begin.sql

@@sql/sub/Uptime.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>How long the database has been running. Anything less than 30-60 minutes is probably not
PRO enough to make changes against. If the uptime is measured in weeks the report will likely show
PRO more interesting data than if the uptime is for a few days. It takes looking at a couple of 
PRO these reports to get a sense for what is normal and what is unusual.</p>

@@00_end.sql
