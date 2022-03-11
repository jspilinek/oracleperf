DEF title = 'Blobs Over 1 GB';
DEF filename = 'Blobs.html';
DEF nextpage = 'UndoCheck.html';
DEF prevpage = 'TempTablespace.html';
@@00_begin.sql

@@sql/sub/Blobs.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Common large blob issues are with:</p>
PRO <ul><li><b>STREAMDATA LOBLOC</b>: could indicate file vaults are not being used.
PRO See <a href="https://www.ptc.com/en/support/article?n=CS68716">CS68716</a> 
PRO and <a href="https://www.ptc.com/en/support/article?n=CS37197">CS37197</a> for instructions.</li>
PRO <li><b>QUEUEENTRY BLOB$ARGS</b>: could indicate there are currently a huge number of queue
PRO entries. Or there were a huge number of queue entries and now the blob column needs to be
PRO shrunk to reclaim unused space. See <a href="https://www.ptc.com/en/support/article?n=CS295223">
PRO CS295223</a> for instructions.</li>
PRO <li><b>VAULTCLEANUPAUDITLOGS LOG</b>: could indicate autovault cleanup audit logs need to be
PRO manually cleaned up. See <a href="https://www.ptc.com/en/support/article?n=CS44249">CS44249</a>
PRO for instructions.</li>
PRO </ul>

@@00_end.sql
