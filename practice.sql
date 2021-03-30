select ar, cim
    from KONYVTAR.konyv
    where tema not in ('krimi', 'sci-fi')
    order by ar, tema;


SELECT *
    from konyvtar.konyv
    where (tema = 'sci-fi' or ar < 1000)
    and (oldalszam > 200 or lower(kiado) = 'Gondolat');


select * 
    from konyvtar.konyv
    where kiado is null;
    
select count(*) 
    from konyvtar.konyv
    where kiado is not null;
    
select cim
    from KONYVTAR.konyv
    where cim not like 'Re%';
    
select cim
    from KONYVTAR.konyv
    where cim like '_a%';
    
SELECT cim, konyv_azon, ar/oldalszam
    from KONYVTAR.konyv
    where ar/oldalszam > 20
    order by ar/oldalszam;
    
select cim,ar/oldalszam, trunc(ar/oldalszam), trunc(ar/oldalszam,2), round(ar/oldalszam), round(ar/oldalszam,2)
    from konyvtar.konyv;
    
select abs(-5)
    from dual;
    
select sqrt(12*50), sqrt(25)
    from dual;

select length('almafa')
    from dual;

select instr('almafa', 'af')
    from dual;

select vezeteknev || ' ' || keresztnev, nem, decode(nem, 'f', 'f�rfi', 'n', 'n�', '?')
    from konyvtar.tag;
    
select oldalszam, nvl(oldalszam, -1) 
    from KONYVTAR.konyv;
    
select cim, tema, nvl(tema, '***')
    from KONYVTAR.konyv;

select user
    from dual;

select 'alma' || 'fa', concat('alma', 'fa')
    from dual;
    
select initcap('almafa')
    from dual;

select vezeteknev, lower(vezeteknev || ' ' || keresztnev), upper(vezeteknev || ' ' || keresztnev)
    from konyvtar.tag;

select vezeteknev, substr(vezeteknev, 3, 4)
    from konyvtar.tag;

select vezeteknev, replace(vezeteknev, 'er', '**')
    from konyvtar.tag;
    
select vezeteknev || ' ' || keresztnev
    from konyvtar.tag
    where lower(vezeteknev) like'%a%a%';
    
select to_char(szuletesi_datum, 'YYYY.MM.DD')
    from konyvtar.tag;

select to_char(sysdate, 'YYYY.MM.DD'), to_char(sysdate + 1, 'YYYY.MM.DD'), 
to_char(sysdate-7, 'YYYY.MM.DD'), to_char(sysdate-1/2, 'YYYY.MM.DD hh24:mi:ss') 
    from dual;
    
select to_char(sysdate,'yyyy.mon dd hh24:mi:ss'),
to_char(add_months(sysdate,2),'yyyy.mon dd hh24:mi:ss'),
to_char(add_months(sysdate,-2),'yyyy.mon dd hh24:mi:ss'),
to_char(add_months(sysdate,12),'yyyy.mon dd hh24:mi:ss'),
to_char(add_months(sysdate,-12),'yyyy.mon dd hh24:mi:ss')
from dual;

select sysdate - to_date('2000.01.01', 'YYYY.MM.DD')
    from dual;
    
select months_between(sysdate, to_date('2000.01.01', 'YYYY.MM.DD'))/12
    from dual;
    
select vezeteknev||keresztnev, to_char(szuletesi_datum, 'YYYY.MM.DD'), months_between(sysdate, szuletesi_datum)/12    
    from konyvtar.tag
    where months_between(sysdate, szuletesi_datum)/12 < 30;
    
select vezeteknev||keresztnev, to_char(szuletesi_datum, 'YYYY.MM.DD'), besorolas
    from konyvtar.tag
    where szuletesi_datum < to_date('2000.01.01', 'yyyy.mm.dd')
    and besorolas in ('nyugd�jas', 'feln�tt');
    
select vezeteknev || keresztnev, cim
    from konyvtar.tag
    where lower(cim) like '%�t%'
    or (lower(vezeteknev || keresztnev) like'%e%e%' and lower(vezeteknev || keresztnev) not like'%e%e%e%')
    order by vezeteknev, keresztnev;

select vezeteknev || keresztnev, to_char(szuletesi_datum, 'yyyy.mm.dd')
    from konyvtar.tag
    where nem = 'f'
    and szuletesi_datum < to_date('1980.03.02', 'yyyy.mm.dd');
    
