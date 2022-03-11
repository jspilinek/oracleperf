DEF title = 'Undo Check';
DEF filename = 'UndoCheck.html';
DEF nextpage = 'Tables.html';
DEF prevpage = 'Blobs.html';
@@00_begin.sql

@@sql/sub/UndoCheck.sql
@@sql/sub/SnapshotTooOld.sql
@@sql/sub/UndoStat.sql

PRO Undo Parameters:
show parameters undo

@@sql/sub/UndoSize.sql
@@sql/sub/UndoPerSec.sql

SET MARK HTML OFF;
PRO <h2>Comments</h2>
PRO <p>Problems with the rollback result in "ORA-01555 snapshot too old" errors. To prevent this
PRO error make sure <b>ACTUAL UNDO SIZE</b> > <b>NEEDED UNDO SIZE</b>. There are a few options to
PRO address this problem:</p>
PRO <ul><li>Decrease <b>undo_retention</b> parameter which is measured in seconds</li>
PRO <li>Increase the size the undo tablespace</li>
PRO <li>Adress the operation(s) which are making the most use of rollback. Generally tuning the
PRO worst SQL will address this by reducing the duration of how long rollback is held by a
PRO transaction.</li>
PRO </ul>
PRO <p><b>Longest Query (sec)</b> can be used to estimate the proper setting for
PRO <b>undo_retention</b> parameter.</p>

@@00_end.sql
