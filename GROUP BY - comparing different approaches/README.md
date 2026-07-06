# SQL Solutions for GROUP BY – Comparing Different Approaches

## Purpose
The goal of this example is to show three different ways to build the same aggregate report in PostgreSQL. All queries return the same result, but they use different grouping approaches and different ways to return descriptive columns.

## Sample data
<table>
  <tr>
    <td valign="top">

### Tabela: av_gracze
| id | imie | nazwisko | miasto |
|:---:|:---|:---|:---|
| 1 | Anna | Kowalska | Warszawa |
| 2 | Anna | Kowalska | Kraków |
| 3 | Piotr | Nowak | Warszawa |
| 4 | Michał | Zieliński | Gdańsk |
| 5 | Kasia | Lewandowska | Poznań |

    </td>
    <td valign="top">

### Tabela: av_gry
| id | nazwa | wydawca | rok |
|:---:|:---|:---|:---:|
| 10 | Catan | Kosmos | 1995 |
| 11 | Terraforming Mars | Rebel | 2016 |
| 12 | Azul | Next Move | 2017 |

    </td>
  </tr>
</table>

<table>
  <tr>
    <td valign="top">

### Tabela: udzial_w_partii
| id_partii | id_gracza | wynik | pozycja |
|:---:|:---:|:---:|:---:|
| 100 | 1 | 10 | 2 |
| 100 | 3 | 15 | 1 |
| 101 | 1 | 50 | 3 |
| 101 | 4 | 70 | 1 |
| 102 | 2 | 20 | 1 |
| 102 | 3 | 18 | 2 |
| 103 | 1 | 25 | 1 |
| 103 | 2 | 22 | 2 |

    </td>
    <td valign="top">

### Tabela: av_partie
| id | id_gry | data | czas |
|:---:|:---:|:---|:---:|
| 100 | 10 | 2024-01-10 | 90 |
| 101 | 11 | 2024-01-12 | 120 |
| 102 | 10 | 2024-01-15 | 75 |
| 103 | 12 | 2024-01-20 | 45 |

    </td>
  </tr>
</table>

## Problem

Two different players have the same first name, last name, and city.

If the report groups data by these descriptive columns, both players will be merged into a single row.

This example presents three different approaches to solving this problem.

## Approaches

### 1. Grouping by descriptive columns (`imie`, `nazwisko`, `miasto`) - ['Columns' solution](postgresql_column.sql)

The query groups data by descriptive columns. This works only if these columns uniquely identify a player. Otherwise, different players may be merged into one row.

---

### 2. Grouping by the primary key - ['Primary key' solution](postgresql_primarykey.sql)

The query groups data by the primary key (`id`). PostgreSQL allows the descriptive columns to be selected without adding them to the `GROUP BY` clause.

---

### 3. Grouping by the primary key with `ANY_VALUE()` - ['ANY_VALUE' solution](postgresql_anyvalue.sql)

The query groups data by the primary key (`id`) and uses `ANY_VALUE()` for the descriptive columns. The result is the same as in the previous approach.