select vezeteknev || keresztnev, months_between(sysdate, szuletesi_datum)/12, besorolas
    from konyvtar.tag
    where lower(vezeteknev || keresztnev) like '%e%e%'
    and (besorolas = 'gyerek' or months_between(sysdate, szuletesi_datum)/12 < 40);
    
select vezeteknev, keresztnev, to_char(szuletesi_datum, 'yyyy.mm.dd'), months_between(sysdate,  szuletesi_datum)/12 eletkor, besorolas
    from konyvtar.tag
    order by besorolas desc, vezeteknev asc, keresztnev asc;
    
select min(ar), max(ar), sum(ar), avg(ar), count(konyv_azon)
    from KONYVTAR.konyv;
    
select count(konyv_azon), count(ar), count(*)
    from konyvtar.konyv;

select count(tema)
    from konyvtar.konyv;
    
select count(*)
    from konyvtar.szerzo
    where months_between(sysdate, szuletesi_datum)/12 > 70;
    
select to_char(min(szuletesi_datum), 'yyyy.mm.dd') szul_datum, months_between(sysdate, min(szuletesi_datum))/12 eletkor
    from KONYVTAR.szerzo;
    
select min(tema), max(tema)
    from konyvtar.konyv;
    
select distinct tema
    from konyvtar.konyv;

select count(distinct tema)
    from konyvtar.konyv;
    
select count(*)
    from konyvtar.konyv
    where lower(cim) like '%a%a%' and lower(cim) not like '%a%a%a%';
    
select to_char(min(szuletesi_datum), 'YYYY.MM.DD')
    from KONYVTAR.szerzo;

select distinct tema
    from konyvtar.konyv
    where ar/oldalszam between 10 and 150
    order by tema;
    
select avg(ar)
    from konyvtar.konyv
    where tema in ('sci-fi', 'krimi');
    
select max(ar)
    from konyvtar.konyv
    where tema in ('sci-fi', 'krimi', 'horror');
    
select min(oldalszam)
    from konyvtar.konyv
    where ar between 1000 and 5000;
    
select DISTINCT besorolas
    from konyvtar.tag
    where nem = 'n' 
    and szuletesi_datum between to_date('1940.01.01', 'yyyy.mm.dd') and to_date('1960.12.31', 'yyyy.mm.dd')
    order by besorolas;
    
select count(*)
    from konyvtar.tag
    where nem = 'n'
    and besorolas = 'di�k';

select count(distinct substr(cim, 6, instr(cim, ',')-6)) varosnev
    from konyvtar.tag;
    
select count(*)
    from konyvtar.tag
    where months_between(sysdate, szuletesi_datum)/12 < 40
    or (lower(vezeteknev || keresztnev) like '%e%e%' and lower(vezeteknev || keresztnev) not like '%e%e%e%');
    
select count(*)
    from konyvtar.konyv
    where ar/oldalszam < 10;
    
select to_char(max(kiadas_datuma), 'yyyy.mm.dd')
    from konyvtar.konyv;
    
select sum(ertek)
    from KONYVTAR.konyvtari_konyv
    where konyv_azon = 1116152201;

select to_char(max(szuletesi_datum), 'yyyy.mm.dd')
    from konyvtar.tag
    where nem = 'n'
    and besorolas = 'di�k';
    
select tema, min(ar), max(ar), sum(ar), avg(ar), count(konyv_azon)
    from KONYVTAR.konyv
    group by tema
    order by tema;

select tema, count(*)
    from KONYVTAR.konyv
    group by tema;

select tema
    from konyvtar.konyv
    group by tema
    having count(*) > 7;

select substr(cim, 6, instr(cim, ',')-6) varos, count(*)
    from konyvtar.tag
    where szuletesi_datum < to_date('1980.03.01', 'yyyy.mm.dd')
    group by substr(cim, 6, instr(cim, ',')-6)
    order by varos;
    
select sum(honorarium), szerzo_azon
    from KONYVTAR.konyvszerzo
    group by szerzo_azon
    having sum(honorarium) > 2000000;
    
select tema, avg(oldalszam)
    from konyvtar.konyv
    group by tema;
    
select tema, avg(oldalszam)
    from konyvtar.konyv
    group by tema
    having avg(oldalszam) < 400;
    
