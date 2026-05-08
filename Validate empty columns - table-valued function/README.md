# SQL solution for validating empty columns and returning results as a table

This function is an extension of the previous solution for validating empty columns.
The original version focused on identifying missing values and displaying results using RAISE NOTICE - [Walidacja pustych kolumn](../Validate%20empty%20columns/).

The current version improves this approach by returning results in a structured table format, making the output reusable for further analysis.
So we can execute this function to validate this column:
```
SELECT * 
FROM walidacja_pustych_kolumn_tabela(
    'dane_polisowe'
    , variadic array['data_wyst_polisy','ubezpieczajacy','posrednik']
);