declare @j int = 1;
declare @counter int;
declare @number_row int;
select @counter = count(*) from Food;
select @number_row = min(number_row) from Food; 
while @number_row<=@counter
begin
	update Food
	set id = @j
	where number_row = @number_row;
	if @number_row%4=0 -- mod(4,0)
		begin
		set @j=@j+1;
		end;
	set @number_row = @number_row +1;
end;
