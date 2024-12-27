create procedure zakoncz_gre 
	@game nvarchar(max), 
	@data_zakonczenia date
as
begin 
	declare @epic_tak bit;
	declare @steam_tak bit;
	declare @epic_id_key int;
	declare @steam_id_key int;
	-- verify, if game is on steam or epic
	set @epic_tak = case when exists (select 1 from dbo.epic where game_epic_name = @game) then 1 else 0 end;
	set @epic_id_key = (select epic_id from dbo.epic where game_epic_name = @game);
	set @steam_tak = case when exists (select 1 from dbo.steam where game_steam_name = @game) then 1 else 0 end;
	set @steam_id_key = (select steam_id from dbo.steam where game_steam_name = @game);
	-- game is on epic
	if @epic_tak = 1
	begin
		update dbo.epic_info 
		set status = 'Ukończona'
		, data_ukonczenia = @data_zakonczenia
		where epic_id = @epic_id_key;
		if @@ROWCOUNT = 1
			begin 
			print 'Gra '+ @game +' z Epic została zakończona w dniu ' + CONVERT(NVARCHAR(10),@data_zakonczenia) ;
			end
	end
	-- game is on steam
	else if @steam_tak = 1
	begin
		update dbo.steam_info 
		set status = 'Ukończona'
		, data_ukonczenia = @data_zakonczenia
		where steam_id = @steam_id_key;
		if @@ROWCOUNT = 1
			begin
			print 'Gra '+ @game +' ze Steam została zakończona w dniu ' + CONVERT(NVARCHAR(10),@data_zakonczenia) ; 
			end
	end
		else 
		begin
		print 'Brak gry w Epic i Steam';
		end
end;
