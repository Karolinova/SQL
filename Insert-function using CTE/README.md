# SQL Solution for insert-function using CTE

Let us assume that we have a table just like below:
| projekt | pracownik | kwota |data_start|data_koniec
|-----------|-----------|-----------|-----------|-----------|
| C# | Nowak | 220 |2024-01-01|2024-03-31|
| Java | Kowalska | 250 |2024-01-01|2024-04-30|
| SQL | Kowalczyk | 130 |2024-01-01|2024-12-31|
| SQL | Nowak | 120 |2024-04-01|2024-06-30|
| Java | Kowalska | 150 |2024-05-01|2024-08-31|
| C# | Kowalska | 220 |2024-09-01|2024-12-31|
| Java | Nowak | 140 |2024-07-01|2024-09-30|
| C# | Nowak | 240 |2024-10-01|2024-12-31|

We want to distribute any amount (function parameter) proportionally among employee, including the following assumptions:
- the total amount depends on the ratio of the amount on the project to the total amount,
- the amount for the employee depends on what proportion of his/her amount constitutes in relation to the total amount of a given project.
