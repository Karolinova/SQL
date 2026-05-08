CREATE OR REPLACE FUNCTION walidacja_pustych_kolumn_tabela (tabela text, variadic lista_kolumn varchar[])
	RETURNS table (nr_polisy varchar, nazwa_kolumny varchar)
	LANGUAGE plpgsql
AS $function$
DECLARE 
	kol varchar;
BEGIN
	FOREACH kol IN ARRAY lista_kolumn LOOP
		RETURN QUERY EXECUTE FORMAT(
			$q$
			SELECT DISTINCT nr_polisy, %L::varchar AS nazwa_kolumny
			FROM %I
			WHERE %I IS NULL OR %I::text = ''::text
			$q$,
			kol,
			tabela,
			kol,
			kol
		);
	END LOOP;
END;
$function$;