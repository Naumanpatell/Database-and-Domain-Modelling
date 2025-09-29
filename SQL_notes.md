---

## 1. Databases

- **Database** → A structured collection of data.
- **DBMS (Database Management System)** → Software to manage databases (create, read, update, delete).

### **RDBMS (Relational DBMS)**

- Stores data in **tables** (rows & columns).
- Examples: MySQL, PostgreSQL, Oracle, SQL Server.
- Advantages
    - **Structured Data**:  Allows data storage in a structured way, using rows and columns in tables. This makes it easy to manipulate the data using SQL.
    - **ACID Properties**: ACID stands for Atomicity, Consistency, Isolation, and Durability.
    - **Normalization**: It supports data normalization, a process that organizes data in a way that reduces data redundancy and improves data integrity.
    - **Scalability**: It generally provide gooDELETE is an SQL statement used to remove one or more rows from a table.d scalability options, allowing for the addition of more storage.
    - **Data Integrity**: It provides mechanisms like constraints, primary keys, and foreign keys to enforce data integrity and consistency.
    - **Security**: It offer various security features such as user authentication, access control, and data encryption to protect sensitive data.
- Limitations
    - **Complexity**: Setting up and managing an RDBMS can be complex, especially for large applications.
    - **Cost**: RDBMSs can be expensive, both in terms of licensing fees and the computational and storage resources they require.
    - **Fixed Schema**: It follows a rigid schema for data organization Hence, changes to the schema can be time-consuming and complicated.
    - **Handling of Unstructured Data**: It is not suitable for handling unstructured data like multimedia files, social media posts, and sensor data, as they are optimized for structured data.
    - **Horizontal Scalability**: They are not as easily horizontally scalable as NoSQL databases.
        - Scaling horizontally, which involves adding more machines to the system, can be challenging in terms of cost and complexity.

### NoSQL(Non-relational)

- It offer more flexibility in data structures, often sacrificing some consistency for scalability and performance.

---

## 2. SQL (Structured Query Language)

- SQL is the standard language to **communicate with RDBMS**.
- MySQL, PostgreSQL, Oracle → all use SQL (with small variations).
- SQL = language, MySQL = software that uses SQL.

---

## 3. SQL Data Types

### String Types:

- `CHAR(n)` → Fixed length string (0-255 chars).
- `VARCHAR(n)` → Variable length string (0-255 chars).
- `BLOB` → Store String (0-65535)
- `TEXT` → Long text.

### Number Types:

- `INT` → integer( -2,147,483,648 to 2,147,483,647 )
- `BIGINT` → Integer( -9,223,372,036,854,775,808 to
9,223,372,036,854,775,807 )
- `UNSIGNED` **→** when we only have positive values to add.
- `DECIMAL(p, s)` → Exact numeric (p = precision, s = scale). Example: `DECIMAL(10,2)` → up to 10 digits, 2 after decimal.
- `FLOAT` → Decimal number - with precision to 23 digits
- `DOUBLE` → Decimal number - with 24 to 53 digits

### Date/Time:

- `DATE` → YYYY-MM-DD
- `DATETIME` → YYYY-MM-DD HH:MM:SS

---

## 4. Operators

### WHERE clause with operators:

- `+` , `-` , `*` , `/` ,%w
- `=` , `!=`, `>`, `<`, `>=`, `<=`
- `AND`, `OR`, `NOT`
- `BETWEEN` → `salary BETWEEN 40000 AND 60000`
- `IN` → `name IN ('Alice','Bob')`
- `LIKE` → pattern matching (`'A%'` → starts with A, `'%son'` → ends with son)

---

## 5. Constraints

- Rules that control what values can go in a column.
    - **NOT NULL** → Value must be given.
    - **UNIQUE** → No duplicate values.
    - **PRIMARY KEY** → Unique + Not Null (table can have only 1 primary key).
    - **FOREIGN KEY** → Creates a relationship between 2 tables.
    - **CHECK** → Ensures condition must be true for each row.
    - **DEFAULT** → Provides default value if none is given.

### **CODE**

- Create Constraints
    - Used to define constraints that ensure data integrity
    
    ```sql
    ALTER TABLE orders 
    ADD CONSTRAINT fk_customer 
    FOREIGN KEY (customer_id) REFERENCES customers(id);
    ```
    
- DROP CONSTRAINTS
    - Used to remove an existing constraint from a table.
    
    ```sql
    ALTER TABLE orders 
    DROP CONSTRAINT fk_customer;
    ```
    

---

## 6. SQL Commands

### **1. DDL (Data Definition Language)**

- Used to define and manage the structure of database objects.
- DDL statements typically result in immediate changes to the database structure and can affect existing data.
- `CREATE`, `ALTER`, `DROP`, `TRUNCATE`
    - **CREATE**
        - Used to create a new table in the database.
        
        ```sql
        CREATE TABLE CUSTOMERS(
           ID          INT NOT NULL,
           NAME        VARCHAR (20) NOT NULL,
           AGE         INT NOT NULL,
           ADDRESS     CHAR (25),
           SALARY      DECIMAL (18, 2),
           PRIMARY KEY (ID)
        ```
        
    - **ALTER**
        - You can add, modify, or drop columns, constraints, and more.
        
        ```sql
        ALTER TABLE employees 
        	ADD age INT;
        ```
        
    - **DROP**
        - Used to delete an existing table along with its data and structure.
        
        ```sql
        DROP TABLE employees;
        ```
        
    - **TRUNCATE**
        - Used to delete the data inside a table, but not the table itself.
        
        ```sql
        TRUNCATE TABLE table_name
        ```
        

### **2. DML (Data Manipulation Language)**

- It is a subset of SQL used to manage data within database objects(Tables).
- DML statements operate on the data itself rather than the database structure, enabling users to interact with the stored information.
- `INSERT`, `UPDATE`, `DELETE`
- Insert
    
    ```sql
    INSERT INTO employees (id, name, salary)
    VALUES (1, 'Alice', 50000.00);
    
    INSERT INTO employees (Column1, Column2, .. , Columnn);
    // Where only named Coloumn will be filled with Data
    ```
    
- Update
    
    ```sql
    UPDATE employees
    SET salary = 60000
    WHERE id = 1;
    ```
    
- Delete
    - Used to remove one or more rows from a table.
    
    ```sql
    DELETE FROM employees WHERE id = 1;
    ```
    

### **3. DQL (Data Query Language)**

- It is used to fetch data from the Database
- `SELECT`
- Select
    
    ```sql
    SELECT * FROM employees;
    SELECT name, salary FROM employees WHERE salary > 40000;
    ```
    

### **4. DCL (Data Control Language)**

- Used to manage user permissions in a database.
- ****These commands are essential for implementing database security, controlling access to sensitive data, and ensuring that users have appropriate permissions for their roles.
- `GRANT`, `REVOKE`
- Grant
    - It is used to Grant Special privileges on the database objects to users or roles.
    
    ```sql
    GRANT SELECT, INSERT ON employees TO user1;
    ```
    
- Revoke
    - It is used to Remove Privileges.
    
    ```sql
    REVOKE INSERT ON employees FROM user1;
    ```
    

### **5. TCL (Transaction Control Language)**

- `COMMIT`, `ROLLBACK`, `SAVEPOINT`

---

## 

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