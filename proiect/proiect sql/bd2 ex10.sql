----------EX10------
------Trigger care nu permite actualizarea tabelului REDUCERE
------decat de la 8:00 pana la 21:00, de luni pana sambata

CREATE OR REPLACE TRIGGER Ex10
 BEFORE INSERT OR UPDATE OR DELETE ON reducere
BEGIN
IF (TO_CHAR(SYSDATE,'D') = 1) OR (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 8 AND 20)
THEN
RAISE_APPLICATION_ERROR(-20001,'Tabelul REDUCERE nu poate fi actualizat momentan');
END IF;
END;
/
DROP TRIGGER Ex10;
