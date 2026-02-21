CREATE OR REPLACE FUNCTION walidacja_pustych_kolumn (tabela text, variadic lista_kolumn text[])
	RETURNS void
	LANGUAGE plpgsql
AS $function$
DECLARE 
	kol text;
	brak_danych boolean;
	lista_brakow text[];
BEGIN
	FOREACH kol IN ARRAY lista_kolumn LOOP
		EXECUTE FORMAT(
			$q$
			SELECT ARRAY_AGG(DISTINCT nr_polisy) AS lista
			FROM %I
			WHERE %I IS NULL OR %I::text = ''::text
			$q$,
			tabela,
			kol,
			kol
		)
		INTO lista_brakow;
		IF lista_brakow IS NOT NULL THEN 
			RAISE NOTICE 'Braki w kolumnie %: %', kol, lista_brakow;
		ELSE
			RAISE NOTICE 'Nie ma braków w kolumnie %.', kol;
		END IF;
	END LOOP;
END;
$function$;