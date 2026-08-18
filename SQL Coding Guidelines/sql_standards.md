# SQL Standards

This document contains my own SQL code formatting rules. I will use these rules in new SQL projects and exercises. They may be extended as I gain more experience.

---

## 1. General formatting rules

* SQL keywords are written in lowercase.
* Each main SQL clause (`select`, `from`, `where`, `group by`, `order by`, etc.) starts on a new line.
* Table aliases are not used when only one table is involved.
* Table aliases are used when multiple tables are involved.
* Table aliases are written without `as`.
* Column aliases are written using `as`.

### Example

```sql
select p.name
, p.category
, sum(t.quantity) as total_quantity
from bakery_products p
join transactions t on p.id = t.id_bakery_product
where t.purchase_date >= '2026-01-01'
  and t.quantity > 0
group by p.name, p.category
order by total_quantity desc;
```

---

## 2. SELECT

* The first column is written on the same line as `select`.
* Each following column starts on a new line.
* The comma starts the new line.

```sql
select p.name
, p.category
, sum(t.quantity) as total_quantity
```

---

## 3. FROM

The table after `from` starts on a new line.

```sql
from bakery_products p
```

---

## 4. JOIN

* `join` and the first `on` condition are written on the same line.
* Additional `on` conditions start on new indented lines.

```sql
join transactions t on p.id = t.id_bakery_product
                   and t.quantity > 0
```

---

## 5. WHERE

* The first condition is written on the same line as `where`.
* Each following condition starts on a new line.
* Following conditions are indented.

```sql
where t.purchase_date >= '2026-01-01'
  and t.quantity > 0
  and t.id_store = 1
```

---

## 6. GROUP BY

* Short lists of elements are written on one line.
* Longer lists can be split into multiple lines with appropriate indentation.

```sql
group by p.name, p.category
```

---

## 7. ORDER BY

`order by` starts on a new line, like other main SQL clauses.

```sql
group by p.name, p.category
order by total_quantity desc;
```

---

## 8. INSERT

* If values are inserted into all table columns, the column list can be omitted.
* If values are inserted only into selected columns, the column names are specified after the table name.
* A column list can be written on one line. If it is too long, it can be split into multiple lines.
* For a single record, `values` and its values are written on one line.
* For `insert ... select`, the same formatting rules as for `select` are used.

### Example

```sql
insert into bakery_products
values ('Sernik', 'ciasto', 'kg');
```

With selected columns:

```sql
insert into bakery_products (name, category, unit_of_measure)
values ('Sernik', 'ciasto', 'kg');
```

---

## 9. UPDATE

* The first assignment in `set` is written on the same line as `set`.
* Each following assignment starts on a new line.
* When there are multiple assignments, the comma starts the new line, following the same rule as in `select`.
* `where` follows the previously defined formatting rules.
* In `update ... from`, the `from` clause is formatted in the same way as `from` in `select`.
* Table aliases are not used with one table and are used without `as` with multiple tables.

```sql
update product_stock
set stock = stock - 2
, change_date = current_timestamp
where id_bakery_product = 10
  and id_store = 3;
```

---

## 10. DELETE

* `delete from` is written on one line.
* `where` follows the previously defined formatting rules.
* In `delete ... using`, the `using` clause is formatted similarly to `from`.
* Table aliases are not used with one table and are used without `as` with multiple tables.
* `delete` without `where` is not used to remove all data. `truncate` is used for this purpose.

```sql
delete from product_stock
where id_bakery_product = 10
  and id_store = 3;
```
