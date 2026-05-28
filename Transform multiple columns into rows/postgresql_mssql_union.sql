SELECT '1' AS podzial
	, produkt
	, kwota1 AS kwota
FROM produkt_kod_kwota
UNION ALL
SELECT '2' AS podzial
	, produkt
	, kwota2 AS kwota
FROM produkt_kod_kwota;