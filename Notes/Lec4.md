# Lecture-4

## **Subqueries**

- **What is a Subquery?**
    
    A Subquery is simply a **SQL query placed inside another SQL query**. It is often found inside the `WHERE` part of the main query.
    
- **Why do we use them?**
    
    We use subqueries when we need **two steps** to get a final result.
    
    1. **Step 1 (Inner Query):** This query runs first and figures out a specific value or set of values needed.
    
    2. **Step 2 (Outer/Main Query):** This query then uses the value from Step 1 to complete the main search.
    

**Rules for Writing Subqueries:**

- Always enclose the subquery in **parentheses ()**.
- Place the subquery on the **right side** of the comparison condition (like `>`, `=`, or `IN`).

### Types of Subqueries

1. **Single-Row Subqueries**

◦ **What they do:** They return **only one single value** (one row).

◦ **Operators used:** You must use single-row comparison signs like `=`, `>`, `<` (less than), and `<>` (not equal to).

◦ **Clarification:** You can use group functions (like `MIN`) in a subquery to guarantee it returns just one value. (Example: finding everyone whose salary equals the *minimum* salary, where the minimum salary is a single number like 200).

2. **Multiple-Row Subqueries**

◦ **What they do:** They return **more than one value** (multiple rows).

◦ **Operators used:** Because they return a list of values, they require special comparison operators:

▪ **IN**: Checks if the main query's value is **equal to *any*** value in the list returned by the subquery.

▪ **ANY**: Compares the main query value to *each* value in the list.

• `> ANY`: This is true if the value is greater than the **minimum** value in the list.

• `< ANY`: This is true if the value is less than the **maximum** value in the list.

▪ **ALL**: Compares the main query value to **every single value** in the list.

• `> ALL`: This is true if the value is greater than the **maximum** value in the list.

• `< ALL`: This is true if the value is less than the **minimum** value in the list.

### **SQL Joins (Combining Tables)**

A `JOIN` is used to **link rows from two or more tables** together based on a common piece of information (a matching field).

| Join Type | Simple Explanation | Venn Diagram Visualization |
| --- | --- | --- |
| **INNER JOIN** | **Returns only the matching records** that exist in *both* tables. This is the most common join. | Shows the overlapping area of two circles (Table 1 and Table 2). |
| **LEFT JOIN** | Returns **all records from the left table**. If there are no matches in the right table, the columns from the right table will show **NULL**. | Shows the left circle entirely, plus the overlap. |
| **RIGHT JOIN** | Returns **all records from the right table**. If there are no matches in the left table, the columns from the left table will show **NULL**. | Shows the right circle entirely, plus the overlap. |
| **FULL JOIN** | Returns **all records** from *either* table (Table 1 or Table 2). It is a complete union of the data. If a record only exists in one table, the columns from the other table will be **NULL**. | Shows both circles entirely. *Note: In MySQL, you must combine LEFT and RIGHT Joins using UNION to get this result*. |
| **NATURAL JOIN** | Joins tables automatically on **all columns that have the exact same name**. It aims to avoid showing the shared column name twice (redundancy). |  |

![image.png](image.png)

![image.png](image%201.png)

![image.png](image%202.png)

## **Database Keys**

Keys are essential rules that help connect tables and ensure data is accurate.

### Primary Key (PK)

**What is it?** The Primary Key **uniquely identifies every single record** (row) in a table. It’s the guaranteed way to point to a specific row.

**Key Rules:**

- It must hold **UNIQUE values** (no duplicates).
- It **cannot contain NULL values** (must always have a value).
- A table can only have **one primary key**.

**Composite Primary Key**

Common use-case - when we have a many-to-many relationship between two tables i.e. multiple rows in table

A are associated with multiple rows in table B.

- Examples
- A customer and product table – A customer can purchase many products also a product can be purchased by many customers.
- Author and Books – One author can write many books and also a book can be written by many authors
- NB: RDBMS does not allow implementation of many-to-many relationship. Therefore, we need to create a Third table commonly called JUNCTION/LINK table i.e., the table that will contain the many-to-many relationship.
- The junction table would usually contain only the two Primary key columns

![image.png](image%203.png)

### Foreign Key (FK)

**What is it?** A Foreign Key is a field in one table (the **child table**) that **links directly back to the Primary Key** in another table (the **parent table**). This creates relationships, such as a one-to-many relationship (e.g., one customer having many orders).

**Key Rules:**

- The FK is defined on the **child table**.
- The FK column must be the **same data type** as the PK column it references.
- A table can have **more than one foreign key**.

![image.png](image%204.png)

### **Referential Actions**

**(How FKs Handle Changes in the Parent Table):**

These options tell the database what to do to the child records if the primary key record in the parent table is deleted or updated:

**CASCADE**→ Delete or update the row from the parent table and automatically delete
                    or update the matching rows in the child table. 
SET NULL →  Delete or update the row from the parent table and set the foreign key
                     column or columns in the child table to NULL.
RESTRICT → if a row from the parent table has a matching row in the child table,
                    MySQL rejects deleting or updating rows in the parent table.
NO ACTION → is the same as RESTRICT.

| Action | When Parent Key is Deleted/Updated | Effect on Child Records |
| --- | --- | --- |
| **RESTRICT / NO ACTION** | Rejects the delete or update action on the parent table. | **Prevents** the change if child records are referencing it. |
| **CASCADE** | Deletes or updates the parent key. | The matching child records are **automatically deleted or updated** too. |
| **SET NULL** | Deletes or updates the parent key. | The Foreign Key column(s) in the matching child records are **automatically set to NULL**. |