select substr(vezeteknev, 1, 1) || substr(keresztnev, 1, 1) monogram, count(*)
    from konyvtar.tag
    group by substr(vezeteknev, 1, 1) || substr(keresztnev, 1, 1);
    
select to_char(szuletesi_datum,'yyyy.mm'), count(*)
    from konyvtar.tag
    group by to_char(szuletesi_datum,'yyyy.mm')
    having count(*)<10;
    
select besorolas, avg(tagdij)
    from konyvtar.tag
    group by besorolas;
    
select konyv_azon, sum(ertek)
    from KONYVTAR.konyvtari_konyv
    group by konyv_azon;
    
SELECT kiado, to_char(max(kiadas_datuma), 'yyyy.mm.dd')
    from konyvtar.konyv
    group by kiado
    order by kiado nulls last;
    
select tema, count(konyv_azon)
    from konyvtar.konyv
    where ar between 1000 and 3000
    group by tema
    having count(konyv_azon) > 3;
    
select besorolas, nem, avg(tagdij), count(olvasojegyszam)
    from konyvtar.tag
    group by besorolas, nem
    order by besorolas, nem;
    
select substr(keresztnev, 1, 2), count(*)
    from konyvtar.tag
    where nem = 'n'
    group by substr(keresztnev, 1, 2)
    order by count(*) desc;
    
select konyv_azon, max(ertek)
    from KONYVTAR.konyvtari_konyv
    group by konyv_azon;

select kiado, sum(ar)
    from konyvtar.konyv
    group by kiado
    having sum(ar) > 10000;
    
select konyv_azon, count(*)
    from KONYVTAR.konyvtari_konyv
    group by konyv_azon
    having count(*) > 5;
    
select tema, sum(ar)
    from konyvtar.konyv
    group by tema
    having sum(ar) < 10000;
    
select tema, max(ar)
    from konyvtar.konyv
    group by tema;
    
select tema, min(ar)
    from konyvtar.konyv
    where oldalszam < 400
    group by tema;
    
select kiado, sum(oldalszam)
    from konyvtar.konyv
    group by kiado
    having sum(oldalszam) > 500;
    
select to_char(szuletesi_datum, 'mm') honap, count(*)
    from konyvtar.tag
    group by to_char(szuletesi_datum, 'mm')
    having count(*) > 1
    order by honap;
    
select avg(count(olvasojegyszam))
    from konyvtar.tag
    group by besorolas;
    
-------------------JOIN----------------------------
select vezeteknev, keresztnev
    from konyvtar.szerzo sz inner join konyvtar.konyvszerzo ksz
    on sz.szerzo_azon=ksz.szerzo_azon
    inner join konyvtar.konyv kv
    on ksz.konyv_azon=kv.konyv_azon
    where extract(month from szuletesi_datum)=5
    and honorarium>100
    and lower(cim) like '%a%a%' and lower(cim) not like '%a%a%a%'
    order by vezeteknev,keresztnev;
    
    select kiado, count(distinct(to_char(kiadas_datuma, 'yyyy')))---count(distinct extract (year from kiadas_datuma))
        from konyvtar.konyv
        group by kiado
        order by kiado;
        
select vezeteknev, keresztnev, count(distinct kiado)
from konyvtar.szerzo sz inner join konyvtar.konyvszerzo ksz
on sz.szerzo_azon=ksz.szerzo_azon
inner join konyvtar.konyv kv
on ksz.konyv_azon=kv.konyv_azon
group by vezeteknev, keresztnev, sz.szerzo_azon;

select vezeteknev, keresztnev, count(distinct kiado)
    from konyvtar.szerzo sz left outer join konyvtar.konyvszerzo ksz
    on sz.szerzo_azon=ksz.szerzo_azon
    left outer join konyvtar.konyv kv
    on ksz.konyv_azon=kv.konyv_azon
    group by vezeteknev, keresztnev, sz.szerzo_azon;

select kv.kiado, count(kk.konyv_azon)
    from KONYVTAR.konyvtari_konyv kk left join KONYVTAR.konyv kv on kk.konyv_azon = kv.konyv_azon
    where lower(kv.kiado) like '%eur�pa%'
    group by kv.kiado; 
    
