DEF title = 'Invalid Packages (DBA_OBJECTS)';
DEF filename = 'InvalidPackages.html';
DEF nextpage = 'Waits.html';
DEF prevpage = 'Triggers.html';
@@00_begin.sql

@@sql/sub/InvalidPackages.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Generally ignorable. Used for advanced analysis.</p>

@@00_end.sql
