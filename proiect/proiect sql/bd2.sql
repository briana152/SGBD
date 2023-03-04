---------------TABEL MAGAZIN---------------

CREATE TABLE MAGAZIN (id_magazin  NUMBER(5) CONSTRAINT PKEY_MAGAZIN PRIMARY KEY,
                        tara_magazin VARCHAR(500) CONSTRAINT tara_magazin NOT NULL,
                        adresa_magazin VARCHAR(300) CONSTRAINT adresa_magazin NOT NULL,
                        telefon_magazin VARCHAR(50) CONSTRAINT telefon_magazin NOT NULL,
                        mail_magazin VARCHAR(50) CONSTRAINT mail_magazin UNIQUE NOT NULL,
                        cod_postal VARCHAR(50)
                        );
                        
INSERT INTO MAGAZIN VALUES
(1,'Japonia',' 219-1130, Ikanikeisaiganaibaai, Musashino-shi,Tokyo','+8141-984-8883','TmangaSTORE-JAPAN@gmail.com','105-0013');
INSERT INTO MAGAZIN VALUES
(2,'Romania','Std Profesor Minculescu nr 34, Iasi','+40754-876-123','TmangaSTORE-ROMANIA@gmail.com','36649');
INSERT INTO MAGAZIN VALUES
(3,'Italia','Strada Provinciale 65 49, Carvico, Bergamo','+390373 5756478','TmangaSTORE-ITALY@gmail.com','54024');
INSERT INTO MAGAZIN VALUES
(4,'Germania','Oeder Weg 50, Hesse, Frankfurt','+4906728 14 75 86','TmangaSTORE-GERMANY@gmail.com','55437');
INSERT INTO MAGAZIN VALUES
(5,'UK','74 Exning Road, London',' +44070 5508 2035','TmangaSTORE-UK@gmail.com','LL46 9RT');

SELECT * FROM magazin;



----------------TABEL ANGAJAT--------------

CREATE TABLE ANGAJAT (id_angajat NUMBER(5) CONSTRAINT PKEY_ANGAJAT PRIMARY KEY,
                        id_magazin NUMBER(5),
                        CONSTRAINT fk_angajat FOREIGN KEY(id_magazin) REFERENCES MAGAZIN (id_magazin),
                        nume_angajat VARCHAR(50) CONSTRAINT nume_angajat NOT NULL,
                        prenume_angajat VARCHAR(50) CONSTRAINT prenume_angajat NOT NULL,
                        varsta_angajat INT CONSTRAINT varsta_angajat NOT NULL,
                        sex_angajat VARCHAR(50) CONSTRAINT sex_angajat NOT NULL,
                        telefon_angajat VARCHAR(50) CONSTRAINT telefon_angajat NOT NULL,
                        functie VARCHAR(50) CONSTRAINT functie NOT NULL,
                        data_angajare DATE CONSTRAINT data_angajare NOT NULL
                        );
                        