select kv.konyv_azon, kv.cim, count(leltari_szam)
    from konyvtar.konyv kv left outer join konyvtar.konyvtari_konyv kk
    on kv.konyv_azon=kk.konyv_azon
    where lower(kiado) like '%eur�pa%'
    group by kv.konyv_azon, kv.cim;
    
select distinct vezeteknev, keresztnev
    from KONYVTAR.szerzo sz left join KONYVTAR.konyvszerzo ksz on sz.szerzo_azon = ksz.szerzo_azon
    left join KONYVTAR.konyv k on ksz.konyv_azon = k.konyv_azon
    where tema in ('krimi', 'sci-fi', 'horror');
    
select vezeteknev, keresztnev
from konyvtar.szerzo
where szerzo_azon in (select szerzo_azon
                      from konyvtar.konyvszerzo
                      where konyv_azon in (select konyv_azon
                                           from konyvtar.konyv
                                           where tema in ('krimi', 'sci-fi','horror')))
order by vezeteknev, keresztnev;  


select *
from konyvtar.konyv
where (nvl(tema,'null'), ar) in (select nvl(tema,'null'), max(ar)
                                 from konyvtar.konyv
                                 group by tema);    
                                 
select vezeteknev, keresztnev
from konyvtar.tag
where tagdij<(select avg(tagdij)
              from konyvtar.tag
              where besorolas in ('nyugd�jas', 'di�k'))
order by vezeteknev, keresztnev;


select vezeteknev, keresztnev, honorarium
    from konyvtar.szerzo sz left join konyvtar.konyvszerzo ksz on sz.szerzo_azon=ksz.szerzo_azon
    where honorarium < (select max(ar)*500
                        from konyvtar.konyv
                        where tema='horror')
    order by vezeteknev, keresztnev;
    
select vezeteknev, keresztnev, honorarium, cim
    from konyvtar.szerzo sz left join konyvtar.konyvszerzo ksz on sz.szerzo_azon=ksz.szerzo_azon
    left join konyvtar.konyv ko on ko.konyv_azon=ksz.konyv_azon
    where honorarium < (select max(ar)*500
                        from konyvtar.konyv
                        where tema='horror')
    order by vezeteknev, keresztnev;
    
select cim, ar, rownum, rowid
from konyvtar.konyv;

select ar, rownum
from (select ar
      from konyvtar.konyv
      order by ar desc nulls last)
where rownum<6;

select ar, rownum
    from (select ar
            from konyvtar.konyv
            order by ar desc nulls last)
    where rownum < 6;
    
--A legnagyobb �r� k�nyv c�me
select ar, rownum, cim
    from (select ar, cim
        from konyvtar.konyv
         order by ar desc nulls last)
    where rownum<2;     

select cim, ar
from konyvtar.konyv
where ar=(select max(ar) 
         from konyvtar.konyv);
         
--Ki az 10 legfiatalabb olvas�?
select vezeteknev, keresztnev, to_char(szuletesi_datum,'yyyy.mm.dd')
    from (select *
            from konyvtar.tag
            order by szuletesi_datum desc)
    where rownum<11;
    
select ar, cim, tema
    from konyvtar.konyv
    where ar > (select min(ar)
                from konyvtar.konyv
                where tema='krimi');
                
select k.cim, vezeteknev || keresztnev, to_char(kolcsonzesi_datum, 'yyyy.mm.dd')
    from konyvtar.tag t left join konyvtar.kolcsonzes kcs on t.olvasojegyszam = kcs.tag_azon
    left join konyvtar.konyvtari_konyv kk on kcs.leltari_szam = kk.leltari_szam
    left join konyvtar.konyv k on kk.konyv_azon = k.konyv_azon
    where kolcsonzesi_datum = (select max(kolcsonzesi_datum)
                                    from konyvtar.kolcsonzes);
                                    
--H�ny k�l�nb�z� h�nap szerepel a szerz�k sz�let�si d�tum�ban?
select count(distinct extract (month from szuletesi_datum))
    from konyvtar.szerzo;   
    
select k.konyv_azon, k.cim, kk.leltari_szam
    from KONYVTAR.konyv k inner join KONYVTAR.konyvtari_konyv kk on k.konyv_azon = kk.konyv_azon;
    
select leltari_szam 
    from KONYVTAR.tag t left join konyvtar.kolcsonzes k on t.olvasojegyszam = k.tag_azon
    where t.vezeteknev||t.keresztnev = '�csiMil�n'
    and k.visszahozasi_datum is null;
    
