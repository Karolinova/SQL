do $$
declare 
	an_os record;
	licznik int := 0;
	osoba_jest boolean;
begin
	for an_os in select id from osoba_temp
	loop
		raise notice 'Aktualizujemy tabelę czy_jest';
		select exists (select 1 from czy_jest where id = an_os.id) into osoba_jest;
		if osoba_jest THEN
			raise notice 'Jest ankieta dla osoby o id %',an_os.id;
		else
			insert into czy_jest values ('wywiad',an_os.id);
			raise notice 'Dodano id osoby do tabeli = %',an_os.id;
		end if;
		raise notice 'Aktualizujemy odpowiedz';
		select exists (select 1 from pytania_odpowiedzi where id_osoba = an_os.id and kod_pytania = 'PYT_01') into osoba_jest;
		if osoba_jest then
			raise notice 'Aktualizujemy odpowiedz na pytanie dla osoby %', an_os.id;
			update pytania_odpowiedzi
			set odpowiedz = false
			where id_osoba = an_os.id
			and kod_pytania = 'PYT_01';
		else 
			raise notice 'Dodajemy odpowiedz na pytanie dla osoby %', an_os.id;
			insert into pytania_odpowiedzi values ('PYT_01', true, an_os.id);
		end if;
	licznik = licznik + 1;
	end loop;
end $$