-- POSTGRESQL
SELECT v.podzial
	, pkk.produktn
	, v.kwota
FROM produkt_kod_kwota pkk
CROSS JOIN LATERAL (
	VALUES('1',kwota1)
		, ('2',kwota2)
	) AS v(podzial,kwota)
ORDER BY v.podzial;

-- MSSQL
SELECT v.podzial
	, pkk.produkt
	, v.kwota
FROM produkt_kod_kwota pkk
CROSS APPLY (
	VALUES('1',kwota1)
		, ('2',kwota2)
	) AS v(podzial,kwota)
ORDER BY v.podzial;