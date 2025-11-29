CREATE DATABASE employee;
USE employee;

CREATE TABLE dept (
    dno VARCHAR(3) PRIMARY KEY,
    dname VARCHAR(50) NOT NULL,
    mgreno INT
);

CREATE TABLE emp (
    eno INT PRIMARY KEY,
    ename VARCHAR(50) NOT NULL,
    bdate DATE,
    title VARCHAR(10),
    salary DECIMAL(10, 2),
    dno VARCHAR(3),
    FOREIGN KEY (dno) REFERENCES dept(dno)
);

CREATE TABLE proj (
    pno INT PRIMARY KEY,
    pname VARCHAR(50) NOT NULL,
    budget DECIMAL(15, 2),
    dno VARCHAR(3),
    FOREIGN KEY (dno) REFERENCES dept(dno)
);

CREATE TABLE workson (
    eno INT NOT NULL,
    pno INT NOT NULL,
    resp VARCHAR(20),
    hours DECIMAL(5, 1),
    PRIMARY KEY (eno, pno),
    FOREIGN KEY (eno) REFERENCES emp(eno),
    FOREIGN KEY (pno) REFERENCES proj(pno)
);

INSERT INTO dept (dno, dname, mgreno) VALUES
('D1', 'Consulting', 102),
('D2', 'Engineering', 101),
('D3', 'Sales', 105),
('D4', 'Marketing', 103),
('D5', 'Research', 104);

INSERT INTO emp (eno, ename, bdate, title, salary, dno) VALUES
(101, 'Alice Smith', '1985-05-15', 'EE', 75000.00, 'D2'),
(102, 'Bob Johnson', '1978-11-20', 'Manager', 95000.00, 'D1'),
(103, 'Charlie Brown', '1992-03-01', 'SA', 42000.00, 'D4'),
(104, 'David Lee', '1980-07-25', 'EE', 80000.00, 'D5'),
(105, 'Eva Green', '1995-01-10', 'SA', 55000.00, 'D3'),
(106, 'Frank White', '1989-09-03', 'Analyst', 68000.00, 'D1'),
(107, 'Grace Hall', '1975-04-12', 'Manager', 110000.00, 'D2'),
(108, 'Henry King', '1998-12-30', 'EE', 65000.00, 'D5'),
(109, 'Ivy Scott', '1990-02-28', 'Analyst', 52000.00, 'D3'),
(110, 'Jack Miller', '1982-06-18', 'SA', 71000.00, 'D4');

INSERT INTO proj (pno, pname, budget, dno) VALUES
(1, 'Alpha', 150000.00, 'D2'),
(2, 'Beta', 80000.00, 'D1'),
(3, 'Gamma', 250000.00, 'D2'),
(4, 'Delta', 45000.00, 'D4'),
(5, 'Epsilon', 120000.00, 'D5'),
(6, 'Zeta', 60000.00, 'D3'),
(7, 'Eta', 180000.00, 'D1'),
(8, 'Theta', 30000.00, 'D4'),
(9, 'Iota', 90000.00, 'D5'),
(10, 'Kappa', 210000.00, 'D2');

INSERT INTO workson (eno, pno, resp, hours) VALUES
(101, 1, 'Engineer', 40.0),
(102, 2, 'Manager', 5.0),
(103, 4, 'Tester', 25.5),
(104, 5, 'Engineer', 35.0),
(105, 6, 'Consultant', 15.0),
(106, 7, 'Analyst', 40.0),
(107, 3, 'Manager', 8.5),
(108, 5, 'Intern', 20.0),
(109, 6, 'Analyst', 10.0),
(110, 8, 'Tester', 30.0),
(102, 7, 'Manager', 9.0),
(106, 2, 'Analyst', 12.0);

select pno, pname, budget from proj
where budget > 100000;

select * from workson
where (hours < 10.0 and resp = 'Manager');

select ename from emp
where dno = 'D1'
order by salary desc;

select eno, salary from emp,dept
where dname = 'Consulting'
order by salary desc;

select ename, pname, title, hours from emp, proj, workson 
where emp.eno=workson.eno and proj.pno=workson.pno;