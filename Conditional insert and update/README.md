Let us assume that we have a table just like below with four people who was conducted by survey:
| imie | id |
|-----------|-----------|
| Ania | 1 |
| Kamila | 2 |
| Mirek | 4 |
| Daniel | 5 |

We want to have all information in two tables. We need to add new rows or update existing ones.
First table 'czy_jest' has an information about name of questionarie and person id:
| ankieta | id_osoba |
|-----------|-----------|
| wywiad | 1 |
| wywiad | 2 |

Second table 'pytania_odpowiedzi' has an information about question code, answer and person id:
| kod_pytania | odpowiedz | id_osoba |
|-----------|-----------|-----------|
| PYT_01 | true | 1 |
| PYT_01 | false | 3 |
