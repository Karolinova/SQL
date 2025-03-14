with nowe_triki as (select et.nazwa, et.trik_2, tz2.id as id_2
, et.trik_3, tz3.id as id_3
from extra_triki et -- table with new trick names
left join triki_zaklecia tz2 on tz2.nazwa = et.trik_2 
left join triki_zaklecia tz3 on tz3.nazwa = et.trik_3)
update stworzenia s -- table with columns to update
set trik2_id = nt.id_2
, trik3_id = nt.id_3
from nowe_triki nt
where nt.nazwa = s.nazwa
;
