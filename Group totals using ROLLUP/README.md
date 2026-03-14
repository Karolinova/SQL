# SQL Solution for group totals using ROLLUP
Let us assume that we have a table just like below with informations about product (which coffee), person (employee or client) and price (depends on the person who buys):
| ID | Klient_pracownik | Produkt | Cena | Data_zakupu |
|:---|:---:|:---|:---:|:---|
| 1 | K | Latte | 15 | 2026-01-02 |
| 2 | K | Latte | 15 | 2026-01-09 |
| 3 | P | Barista | 15 | 2026-01-22 |
| 4 | K | Flat White | 12 | 2026-01-27 |
| 5 | K | Barista | 18 | 2026-02-05 |
| 6 | K | Barista | 18 | 2026-02-06 |
| 7 | P | Latte | 12 | 2026-02-08 |
| 8 | K | Flat White | 12 | 2026-02-14 |
| 9 | K | Latte | 15 | 2026-02-18 |
| 10 | P | Barista | 15 | 2026-02-28 |
| 11 | K | Barista | 18 | 2026-03-03 |
| 12 | P | Latte | 12 | 2026-03-07 |
| 13 | K | Latte | 15 | 2026-03-13 |
We want to know we want to know what amount was received, broken down by month and product. In addition, we want the total at the end of each month.