select kk.leltari_szam, k.cim
    from KONYVTAR.konyvtari_konyv kk inner join konyvtar.konyv k on kk.konyv_azon = k.konyv_azon
    where k.cim = 'T�z kicsi n�ger';
    
select k.cim, sz.vezeteknev||sz.keresztnev
    from konyvtar.konyv k inner join konyvtar.konyvszerzo ksz on k.konyv_azon = ksz.konyv_azon
    inner join konyvtar.szerzo sz on ksz.szerzo_azon = sz.szerzo_azon
    where tema in ('sci-fi', 'krimi', 'horror');
    
select vezeteknev||keresztnev
    from KONYVTAR.tag
    where szuletesi_datum <(select szuletesi_datum
                                from konyvtar.tag
                                where vezeteknev||keresztnev = 'Agyal�Gyula');
                                
select count(distinct szerzo_azon)
    from KONYVTAR.konyv k inner join konyvtar.konyvszerzo ksz on k.konyv_azon = ksz.konyv_azon
    where k.ar < 5000;
    
select kiado, sum(honorarium)
    from konyvtar.konyv kv inner join konyvtar.konyvszerzo ksz
    on kv.konyv_azon=ksz.konyv_azon
    group by kiado
    having sum(nvl(honorarium,0))<1000000
    order by kiado;
    
select vezeteknev||keresztnev
    from konyvtar.szerzo
    where szuletesi_datum = (select min(szuletesi_datum)
                                from konyvtar.szerzo);
                                
select leltari_szam
    from KONYVTAR.konyvtari_konyv
    where konyv_azon in (select konyv_azon
                            from KONYVTAR.konyv
                            where cim = 'Nap�leon');

select vezeteknev||keresztnev
    from konyvtar.tag
    where szuletesi_datum = (select max(szuletesi_datum)
                                from konyvtar.tag
                                where nem = 'n')
    and nem = 'n';
    
select tema, cim
    from konyvtar.konyv
    where (tema, ar) in (select tema, max(ar)
                            from konyvtar.konyv
                            group by tema);
                            
select sz.szerzo_azon, vezeteknev, keresztnev, sum(nvl(honorarium,0))
    from konyvtar.szerzo sz left outer join konyvtar.konyvszerzo ksz on sz.szerzo_azon=ksz.szerzo_azon
    group by sz.szerzo_azon, vezeteknev, keresztnev
    having sum(nvl(honorarium,0)) = (select max(sum(nvl(honorarium,0)))
                                        from konyvtar.szerzo sz left outer join konyvtar.konyvszerzo ksz
                                        on sz.szerzo_azon=ksz.szerzo_azon
                                        group by sz.szerzo_azon);  

--Olyan k�nyveket keresek, amelyek �ra nagyobb, mint b�rmely krimi t�m�j� k�nyv �ra.                                        
select ar, cim, tema
    from konyvtar.konyv
    where ar>any(select ar
                from konyvtar.konyv
                where tema='krimi');
                            
select szin, elso_vasarlasi_ar
    from SZERELO.sz_auto
    where (szin, elso_vasarlasi_ar) in (select szin, max(elso_vasarlasi_ar)
                                            from SZERELO.sz_auto
                                            group by szin)
    order by elso_vasarlasi_ar;

select *
    from (select marka, count(megnevezes) 
            from SZERELO.sz_autotipus
            group by marka
            order by marka desc)
    where rownum < 6;
    
--Legdr�g�bb els� v�s�rl�si �rral rendelkez� aut� tulajdonos�nak neve?
select tu.nev, a.elso_vasarlasi_ar
    from SZERELO.sz_auto a inner join szerelo.sz_auto_tulajdonosa at on a.azon = at.auto_azon
    inner join szerelo.sz_tulajdonos tu on at.tulaj_azon = tu.azon
    where a.elso_vasarlasi_ar = (select max(szerelo.sz_auto.elso_vasarlasi_ar)
                                    from SZERELO.sz_auto);    
                                    
--Melyik szerel� keresi a legt�bbet?
select nev, havi_fizetes
    from szerelo.sz_szerelo sz left join SZERELO.sz_dolgozik do on sz.azon = do.szerelo_azon
    where havi_fizetes = (select max(SZERELO.sz_dolgozik.havi_fizetes)
                            from SZERELO.sz_dolgozik);

