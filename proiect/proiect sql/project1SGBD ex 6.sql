
------------EX6--------
----pentru un magazin al carei tara este data vrem sa afisam pentru fiecare curier
----ce masini conduc:

CREATE OR REPLACE PROCEDURE Ex6 (tara MAGAZIN.tara_magazin%TYPE)
AS 
    TYPE tabel_idx IS TABLE OF masina%rowtype INDEX BY PLS_INTEGER;
    masini tabel_idx;
    
    TYPE angajat_rec is RECORD(
    id_angajat angajat.id_angajat%TYPE,
    id_magazin angajat.id_magazin%TYPE,
    nume angajat.nume_angajat%TYPE,
    prenume angajat.prenume_angajat%TYPE,
    functie angajat.functie%TYPE);
    
    TYPE my_nested_table IS TABLE OF angajat_rec;
    angajati my_nested_table := my_nested_table();

    numar NUMBER(6);
    numar1 NUMBER(6);
    
BEGIN
    
    SELECT COUNT(*)
    INTO numar
    FROM angajat 
    WHERE functie = 'curier';
    
    angajati.extend(numar + 1);
    
    SELECT a.id_angajat,a.id_magazin, a.nume_angajat, a.prenume_angajat, a.functie
    BULK COLLECT INTO angajati
    FROM angajat a, magazin s
    WHERE a.functie = 'curier' and a.id_magazin=s.id_magazin
    AND UPPER(s.tara_magazin) LIKE  UPPER(tara);
    
    FOR i IN angajati.first..angajati.last LOOP
        DBMS_OUTPUT.PUT_LINE('Curierul '||angajati(i).nume||' conduce urm masini:');
        
        SELECT COUNT(*)
        INTO numar1
        FROM masina m
        WHERE m.id_curier = angajati(i).id_angajat;
        
        IF numar1 = 0 THEN
            DBMS_OUTPUT.PUT_LINE('nu are inca masina');
        END IF;
        
        IF numar1 > 0 THEN 
            SELECT *
            BULK COLLECT INTO masini
            FROM masina m
            WHERE m.id_curier = angajati(i).id_angajat;
            
            FOR j IN 1..numar1 LOOP
                DBMS_OUTPUT.PUT_LINE(j||'. '||masini(j).marca_masina||' '||masini(j).tip_masina||' '||masini(j).nr_matricol);
            END LOOP;
        END IF;
    END LOOP;
    
    
END;
/

BEGIN
    Ex6('romania');
END;
/            
