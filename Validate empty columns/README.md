Let us assume that we heave a table just like below:
| nr_polisy | data_wyst_polisy | ubezpieczajacy | posrednik |
|-----------|-----------|-----------|-----------|
| 123M10 | 2026-02-01 |  | Anna Kwiatkowska |
| 123M11 | 2026-02-02 | Jan Nowak | null |
| 123M12 | 2026-02-03 | null |2024-01-01| null |

We would like to check if any column is null or is empty string. So we can use this function to validate this column:
```sql
SELECT walidacja_pustych_kolumn('dane_polisowe', variadic array	['data_wyst_polisy','ubezpieczajacy','posrednik']);