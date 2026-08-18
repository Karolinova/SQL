## SQL Naming Conventions

This document contains my own naming conventions for SQL objects. I will use these rules in new SQL projects and exercises.

---

## 1. Tables

* Table names are written in lowercase.
* I use `snake_case`, with words separated by `_`.
* Table names are written in plural form when it makes sense.

### Examples

```text
bakery_products
employees
transactions
product_stock
```

---

## 2. Columns

* Column names are written in lowercase.
* I use `snake_case`.

### Examples

```text
name
purchase_date
id_bakery_product
id_store
```

---

## 3. Primary Keys

* The primary key of a table is named `id`.
* The table name is not added to the `id`.

### Example

```text
bakery_products
└── id
```

---

## 4. Foreign Keys

* A foreign key follows this naming pattern:

```text
id_<referenced_table_name>
```

* The referenced table name is written in singular form.
* The same rule is used for longer table names and multi-word names.

### Examples

```text
id_employee
id_store
id_bakery_product
```

---

## 5. Junction Tables

* A junction table name contains the names of the tables it connects.
* I use lowercase `snake_case`.

### Example

```text
bakery_product_bakers
```

The `bakery_product_bakers` table connects the `bakery_products` and `employees` tables.

---

## 6. Constraints

Constraint names start with uppercase letters that identify their type.

I use the following prefixes:

| Type        | Prefix | Example                           |
| ----------- | ------ | --------------------------------- |
| Primary Key | `PK_`  | `PK_bakery_products`              |
| Foreign Key | `FK_`  | `FK_transactions_bakery_products` |
| Unique      | `UQ_`  | `UQ_employees_pesel`              |
| Check       | `CK_`  | `CK_product_stock_quantity`       |
| Default     | `DF_`  | `DF_transactions_purchase_date`   |

### Foreign Keys

Foreign key constraints follow this pattern:

```text
FK_<table_with_foreign_key>_<referenced_table>
```

Example:

```text
FK_transactions_bakery_products
```

The name indicates a foreign key in the `transactions` table that references the `bakery_products` table.

---

## 7. Indexes

* Index names are written in lowercase, except for the `IX_` prefix.
* I use the following pattern:

```text
IX_<table>_<column>
```

### Examples

```text
IX_transactions_purchase_date
IX_transactions_id_store
```

For an index containing multiple columns:

```text
IX_transactions_id_store_purchase_date
```

---

## 8. Functions and Procedures

* Function and procedure names are written in lowercase.
* I use `snake_case`.
* The name should describe the operation performed.
* I do not use additional prefixes such as `fn_` or `sp_`.

### Examples

```text
validate_empty_columns
update_product_stock
```

---

## 9. Views

* View names are written in lowercase.
* I use `snake_case`.
* View names start with the `v_` prefix.

### Examples

```text
v_sales_summary
v_monthly_sales
v_employee_store_summary
```