INSERT INTO ANGAJAT VALUES
(110,1,'Domen','Tsukiko',23,'barbat','+8199-159-0988','manager',TO_DATE('20211209', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(111,1,'Yogi','Toshio',42,'barbat','+8192-099-0119','curier',TO_DATE('20220103', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(112,1,'Arima','Yasuo',27,'femeie',' +8182-012-7888','casier',TO_DATE('20220112', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(113,1,'Higashihara','Kenwa',22,'barbat','+8165-156-5895','casier',TO_DATE('20220125', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(114,1,'Bando','Yun’A',18,'femeie','+8174-422-3781','femeie/om de serviciu',TO_DATE('20220421', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(115,1,'Kanai','Kuni',30,'barbat','+8147-649-1055','contabil',TO_DATE('20220501', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(120,2,'Petre','Sorin',34,'barbat','+40732-671-544','manager',TO_DATE('20211223', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(121,2,'Popescu','Andrei',52,'barbat','+40736-766-644','curier',TO_DATE('20220107', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(122,2,'Hirdea','Mihaela',33,'femeie','+40725-471-334','casier',TO_DATE('20220227', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(123,2,'Boboc','Mihai',36,'barbat','+40754-970-123','contabil',TO_DATE('20220201', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(124,2,'Duca','Bianca',23,'femeie','+40722-853-451','administrator',TO_DATE('20220513', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(125,2,'Genes','Dana',19,'femeie','+40745-311-666','casier',TO_DATE('20220220', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(126,2,'Dumitrescu','Oana',21,'femeie','+40747-986-909','asistent manager',TO_DATE('20220617', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(127,2,'Opinca','Radu',27,'barbat','+40744-226-746','secretar/a',TO_DATE('20220227', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(130,3,'Cristaldo','Marandola',29,'femeie','+390315 7479930','manager',TO_DATE('20211209', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(131,3,'Sansone','Calise',39,'femeie','+390360 7042929','curier',TO_DATE('20220209', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(132,3,'Salvatore','Pietro',34,'barbat','+39 0334 7615289','casier',TO_DATE('20220118', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(133,3,'De luca','Rebecca',44,'femeie','+390387 6410034','curier',TO_DATE('20220316', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(134,3,'Battaglia ','Giulio',29,'barbat','+390332 4147151','administrator',TO_DATE('20220518', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(135,3,'Gambone','Simona',38,'femeie','+390386 8429767','contabil',TO_DATE('20220418', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(136,3,'Bocci','Lucia ',47,'femeie','+390321 7988774','secretar/a',TO_DATE('20220404', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(140,4,'Wendell','Astor',29,'barbat','+4904746 96 61 81','manager',TO_DATE('20211225', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(141,4,'Vieth','Reiner',38,'barbat','+4902682 33 18 59','curier',TO_DATE('20220208', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(142,4,'Schulze','Manni',26,'femeie','+4906581 62 50 44','contabil',TO_DATE('20220126', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(143,4,'Brandt','Fabian',28,'barbat','+4906581 62 50 44','curier',TO_DATE('20220208', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(144,4,'Schröder','Julie',18,'femeie','+4904746 96 61 81','secretar/a',TO_DATE('20220525', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(145,4,'Busch','Valeria ',19,'femeie','+490911 43 31 23','administrator',TO_DATE('20220414', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(150,5,'Rhys','Lewis',39,'barbat','+44077 2082 4735','manager',TO_DATE('20211215', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(151,5,'Eli','Thomas',45,'barbat','+44078 3886 0633','curier',TO_DATE('20220222', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(152,5,'Bentley','George',24,'barbat','+44070 2301 5654','casier',TO_DATE('20220317', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(153,5,'Coleman','Katy',24,'femeie','+44070 2301 5654','casier',TO_DATE('20220225', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(154,5,'Wade','Edith',21,'femeie','+44070 2301 5654','administrator',TO_DATE('20220326', 'yyyymmdd'));
INSERT INTO ANGAJAT VALUES
(155,5,'Sheldon','Joe ',34,'barbat','+44070 2301 5654','curier',TO_DATE('20220425', 'yyyymmdd'));

SELECT * FROM ANGAJAT;



------------------TABEL SALARII_2022--------------

CREATE TABLE SALARII2022 (id_angajat NUMBER(5) CONSTRAINT id_angajat REFERENCES ANGAJAT(id_angajat),
                            data_incasare_salariu DATE CONSTRAINT data_incasare_salariu NOT NULL,
                            CONSTRAINT PKEY_SALARII2022 PRIMARY KEY(id_angajat, data_incasare_salariu),
                            plata_cu_ora FLOAT CONSTRAINT plata_cu_ora NOT NULL,
                            ore_lucrate INT CONSTRAINT ore_lucrate NOT NULL,
                            bonus_tip VARCHAR(50),
                            bonus_val FLOAT,
                            salariu_total FLOAT,
                            moneda VARCHAR(50)
                            );
                            
INSERT INTO SALARII2022 VALUES
(110,TO_DATE('20220127', 'yyyymmdd'),16.00,300,'bonus manager',134.78,3989.78,'euro');
INSERT INTO SALARII2022 VALUES
(112,TO_DATE('20220127', 'yyyymmdd'),18.00,230,'',0.0,3002.93,'euro');
INSERT INTO SALARII2022 VALUES
(124,TO_DATE('20220127', 'yyyymmdd'),15.00,290,'',0.0,3009.12,'euro');
INSERT INTO SALARII2022 VALUES
(122,TO_DATE('20220127', 'yyyymmdd'),19.00,180,'',0.0,2897.65,'euro');
INSERT INTO SALARII2022 VALUES
(112,TO_DATE('20220127', 'yyyymmdd'),16.00,301,'',0.0,4002.99,'euro');
INSERT INTO SALARII_2022 VALUES
(121,TO_DATE('20220227', 'yyyymmdd'),18.00,381,'bonus curier',523.32,4552.93,'euro');
INSERT INTO SALARII2022 VALUES
(115,TO_DATE('20220227', 'yyyymmdd'),20.00,271,'',0.0,3452.09,'euro');
INSERT INTO SALARII2022 VALUES
(133,TO_DATE('20220227', 'yyyymmdd'),18.00,345,'bonus curier',457.87,4762.99,'euro');
INSERT INTO SALARII2022 VALUES
(126,TO_DATE('20220327', 'yyyymmdd'),19.00,341,'',0.0,4002.99,'euro');
INSERT INTO SALARII2022 VALUES
(123,TO_DATE('20220327', 'yyyymmdd'),20.00,299,'',0.0,4902.29,'euro');
INSERT INTO SALARII2022 VALUES
(132,TO_DATE('20220427', 'yyyymmdd'),17.00,334,'',0.0,3062.99,'euro');
INSERT INTO SALARII2022 VALUES
(127,TO_DATE('20220427', 'yyyymmdd'),17.00,321,'',0.0,3023.49,'euro');
INSERT INTO SALARII2022 VALUES
(136,TO_DATE('20220427', 'yyyymmdd'),17.00,311,'',0.0,4012.11,'euro');
INSERT INTO SALARII2022 VALUES
(120,TO_DATE('20220427', 'yyyymmdd'),16.00,331,'bonus manager',523.99,4402.99,'euro');
INSERT INTO SALARII2022 VALUES
(154,TO_DATE('20220527', 'yyyymmdd'),17.00,309,'',0.0,3212.49,'euro');
INSERT INTO SALARII2022 VALUES
(153,TO_DATE('20220527', 'yyyymmdd'),17.00,315,'',0.0,4032.34,'euro');

SELECT * FROM SALARII2022;


-----------------TABEL MASINA------------

CREATE TABLE MASINA (id_masina NUMBER(5) CONSTRAINT PKEY_MASINA PRIMARY KEY,
                        id_curier NUMBER(5),
                        CONSTRAINT fk_masina FOREIGN KEY (id_curier) REFERENCES ANGAJAT(id_angajat),
                        nr_matricol VARCHAR(50) CONSTRAINT nr_matricol UNIQUE NOT NULL,
                        marca_masina VARCHAR(50) CONSTRAINT marca_masina NOT NULL,
                        tip_masina VARCHAR(50) CONSTRAINT tip_masina NOT NULL
                        );
                        
INSERT INTO MASINA VALUES
(1,111,'5CE9345','Toyota','mica');
INSERT INTO MASINA VALUES
(2,121,'P67HNU','Nissan','mare');
INSERT INTO MASINA VALUES
(3,131,'8ALB027','Nissan','mare');
INSERT INTO MASINA VALUES
(4,133,'CCDF24','Ford','mica');
INSERT INTO MASINA VALUES
(5,141,'6HQB483','Mitsubishi','mica');
INSERT INTO MASINA VALUES
(6,143,'SDDF483','Ford','mare');
INSERT INTO MASINA VALUES
(7,151,'2SS2D33','Toyota','mare');
INSERT INTO MASINA VALUES
(8,155,'SDSQB23DS','Nissan','mica');

SELECT * FROM MASINA;


----------------TABEL CLIENT-----------

CREATE TABLE CLIENT (id_client NUMBER(5) CONSTRAINT PKEY_CLIENT PRIMARY KEY,
                        nume_client VARCHAR(50) CONSTRAINT nume_client NOT NULL,
                        prenume_client VARCHAR(50) CONSTRAINT prenume_client NOT NULL,
                        mail_client VARCHAR(50) CONSTRAINT mail_client UNIQUE NOT NULL,
                        telefon_client VARCHAR(50) CONSTRAINT telefon_client NOT NULL,
                        varsta_client INT CONSTRAINT varsta_client NOT NULL,
                        data_nastere_client DATE CONSTRAINT data_nastere_client NOT NULL,
                        adresa_client VARCHAR(100)
                        );
                        
INSERT INTO CLIENT VALUES
(1,'Merealbe','Briana','bri.mere@yahoo.com','0756234111',20,TO_DATE('20020105', 'yyyymmdd'),'');
INSERT INTO CLIENT VALUES
(2,'Buturuga','Patricia','patri_b@gmail.com','0733908002',21,TO_DATE('20010909', 'yyyymmdd'),'');
INSERT INTO CLIENT VALUES
(3,'Mihaila','Robert','mRobertt@yahoo,com','0754333123',15,TO_DATE('20071219', 'yyyymmdd'),'');
INSERT INTO CLIENT VALUES
(4,'Dobrescu','Diana','diaDobre@yahoo.com','0732654986',20,TO_DATE('20020424', 'yyyymmdd'),'');
INSERT INTO CLIENT VALUES
(5,'Furdui','Andrei','furduiandrei@gmail.com','0756123222',19,TO_DATE('20030404', 'yyyymmdd'),'');

SELECT * FROM CLIENT;


-------------TABEL PRODUS---------

CREATE TABLE PRODUS (id_produs NUMBER(5) CONSTRAINT PKEY_PRODUS PRIMARY KEY,
                        tip_produs VARCHAR(50),
                        genre_produs VARCHAR(50),
                        nume_produs VARCHAR(50) CONSTRAINT nume_produs NOT NULL,
                        pret_unit FLOAT CONSTRAINT pret_unit NOT NULL,
                        moneda_produs VARCHAR(50) CONSTRAINT moneda_produs NOT NULL,
                        descriere_produs VARCHAR(300)
                        );
INSERT INTO PRODUS VALUES
(1111,'manga','action','MY HERO ACADEMIA VOL.28',23.00,'euro','');
INSERT INTO PRODUS VALUES
(1112,'manga','action','TOKYO GHOUL VOL.12',20.99,'euro','');
INSERT INTO PRODUS VALUES
(1113,'manga','action','ATTACK ON TITAN VOL.4',25.00,'euro','');
INSERT INTO PRODUS VALUES
(1114,'manga','action','ATTACK ON TITAN VOL.32',20.5,'euro','');
INSERT INTO PRODUS VALUES
(1115,'manga','action','DEMON SLAYER VOL.18',19.99,'euro','');
INSERT INTO PRODUS VALUES
(1116,'manga','action','JUJUTSU KAISEN VOL.23',21.00,'euro','');
INSERT INTO PRODUS VALUES
(1117,'manga','slice-of-life','BLUE PERIOD VOL.15',22.8,'euro','');
INSERT INTO PRODUS VALUES
(1118,'manga','sport','HAIKYUU VOL.45',20.5,'euro','');

SELECT * FROM PRODUS;


------------------TABEL VANZARE-----------

CREATE TABLE VANZARE (id_magazin NUMBER(5),
                        CONSTRAINT fk_vanzare FOREIGN KEY (id_magazin) REFERENCES MAGAZIN(id_magazin),
                        data_incasare DATE CONSTRAINT data_incasare NOT NULL,
                        CONSTRAINT PKEY_VANZARE PRIMARY KEY(id_magazin, data_incasare),
                        suma_incasata FLOAT CONSTRAINT suma_incasata NOT NULL
                        );
                        
INSERT INTO VANZARE VALUES
(1,TO_DATE('20220103', 'yyyymmdd'),523.03);
INSERT INTO VANZARE VALUES
(4,TO_DATE('20220412', 'yyyymmdd'),249.77);
INSERT INTO VANZARE VALUES
(4,TO_DATE('20220531', 'yyyymmdd'),400.78);
INSERT INTO VANZARE VALUES
(3,TO_DATE('20220228', 'yyyymmdd'),333.23);
INSERT INTO VANZARE VALUES
(2,TO_DATE('20220223', 'yyyymmdd'),232.45);
INSERT INTO VANZARE VALUES
(5,TO_DATE('20220312', 'yyyymmdd'),509.01);
INSERT INTO VANZARE VALUES
(1,TO_DATE('20220413', 'yyyymmdd'),322.03);
INSERT INTO VANZARE VALUES
(3,TO_DATE('20220321', 'yyyymmdd'),432.7);

SELECT * FROM VANZARE;


--------------TABEL REDUCERE------------

CREATE TABLE REDUCERE (cod_reducere NUMBER(5) CONSTRAINT PKEY_REDUCERE PRIMARY KEY,
                        reducere_tip VARCHAR(50) CONSTRAINT reducere_tip NOT NULL,
                        reducere_val INT CONSTRAINT reducere_val NOT NULL,
                        detalii_reducere VARCHAR(100)
                        );
                        
INSERT INTO REDUCERE VALUES
(12345,'reducere la orice horror manga',15,'');
INSERT INTO REDUCERE VALUES
(23456,'reducere de vara',30,'');
INSERT INTO REDUCERE VALUES
(34567,'reducere de Craciun',50,'');
INSERT INTO REDUCERE VALUES
(45678,'reducere de Black Friday',75,'');
INSERT INTO REDUCERE VALUES
(56789,'reducere de angajat',20,'');
INSERT INTO REDUCERE VALUES
(67890,'reducere la orice action manga',15,'');

SELECT * FROM REDUCERE;


------------------TABEL SALE-------------------

CREATE TABLE SALE ( id_sale NUMBER(5) CONSTRAINT PKEY_SALE PRIMARY KEY,
                    id_reducere NUMBER(5),
                    CONSTRAINT fk_reducere_sale FOREIGN KEY (id_reducere) REFERENCES REDUCERE(cod_reducere),
                    id_magazin NUMBER(5),
                    CONSTRAINT fk_magazin_sale FOREIGN KEY (id_magazin) REFERENCES MAGAZIN(id_magazin),
                    data_inceput DATE CONSTRAINT data_inceput NOT NULL,
                    data_sfarsit DATE CONSTRAINT data_sfarsit NOT NULL
                    );
                    
INSERT INTO SALE VALUES
(10000,12345,1,TO_DATE('20220303', 'yyyymmdd'),TO_DATE('20220312', 'yyyymmdd'));
INSERT INTO SALE VALUES
(10123,12345,2,TO_DATE('20220109', 'yyyymmdd'),TO_DATE('20220117', 'yyyymmdd'));
INSERT INTO SALE VALUES
(10369,23456,2,TO_DATE('20220412', 'yyyymmdd'),TO_DATE('20220423', 'yyyymmdd'));
INSERT INTO SALE VALUES
(10615,67890,3,TO_DATE('20220511', 'yyyymmdd'),TO_DATE('20220530', 'yyyymmdd'));
INSERT INTO SALE VALUES
(10183,45678,5,TO_DATE('20220226', 'yyyymmdd'),TO_DATE('20220227', 'yyyymmdd'));

SELECT * FROM SALE;


---------------TABEL STOC----------------

CREATE TABLE STOC (id_stoc NUMBER(5) CONSTRAINT PKEY_STOC PRIMARY KEY,
                    id_magazin NUMBER(5),
                    CONSTRAINT fk_stoc FOREIGN KEY (id_magazin) REFERENCES MAGAZIN(id_magazin),
                    data_livrare DATE CONSTRAINT data_livrare NOT NULL
                    );
                    
INSERT INTO STOC VALUES
(0001,1,TO_DATE('20220101', 'yyyymmdd'));
INSERT INTO STOC VALUES
(0002,2,TO_DATE('20220101', 'yyyymmdd'));
INSERT INTO STOC VALUES
(0003,2,TO_DATE('20220212', 'yyyymmdd'));
INSERT INTO STOC VALUES
(0004,3,TO_DATE('20220101', 'yyyymmdd'));
INSERT INTO STOC VALUES
(0005,5,TO_DATE('20220531', 'yyyymmdd'));
INSERT INTO STOC VALUES
(0006,4,TO_DATE('20220516', 'yyyymmdd'));

SELECT * FROM STOC;


------------------TABEL DETALII STOC-----------

CREATE TABLE DETALII_STOC (id_stocItem NUMBER(5) CONSTRAINT PKEY_stocITEM PRIMARY KEY,
                            id_stoc NUMBER(5),
                            CONSTRAINT fk_stoc_stocITEM FOREIGN KEY (id_stoc) REFERENCES STOC(id_stoc),
                            id_produs NUMBER(5),
                            CONSTRAINT fk_produs_stocITEM FOREIGN KEY (id_produs) REFERENCES PRODUS(id_produs),
                            cantitate_produs_stoc NUMBER(5) CONSTRAINT cantitate_produs_stoc NOT NULL,
                            nume_produs_stoc VARCHAR(50) CONSTRAINT nume_produs_stoc NOT NULL
                            );
                            
INSERT INTO DETALII_STOC VALUES
(88888,1,1118,23,'HAIKYUU VOL.45');
INSERT INTO DETALII_STOC VALUES
(99999,1,1112,31,'TOKYO GHOUL VOL.12');
INSERT INTO DETALII_STOC VALUES
(44444,2,1118,34,'HAIKYUU VOL.45');
INSERT INTO DETALII_STOC VALUES
(11111,2,1117,22,'BLUE PERIOD VOL.15');
INSERT INTO DETALII_STOC VALUES
(55555,3,1112,43,'TOKYO GHOUL VOL.12');
INSERT INTO DETALII_STOC VALUES
(77777,4,1115,12,'DEMON SLAYER VOL.18');

SELECT * FROM DETALII_STOC;



--------------------TABEL COMANDA----------

CREATE TABLE COMANDA (id_comanda NUMBER(5) CONSTRAINT PKEY_COMANDA PRIMARY KEY,
                        id_client NUMBER(5), CONSTRAINT fk_client_comanda FOREIGN KEY (id_client) REFERENCES CLIENT(id_client),
                        id_magazin NUMBER(5), CONSTRAINT fk_magazin_comanda FOREIGN KEY (id_magazin) REFERENCES MAGAZIN(id_magazin),
                        id_curier NUMBER(5), CONSTRAINT fk_curier_comanda FOREIGN KEY (id_curier) REFERENCES ANGAJAT(id_angajat),
                        id_masina NUMBER(5), CONSTRAINT fk_masina_comanda FOREIGN KEY (id_masina) REFERENCES MASINA(id_masina),
                        data_plasare DATE CONSTRAINT data_plasare NOT NULL,
                        data_sosire DATE,
                        nr_produse INT CONSTRAINT nr_produse NOT NULL,
                        suma_initiala FLOAT CONSTRAINT suma_initiala NOT NULL,
                        cod_reducere NUMBER(5), CONSTRAINT fk_reducere_comanda FOREIGN KEY (cod_reducere) REFERENCES REDUCERE(cod_reducere),
                        suma_finala FLOAT CONSTRAINT suma_finala NOT NULL,
                        moneda_comanda VARCHAR(50) CONSTRAINT moneda_comanda NOT NULL, 
                        status_comanda VARCHAR(50) CONSTRAINT status_comanda NOT NULL, 
                        adresa VARCHAR(100) CONSTRAINT adresa NOT NULL
                        );
                        
INSERT INTO COMANDA VALUES
(1122,1,2,151,7,TO_DATE('20220109', 'yyyymmdd'),TO_DATE('20220115', 'yyyymmdd'),2,45.55,12345,32.34,'euro','livrata','Std Stefan cel Mare nr 45, Bacau');
INSERT INTO COMANDA VALUES
(1133,3,2,111,1,TO_DATE('20220302', 'yyyymmdd'),TO_DATE('20220314', 'yyyymmdd'),3,76.09,56789,54,'euro','livrata','Std Stefan cel Mare nr 45, Bacau');
INSERT INTO COMANDA VALUES
(1144,3,3,131,3,TO_DATE('20220423', 'yyyymmdd'),TO_DATE('20220514', 'yyyymmdd'),5,130.98,23456,121.43,'euro','livrata','Std Danescu Negru nr 2, Buzau');
INSERT INTO COMANDA VALUES
(1155,4,4,141,5,TO_DATE('20220619', 'yyyymmdd'),TO_DATE('20220620', 'yyyymmdd'),3,65.3,34567,56.99,'euro','livrata','Std Floriilor nr 5, Iasi');
INSERT INTO COMANDA VALUES
(1166,2,1,151,7,TO_DATE('20220530', 'yyyymmdd'),TO_DATE('', 'yyyymmdd'),2,43.99,12345,38.17,'euro','in curs de livrare','Std Stefan cel Mare nr 23, Bacau');

SELECT * FROM COMANDA;


------------------TABEL DETALII COMANDA--------

CREATE TABLE DETALII_COMANDA (id_comandaItem NUMBER(5) CONSTRAINT PKEY_comandaITEM PRIMARY KEY,
                                id_comanda NUMBER(5), CONSTRAINT fk_comanda_comandaITEM FOREIGN KEY (id_comanda) REFERENCES COMANDA(id_comanda),
                                id_produs NUMBER(5), CONSTRAINT fk_produs_comandaITEM FOREIGN KEY (id_produs) REFERENCES PRODUS(id_produs),
                                cantitate INT CONSTRAINT cantitate NOT NULL
                                );
                                
INSERT INTO DETALII_COMANDA VALUES
(987,1166,1111,1);
INSERT INTO DETALII_COMANDA VALUES
(876,1155,1113,2);
INSERT INTO DETALII_COMANDA VALUES
(765,1122,1116,1);
INSERT INTO DETALII_COMANDA VALUES
(654,1122,1114,1);
INSERT INTO DETALII_COMANDA VALUES
(543,1144,1118,1);

SELECT * FROM DETALII_COMANDA;

commit;