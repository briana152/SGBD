
------------EX7--------
----sa se afiseze pentru fiecare magazin angajatii care au peste varsta data
----daca nu exista angajati care sa aibe peste varsta respectiva se afiseaza un mesaj


CREATE OR REPLACE PROCEDURE Ex7 (age angajat.varsta_angajat%TYPE)
AS 
    CURSOR magazine IS
        SELECT tara_magazin, id_magazin
        FROM MAGAZIN;
        
    m magazine%ROWTYPE;
    
    CURSOR angajati(id_m MAGAZIN.ID_MAGAZIN%TYPE) IS
                SELECT nume_angajat, prenume_angajat, functie
                FROM ANGAJAT a
                WHERE a.varsta_angajat >= age AND a.id_magazin = id_m;
                
    a angajati%ROWTYPE;
    numar NUMBER(6);
    
BEGIN

    FOR m in magazine LOOP
        DBMS_OUTPUT.PUT_LINE( 'Magazinul din ' || m.tara_magazin);
        DBMS_OUTPUT.PUT_LINE('------------------------');
        
        UPDATE angajat 
        SET varsta_angajat = varsta_angajat + 0
        WHERE angajat.varsta_angajat >= age and angajat.id_magazin = m.id_magazin;
        
        if SQL%FOUND THEN
        
        FOR a in angajati(m.id_magazin) LOOP
            DBMS_OUTPUT.PUT_LINE( a.nume_angajat || ' ' || a.prenume_angajat || ' ' || a.functie);
            END LOOP;
            
        ELSE DBMS_OUTPUT.PUT_LINE('Nu s-a gasit niciun angajat.');
        
        END IF;
        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.NEW_LINE;
        
    END LOOP;
END;
/

BEGIN
    Ex7(100);
    Ex7(30);
END;
/