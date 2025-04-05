create procedure kwota_ekstra_policz 
@bonus numeric
as
begin
	DECLARE @suma_total numeric = (select sum(kwota) from dbo.pracownik_projekt);
	-- Add rows to table
	with kwota_bonus as (
	select projekt
	, sum(kwota) as kwota_projekt
	, sum(kwota)/@suma_total as wsp_projekt
	, round ((sum(kwota)/@suma_total)*@bonus,4) as kwota_bonus
	from dbo.pracownik_projekt
	group by projekt
	)
	insert into dbo.pracownik_bonus
	select pp.pracownik
	, pp.projekt
	, round((sum(pp.kwota)/kb.kwota_projekt)*kb.kwota_bonus,4) as bonus
	from dbo.pracownik_projekt pp
	join kwota_bonus kb on kb.projekt = pp.projekt
	group by pp.pracownik, pp.projekt, kb.kwota_projekt, kb.kwota_bonus ;
end;
;