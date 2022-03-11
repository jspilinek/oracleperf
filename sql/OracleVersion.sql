DEF title = 'Oracle Version (GV$VERSION)';
DEF filename = 'OracleVersion.html';
DEF nextpage = 'Exadata.html';
DEF prevpage = '00_oracleperf.html';
@@00_begin.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>GV$VERSION:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/OracleVersion.sql

PRO
PRO
SET MARK HTML OFF;
PRO <h2>sys.registry$history:</h2>
SET MARK HTML ON TABLE "class=sortable";
@@sql/sub/RegistryHistory.sql

SET MARKUP HTML OFF;
PRO <h2>Comments</h2>
PRO <p><b>GV$VERSION</b>: Check Oracle version and if latest patchset has been installed. Some
PRO features are only available in Enterprise Edition. Installation is Standard Edition if no
PRO edition is mentioned. This can also be used to determine the platform Oracle is installed on.</p>
PRO <p><b>sys.registry$history</b>: List Oracle patches installed</p>

@@00_end.sql
