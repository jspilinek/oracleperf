-- SPOOL html/test.html REPLACE

-- SET MARK HTML OFF;
-- SET TERMOUT OFF VER OFF FEEDBACK OFF;
SET SERVEROUTPUT ON SIZE 30000;

DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*)
  INTO v_count
  FROM DBA_TABLES
  WHERE OWNER IN (&&schema_list)
    AND TABLE_NAME = 'WTUPGINST_VERSIONEDASSEMBLY'
    AND NUM_ROWS > 0;

  IF v_count > 0 THEN
    DBMS_OUTPUT.PUT_LINE('<li><a href="WindchillVersion.html">Windchill Version</a></li>');
    DBMS_OUTPUT.PUT_LINE('<li><a href="WindchillVersionHistory.html">Windchill Version History</a></li>');
  END IF;
END;
/

-- SPOOL OFF;
