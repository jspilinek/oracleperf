DEF title = 'SGA Info (V$SGAINFO)';
DEF filename = 'SgaInfo.html';
DEF nextpage = 'SgaTargetAdvice.html';
DEF prevpage = 'SystemStatistics.html';
@@00_begin.sql

@@sql/sub/SgaInfo.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Values to make note of:</p>
PRO <ul><li><b>Maximum SGA Size</b>: Is the max SGA set appropriately?</li>
PRO <li><b>Free SGA Memory Available</b>: 
PRO <ul><li>Automatic Memory Management (AMM): <b>Free SGA Memory Available</b> is the PGA</li>
PRO <li>Automatic Shared Memory Management (ASMM): <b>Free SGA Memory Available</b> idealy should be zero. 
PRO If not, check <b>sga_max_size</b> vs. <b>sga_target</b></li></ul>
PRO <li><b>Buffer Cache Size</b>: Should be largest region in the SGA (75% or higher)</li></ul>

PRO <script>SgaInfo()</script>

@@00_end.sql