--Szerel�k �sszfizet�se?
select sz.azon, sum(nvl(d.havi_fizetes, 0))
    from SZERELO.sz_szerelo sz left join szerelo.sz_dolgozik d on sz.azon = d.szerelo_azon
    group by sz.azon
    order by sum(nvl(d.havi_fizetes, 0)) desc;

--///////////////////////////////////////////////////////////////////////////////////////-------

--01-----------
select marka, count(megnevezes)
    from SZERELO.sz_autotipus
    group by marka
    order by marka;
    
--02--List�zza ki azoknak az aut�knak a rendsz�m�t �s els� v�s�rl�si id�pontj�t, amelyeket 2011-ben, 2009-ben vagy 2005-ben v�s�roltak meg el�sz�r!

select rendszam, to_char(elso_vasarlas_idopontja, 'yyyy.mm.dd') elso_vasarlas
    from szerelo.sz_auto
    where extract(year from elso_vasarlas_idopontja) in (2011, 2009, 2005);
    
--03--List�zza ki, hogy az els� tulajdonosok (els�) v�s�rl�si k�lts�gk�nt mennyit k�lt�ttek az aut�ikra! 
--A lista legyen a tulajdonos neve szerint n�vekv�, azon bel�l k�lts�g szerint cs�kken� sorrendbe rendezve!
select *
    from SZERELO.sz_tulajdonos t inner join szerelo.sz_auto_tulajdonosa at on t.azon = at.tulaj_azon
    inner join szerelo.sz_auto a on at.auto_azon = a.azon;


--04--List�zza ki azoknak az aut�knak az azonos�t�j�t, sz�n�t �s rendsz�m�t, amelyeknek nem ismert az els� v�s�rl�si �ruk, 
--vagy a rendsz�muk k�t darab null�ra v�gz�dik! A lista sz�n, azon bel�l rendsz�m szerint legyen rendezett!
select azon, szin, rendszam
    from szerelo.sz_auto
    where elso_vasarlasi_ar is null
    or rendszam like '%00'
    order by szin, rendszam;
    
--05--List�zza ki azoknak az aut�fel�rt�kel�seknek az adatait, amelyek �rt�ke legal�bb 1,5 MFt-tal kisebb az �tlagn�l!
select *
    from SZERELO.sz_autofelertekeles
    where ertek <= (select avg(ertek)-1500000
                        from SZERELO.sz_autofelertekeles);
                        
--06--List�zza ki az aut�sz�neket, �s azt, hogy az adott sz�n� aut�kat �tlagosan mennyi�rt szerelt�k! 
--A list�t rendezze az �tlagos munkav�gz�si �r szerint cs�kken�en!

select a.szin, avg(sz.munkavegzes_ara) atlag
    from SZERELO.sz_auto a left join SZERELO.sz_szereles sz on a.azon = sz.auto_azon
    group by a.szin
    order by avg(sz.munkavegzes_ara) desc;
    
--07--K�rdezze le a 'Bek� Antal' nev� szerel� telefonsz�m�t!
select telefon
    from szerelo.sz_szerelo
    where nev = 'Bek� Antal';
    
--08--Mely aut�kat �rt�kelt�k 2002-ben? Az aut�kat a rendsz�mukkal adja meg, egy aut�t csak egyszer!
select distinct rendszam
    from szerelo.sz_auto a left join SZERELO.sz_autofelertekeles af on a.azon = af.auto_azon
    where extract(year from af.datum) = 2002; 
    
--09--Mely aut�tulajdonosok v�s�roltak m�r 3-n�l t�bbsz�r aut�t? A tulajdonosokat az azonos�t�jukkal adja meg!
select t.azon, count(at.vasarlas_ideje) vasarlasok_szama
    from szerelo.sz_tulajdonos t left join SZERELO.sz_auto_tulajdonosa at on t.azon = at.tulaj_azon
    group by t.azon
    having count(at.vasarlas_ideje) > 3;
    
--10--�rja ki a 178-as azonos�t�j� aut� els� tulajdonos�nak a nev�t!
select t.nev
    from szerelo.sz_auto a inner join SZERELO.sz_auto_tulajdonosa at on a.azon = at.auto_azon
    inner join SZERELO.sz_tulajdonos t on at.tulaj_azon = t.azon
    where a.azon = 178;