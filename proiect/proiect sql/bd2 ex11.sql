INSERT INTO COMANDA VALUES
(9999,3,2,111,1,TO_DATE('20220302', 'yyyymmdd'),TO_DATE('20220314', 'yyyymmdd'),3,76.09,56789,54,'euro','livrata','Std Stefan cel Mare nr 45, Bacau');

select * from comanda;

INSERT INTO DETALII_COMANDA VALUES
(999,9999,1118,1);

select * from detalii_comanda;


-----------EX11-----------
------Trigger care sterge automat toate randurile din tabelul detalii_comanda
------care au legatura cu o comanda stearsa din bd


CREATE OR REPLACE TRIGGER Ex11
AFTER DELETE ON comanda FOR EACH ROW
declare
    id_temp number;
begin
    id_temp := :OLD.id_comanda;
    delete from detalii_comanda where id_comanda = id_temp;
END;

DELETE FROM comanda WHERE id_comanda = 9999; 
select * from comanda;
select * from detalii_comanda;
