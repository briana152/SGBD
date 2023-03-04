
INSERT INTO COMANDA VALUES
(1177,3,2,111,1,TO_DATE('20220302', 'yyyymmdd'),TO_DATE('20220314', 'yyyymmdd'),3,76.09,56789,54,'euro','livrata','Std Stefan cel Mare nr 45, Bacau');
select * from client;
select * from comanda;
----------EX9-------------
---------pentru un nume dat si o data sa se afiseze numele si prenumele clientului, data plasarii, magazinul, curierul si nr matricol al masinii
---------de comanda plasata la data respectiva de catre clientul respectiv

CREATE OR REPLACE PROCEDURE Ex9(nume client.nume_client%type, prenume client.prenume_client%type, data comanda.data_plasare%type)
AS 
    TYPE table1 IS TABLE OF client%rowtype INDEX BY PLS_INTEGER;
    tab1 table1;
    TYPE table2 IS TABLE OF comanda%rowtype INDEX BY PLS_INTEGER;
    tab2 table2;
    TYPE table3 IS TABLE OF comanda.id_comanda%type INDEX BY PLS_INTEGER;
    tab3 table3;
    
    CURSOR comanda_detalii is
        select nume_client, prenume_client, data_plasare, tara_magazin, nume_angajat, prenume_angajat, nr_matricol
        from comanda co
        join client cl on (co.id_client = cl.id_client)
        join magazin m on (co.id_magazin = m.id_magazin)
        join angajat a on (co.id_curier = a.id_angajat)
        join masina ms on (co.id_masina = ms.id_masina);
    
    temp comanda_detalii%rowtype;
    
    NO_DATA_FOUND1 EXCEPTION;
    NO_DATA_FOUND2 EXCEPTION;
    NO_DATA_FOUND3 EXCEPTION;
    TOO_MANY_ROWS1 EXCEPTION;
    TOO_MANY_ROWS2 EXCEPTION;
    
BEGIN
    SELECT *
    BULK COLLECT INTO tab1
    FROM client c
    WHERE UPPER(c.nume_client) = UPPER(nume) AND UPPER(c.prenume_client) = UPPER(prenume);
    
    IF SQL%NOTFOUND THEN
        RAISE NO_DATA_FOUND1;
    END IF;
    
    IF tab1.count >= 2 THEN
        RAISE TOO_MANY_ROWS1;
    END IF;
    
    SELECT *
    BULK COLLECT INTO tab2
    FROM comanda c
    WHERE c.data_plasare = data;
    
    IF SQL%NOTFOUND THEN
        RAISE NO_DATA_FOUND2;
    END IF;
    
    SELECT id_comanda
    BULK COLLECT INTO tab3
    FROM comanda c
    JOIN client cl ON (c.id_client = cl.id_client)
    WHERE c.data_plasare = data AND UPPER(cl.nume_client) = UPPER(nume) AND UPPER(cl.prenume_client) = UPPER(prenume);
    
    IF SQL%NOTFOUND THEN
        RAISE NO_DATA_FOUND3;
    END IF;
    
    IF tab3.count >= 2 THEN
        RAISE TOO_MANY_ROWS2;
    END IF;
    
    select nume_client, prenume_client, data_plasare, tara_magazin, nume_angajat, prenume_angajat, nr_matricol
    into temp
    from comanda co
    join client cl on (co.id_client = cl.id_client)
    join magazin m on (co.id_magazin = m.id_magazin)
    join angajat a on (co.id_curier = a.id_angajat)
    join masina ms on (co.id_masina = ms.id_masina)
    where upper(cl.nume_client) like upper(nume) and upper(cl.prenume_client) like upper(prenume) and co.data_plasare = data;
    
    IF SQL%NOTFOUND THEN
        RAISE NO_DATA_FOUND3;
    END IF;

    
   
    DBMS_OUTPUT.PUT_LINE(temp.nume_client|| ' ' || temp.prenume_client || ' ' || temp.data_plasare || ' ' || temp.tara_magazin || ' ' || temp.nume_angajat || ' ' || temp.prenume_angajat || ' ' || temp.nr_matricol);
   
    
    EXCEPTION
        WHEN NO_DATA_FOUND1 THEN
            DBMS_OUTPUT.PUT_LINE('Nu exista clienti care sa aiba acest nume!');
        WHEN NO_DATA_FOUND2 THEN
            DBMS_OUTPUT.PUT_LINE('Nu s-a plasat nicio comanda la aceasta data!');
        WHEN NO_DATA_FOUND3 THEN
            DBMS_OUTPUT.PUT_LINE('Clientul acesta nu a plasat nicio comanda la data data!');
        WHEN TOO_MANY_ROWS1 THEN
            DBMS_OUTPUT.PUT_LINE('Exista mai multi clienti cu acest nume!');
        WHEN TOO_MANY_ROWS2 THEN
            DBMS_OUTPUT.PUT_LINE('Clientul acesta a plasat mai multe comenzi la data respectiva!');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Codul de eroare: '  || SQLCODE);
            DBMS_OUTPUT.PUT_LINE('Mesajul erorii: ' || SQLERRM); 
END;
/
BEGIN
    Ex9('gvhgv','Robert','19-JUN-22');
    Ex9('Mihaila','Robert','22-JUN-22');
    Ex9('Mihaila','Robert','19-JUN-22');
    Ex9('Mihaila','Robert','23-APR-22');
    Ex9('Mihaila','Robert','02-MAR-22');
END;
/