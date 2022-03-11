DEF title = 'System Statistics (SYS.AUX_STATS$)';
DEF filename = 'SystemStatistics.html';
DEF nextpage = 'SgaInfo.html';
DEF prevpage = 'TimeModel.html';
@@00_begin.sql

@@sql/sub/SystemStatistics.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>System Statistics enable the optimizer to make cost estimations using information about the
PRO system hardware. By default noworkload statistics are only available for:</p>
PRO <ul><li>CPUSPEEDNW</li>
PRO <li>IOSEEKTIM</li>
PRO <li>IOTFRSPEED</li></ul>
PRO <p>Below are expected and normal values. Values greatly outside of these ranges indicate a 
PRO potential problem with the statistics which could/will cause incorrect and bad execution plans. 
PRO Note these values were provided by Oracle Support years ago and may no longer be applicable.</p>
PRO <ul><li><b>SREADTIM</b> between 2 and 30</li>
PRO <li><b>MREADTIM</b> between 3 and 40</li>
PRO <li><b>MBRC</b> between 1 and 256</li>
PRO <li><b>CPUSPEED</b> between 400 and 5000</li>
PRO <li><b>SREADTIM</b> should be significantly lower than <b>MREADTIM</b></li></ul>

@@00_end.sql