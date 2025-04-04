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
    AND TABLE_NAME = 'VERSION'
    AND NUM_ROWS > 0;

  IF v_count > 0 THEN
    DBMS_OUTPUT.PUT_LINE('<li><a href="CodebeamerVersion.html">Codebeamer Version</a></li>');
  END IF;
END;
/

-- SPOOL OFF;
