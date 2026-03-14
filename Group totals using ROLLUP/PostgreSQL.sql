with klient as
(select extract(month from data_zakupu) as miesiac
, case when grouping(produkt) = 1 then 'Suma' else produkt end as produkt
, sum(kwota) as kwota
from kawa_transakcje
where klient_pracownik = 'K'
group by rollup(produkt),extract(month from data_zakupu))
, pracownik as (
select extract(month from data_zakupu) as miesiac
, case when grouping(produkt) = 1 then 'Suma' else produkt end as produkt
, sum(kwota) as kwota
from kawa_transakcje
where klient_pracownik = 'P'
group by rollup(produkt),extract(month from data_zakupu)
)
select coalesce(k.miesiac, p.miesiac) as miesiac
, coalesce(k.produkt, p.produkt) as produkt
, coalesce(k.kwota,0) + coalesce(p.kwota,0) as suma
from klient k
full join pracownik p on p.miesiac = k.miesiac and p.produkt = k.produkt
order by miesiac, produkt;