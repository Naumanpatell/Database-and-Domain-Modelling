# SQL

---

## 1. Databases

- **Database** → A structured collection of data.
- **DBMS (Database Management System)** → Software to manage databases (create, read, update, delete).
- **RDBMS (Relational DBMS)** → Stores data in **tables** (rows & columns). Examples: MySQL, PostgreSQL, Oracle, SQL Server.

---

## 2. SQL (Structured Query Language)

- SQL is the standard language to **communicate with RDBMS**.
- MySQL, PostgreSQL, Oracle → all use SQL (with small variations).
- SQL = language, MySQL = software that uses SQL.

---

## 3. SQL Data Types

### String Types:

- `CHAR(n)` → Fixed length string (n chars).
- `VARCHAR(n)` → Variable length string (up to n chars).
- `TEXT` → Long text.

### Number Types:

- `INT` → Whole numbers (e.g., 1, 2, 100).
- `DECIMAL(p, s)` → Exact numeric (p = precision, s = scale). Example: `DECIMAL(10,2)` → up to 10 digits, 2 after decimal.
- `FLOAT` / `DOUBLE` → Approx numeric (floating point).

### Date/Time:

- `DATE` → YYYY-MM-DD
- `DATETIME` → YYYY-MM-DD HH:MM:SS
- `TIMESTAMP` → Stores date+time with timezone info

---

## 4. SQL Commands

### Categories:

1. **DDL (Data Definition Language)** → Structure of tables
    - `CREATE`, `ALTER`, `DROP`, `TRUNCATE`
2. **DML (Data Manipulation Language)** → Data inside tables
    - `INSERT`, `UPDATE`, `DELETE`
3. **DQL (Data Query Language)** → Fetch data
    - `SELECT`
4. **DCL (Data Control Language)** → Permissions
    - `GRANT`, `REVOKE`
5. **TCL (Transaction Control Language)** → Transactions
    - `COMMIT`, `ROLLBACK`, `SAVEPOINT`

---

## 5. Constraints

Rules that control what values can go in a column.

- **NOT NULL** → Value must be given.
- **UNIQUE** → No duplicate values.
- **PRIMARY KEY** → Unique + Not Null (table can have only 1 primary key).
- **FOREIGN KEY** → Creates a relationship between 2 tables.
- **CHECK** → Ensures condition is true.
- **DEFAULT** → Provides default value if none is given.

### Example:

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2)
);
```

---

## 6. Basic Queries

### Alter

```sql
ALTER TABLE employees ADD age INT;
```

### Drop

```sql
DROP TABLE employees;
```

### Truncate

```sql
TRUNCATE TABLE employees;
```

### Insert

```sql
INSERT INTO employees (id, name, salary)
VALUES (1, 'Alice', 50000.00);
```

### Select

```sql
SELECT * FROM employees;
SELECT name, salary FROM employees WHERE salary > 40000;
```

### Update

```sql
UPDATE employees
SET salary = 60000
WHERE id = 1;
```

### Delete

```sql
DELETE FROM employees WHERE id = 1;
```

### Grant

```sql
GRANT SELECT, INSERT ON employees TO user1;
```

### Revoke

```sql
REVOKE INSERT ON employees FROM user1;
```

---

## 7. Filtering Data

### WHERE clause with operators:

- `=` , `!=`, `>`, `<`, `>=`, `<=`
- `AND`, `OR`, `NOT`
- `BETWEEN` → `salary BETWEEN 40000 AND 60000`
- `IN` → `name IN ('Alice','Bob')`
- `LIKE` → pattern matching (`'A%'` → starts with A, `'%son'` → ends with son)

---
## 8. Sorting & Grouping

```sql
SELECT * FROM employees ORDER BY salary DESC;
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

```

---

## 9. Aggregate Functions

- `COUNT(*)` → number of rows
- `SUM(salary)` → total
- `AVG(salary)` → average
- `MIN(salary)` → minimum
- `MAX(salary)` → maximum

---

## 10. Joins (Combine Tables)

- **INNER JOIN** → common rows from both tables

```sql
SELECT o.order_id, c.name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id;

```

- **LEFT JOIN** → all rows from left + matching from right
- **RIGHT JOIN** → all rows from right + matching from left
- **FULL OUTER JOIN** → all rows from both sides (matches + non-matches)
- **CROSS JOIN** → Cartesian product (all combinations)
- **SELF JOIN** → table joins itself

---

## 11. Subqueries

A query inside another query.

```sql
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

```

---

## 12. Views

A **view** is a virtual table based on a query.

```sql
CREATE VIEW high_salary AS
SELECT name, salary
FROM employees
WHERE salary > 50000;

```

---

## 13. Indexes

Indexes speed up searching (like an index in a book).

```sql
CREATE INDEX idx_name ON employees(name);

```

---

## 14. Transactions (TCL)

Used to ensure data consistency.

```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE id=1;
UPDATE accounts SET balance = balance + 100 WHERE id=2;

COMMIT;   -- save permanently
ROLLBACK; -- undo if error
SAVEPOINT A; -- checkpoint

```
