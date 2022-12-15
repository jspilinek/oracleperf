DEF title = 'Non-default Parameters (GV$SYSTEM_PARAMETER2)';
DEF filename = 'NonDefaultParam.html';
DEF nextpage = 'ModifiedParam.html';
DEF prevpage = 'ImportantParam.html';
@@00_begin.sql

@@sql/sub/NonDefaultParam.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Parameters with non-default value specified in the parameter file.</p>
PRO <p>Check for any hidden parameters (name starts with underscore). Typically hidden parameters
PRO should only be set when provided by Oracle Support.</p>

PRO <script>HighlightHiddenParam()</script>

@@00_end.sql
