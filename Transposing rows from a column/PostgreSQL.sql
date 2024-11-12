do $$
	declare
	j int := 1;
	k int;
	counter record;
	BEGIN
	select number_row from Food order by number_row into k; 
	for counter in select count(*) from Food
	LOOP
		for k in select number_row from Food order by number_row
		LOOP
		update Books
		set id = j
		where number_row = k;
		if mod(k,4)=0 THEN
		j=j+1;
		end if;
		end loop;
	end loop;
end $$
language plpgsql;
