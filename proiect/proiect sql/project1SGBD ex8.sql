
--------EX8-------------
-------pentru o tara si o marca data sa se afiseze cati curieri care lucreaza
-------pt magazinul din tara data conduc o masina de marca respectiva



CREATE OR REPLACE FUNCTION Ex8(tara magazin.tara_magazin%TYPE, marca masina.marca_masina%TYPE) RETURN NUMBER 
IS 
    nr_curieri NUMBER;
    TYPE tab1 is table of magazin%ROWTYPE INDEX BY PLS_INTEGER;
    t tab1;
    TYPE tab2 is table of masina%ROWTYPE INDEX BY PLS_INTEGER;
    m tab2;
    --exceptii
    TARA_DOESNT_EXIST EXCEPTION;
    MARCA_DOESNT_EXIST EXCEPTION;
    NO_DATA_FOUND EXCEPTION;

BEGIN 
    
    SELECT *
    BULK COLLECT INTO t
    FROM magazin m
    WHERE upper(m.tara_magazin) like upper(tara);
    
    IF SQL%NOTFOUND THEN
        RAISE TARA_DOESNT_EXIST;
    END IF;
    
    SELECT *
    BULK COLLECT INTO m
    FROM masina m
    WHERE upper(m.marca_masina) like upper(marca);
    
    IF SQL%NOTFOUND THEN
        RAISE MARCA_DOESNT_EXIST;
    END IF;
    
    select count(nume_angajat)
    into nr_curieri
    from angajat a
    join magazin m on a.id_magazin = m.id_magazin
    join masina n on n.id_curier = a.id_angajat
    where upper(m.tara_magazin) like upper(tara) and upper(n.marca_masina) like upper(marca);
    
    IF nr_curieri = 0  THEN
        RAISE NO_DATA_FOUND;
    ELSE RETURN nr_curieri;
    END IF;
    
    EXCEPTION
        WHEN TARA_DOESNT_EXIST THEN
            DBMS_OUTPUT.PUT_LINE('Nu sunt magazine in tara respectiva');
            RETURN -1;
        WHEN MARCA_DOESNT_EXIST THEN
            DBMS_OUTPUT.PUT_LINE('Niciun magazin nu are masini cu marca respectiva');
            RETURN -1;
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Nu s-au gasit curieri din tara respectiva care sa conduca masini de marca respectiva');
            RETURN -1;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Codul de eroare: '  || SQLCODE);
            DBMS_OUTPUT.PUT_LINE('Mesajul erorii: ' || SQLERRM); 
            RETURN -1;
END;
/


DECLARE 
    numar NUMBER;
BEGIN
    numar := Ex8('japonia','toyota');
    IF numar > -1 THEN
        DBMS_OUTPUT.PUT_LINE('Rezultatul este:  ' || numar );
    END IF;
    numar := Ex8('germania','toyota');
    numar := Ex8('sdvdvdv','toyota');
    numar := Ex8('germania','sdcdscs');

END;


    