create or replace function kwota_ekstra_policz (bonus numeric)
returns void
LANGUAGE plpgsql
as $function$
DECLARE suma_total numeric;
begin
	select sum(kwota) from pracownik_projekt into suma_total;
	-- Add rows to table
	with kwota_bonus as (
	select projekt
	, sum(kwota) as kwota_projekt
	, sum(kwota)/suma_total as wsp_projekt
	, round ((sum(kwota)/suma_total)*bonus,4) as kwota_bonus
	from pracownik_projekt
	group by projekt
	)
	insert into pracownik_bonus
	select pp.pracownik
	, pp.projekt
	, round((sum(pp.kwota)/kb.kwota_projekt)*kb.kwota_bonus,4) as bonus
	from pracownik_projekt pp
	join kwota_bonus kb on kb.projekt = pp.projekt
	group by pp.pracownik, pp.projekt, kb.kwota_projekt, kb.kwota_bonus ;
end;
$function$
;