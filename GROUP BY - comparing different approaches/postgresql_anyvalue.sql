select any_value(agr.imie) as imie
, any_value(agr.nazwisko) as nazwisko
, any_value(agr.miasto) as miasto
, count(auwp.id_partii) as liczba_partii
, count(auwp.id_partii) filter (where pozycja = 1) as liczba_zwyciestw
, sum(ap.czas_trwania_gry) as laczny_czas_gry
, array_agg(ap.id) as lista_partii
, array_agg(distinct ag.nazwa_gry) as lista_gier
, max(ap.data_rozgrywki) as ostatnia_gra
from av_gracze agr
left join av_udzial_w_partii auwp on auwp.id_gracza = agr.id
left join av_partie ap on ap.id = auwp.id_partii
left join av_gry ag on ag.id = ap.id_gry
group by agr.id;