SET FEEDBACK OFF;
SET TERMOUT ON VER OFF;

PRO Enter SQLID to generate report on:
COL enteredSQLID NEW_V enteredSQLID FOR A13;
SELECT NVL(LOWER(TRIM('&3.')), '?') enteredSQLID FROM DUAL;
PRO You entered &&enteredSQLID
WHENEVER SQLERROR EXIT SQL.SQLCODE;
BEGIN
  IF '&&enteredSQLID.' = '?' THEN
    RAISE_APPLICATION_ERROR(-20000, '"&&enteredSQLID." is not a valid entry');
  END IF;
END;
/
WHENEVER SQLERROR CONTINUE;

SET TERMOUT OFF VER OFF;

-- TODO: Validate SQLID is 13 characters

-- SET TERMOUT ON VER OFF;
-- WHENEVER SQLERROR EXIT SQL.SQLCODE;
-- BEGIN
--   IF &&schema_count_found < 1 THEN
--     RAISE_APPLICATION_ERROR(-20000, 'Entered schema name "&&enteredSQLID." was not found');
--   END IF;
-- END;
-- /
-- WHENEVER SQLERROR CONTINUE;

-- SET TERMOUT OFF VER OFF;
/
