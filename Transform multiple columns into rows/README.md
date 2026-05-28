# SQL solutions for transforming multiple columns into rows

Let us assume that we have a table with different amount values stored in separate columns:

| produkt | kod | kwota1 | kwota2 |
| :--- | :--- | :---: | :---: |
| porzeczka | PORZ | 15 | 8 |
| banan | BANA | 10 | 6 |
| mirabelka | MIRA | 25 | 13 |
| ... | ... | ... | ... |

We want to transform this structure into a normalized format with one amount column and information about amount type.

Expected result:
| podzial | produkt | kwota |
| :--- | :--- | ---: |
| | 1 porzeczka | 15 |
| | 1 banan | 10 |
| | 1 mirabelka | 25 |
| ... | ... | ... |
| | 2 porzeczka | 8 |
| | 2 banan | 6 |
| | 2 mirabelka | 13 |
| ... | ... | ... |

## Conclusions and compatibility

Both solutions return the same result but use different SQL techniques.

* `UNION ALL` is easier to understand, but requires duplicating the same code. It works in both PostgreSQL and MSSQL - ['Union' solution](postgresql_mssql_union.sql).
* `CROSS JOIN LATERAL` in PostgreSQL and 'CROSS APPLY' in MSSQL are more complex, but with a large number of columns become more readable - ['Cross' solution](postgresql_mssql_cross.sql).

This normalized structure makes future validations and analyses easier than the original one.