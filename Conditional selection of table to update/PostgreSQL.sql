-- solution in PostgreSQL 
create or replace function zakoncz_gre (game varchar(100),data_zakonczenia date)
returns void
language plpgsql
as $function$
declare epic_tak boolean;
declare steam_tak boolean;
declare epic_id_key int;
declare steam_id_key int;
declare liczba_zmian int;
begin
	-- verify, if game is on steam or epic
	select exists (select 1 from epic where game_epic_name = game) into epic_tak;
	select epic_id from epic where game_epic_name = game into epic_id_key;
	select exists (select 1 from steam where game_steam_name = game) into steam_tak;
	select steam_id from steam where game_steam_name = game into steam_id_key;
	-- game is on epic
	if epic_tak then
		update epic_info
		set status = 'Ukończona'
		, data_ukonczenia = data_zakonczenia
		where epic_id = epic_id_key;
		get diagnostics liczba_zmian = row_count;
			if liczba_zmian = 1 then
			raise notice 'Gra % z Epic została zakończona w dniu %',game,data_zakonczenia;
			else 
			raise notice 'Brak zmian w grach z Epic.';
			end if;
	-- game is on steam
	elseif steam_tak then
		update steam_info
		set status = 'Ukończona'
		, data_ukonczenia = data_zakonczenia
		where steam_id = steam_id_key;
		get diagnostics liczba_zmian = row_count;
			if liczba_zmian = 1 then
			raise notice 'Gra % ze Steam została zakończona w dniu %',game,data_zakonczenia;
			else 
			raise notice 'Brak zmian w grach ze Steam.';
			end if;
	else
		raise notice 'Brak gry w Epic i Steam';
	end if;
end;
$function$;
