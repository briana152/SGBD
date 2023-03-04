---------------EX12-------------
-------Trigger de tip LDD care se declanseaza de fiecare data cand se executa operatii 
-------ALTER, DROP SAU CREATE
-------pentru a testa daca merge vom stoca informatiile intr-un tabel separat

CREATE TABLE LDD_info(  utilizator VARCHAR2(50),
                        baza_de_date VARCHAR2(50),
                        eveniment VARCHAR2(50),
                        nume_obj VARCHAR2(50),
                        tip_obj VARCHAR2(50),
                        data_realizare DATE
                     );
SELECT * FROM LDD_info;

CREATE OR REPLACE TRIGGER Ex12
    AFTER CREATE OR ALTER OR DROP ON SCHEMA
BEGIN
    INSERT INTO LDD_info 
    VALUES(SYS.LOGIN_USER, SYS.DATABASE_NAME, SYS.SYSEVENT, SYS.DICTIONARY_OBJ_NAME, SYS.DICTIONARY_OBJ_TYPE, SYSDATE);
END;
/

CREATE TABLE LOCUINTE ( id_locuinta NUMBER(6) CONSTRAINT id_locuinta_pk PRIMARY KEY,
                        nume_proprietar VARCHAR2(100),
                        oras VARCHAR2(100)
                      );
                      
select * from LOCUINTE; 

ALTER TABLE LOCUINTE 
ADD (prenume_proprietar VARCHAR2(100));

ALTER TABLE LOCUINTE
DROP COLUMN prenume_proprietar;

DROP TABLE LOCUINTE;

SELECT * FROM LDD_info;