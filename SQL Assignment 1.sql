use hr;
/* 1. Write a query to display the names(first_name,last_name) using alias name "First Name","Last Name".*/
SELECT 
    first_name AS `First Name`, last_name AS `Last Name`
FROM
    employees;

/* 2. Write a query to get unique department ID from employee table.*/
SELECT DISTINCT
    department_id
FROM
    employees;

/* 3. Write a query to get all employee details from the employee table order by first name,descending.*/
SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

/* 4. Write a query to get the names(first_name,last_name),salary,PF of all the employee(PF is calculated as 15% of salary).*/
SELECT 
    first_name, last_name, salary, (salary * 0.15) AS PF
FROM
    employees;

/* 5. Write a query to get the employee ID ,names(first_name,last_name),salary in ascending order of salary.*/
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
ORDER BY salary;

/* 6. Write a query  to get the total salaries payable to employees.*/
SELECT 
    SUM(salary) AS `Total Payable salaries`
FROM
    employees;

/* 7. Write a query to get the maximum and minimum salary from  employee table.*/
SELECT 
    MAX(salary) AS `Maximum Salary`,
    MIN(salary) AS `Minimum Salary`
FROM
    employees;

/* 8. Write a query  to get the average salary and number of employees in the employees table.*/
SELECT 
    AVG(salary), COUNT(employee_id)
FROM
    employees;

/* 9. Write a query to get the number of employees working with the company.*/
SELECT 
    COUNT(DISTINCT employee_id) AS `No. of employee`
FROM
    employees;

/* 10. Write a query to get the number of jobs available in the employees table.*/
SELECT 
    COUNT(DISTINCT job_id) AS `No. of Jobs`
FROM
    employees;

/* 11. Write a query to get all first names from employee table in upper case.*/
SELECT 
    UPPER(first_name), first_name
FROM
    employees;

/* 12. Write a query to get first 3 characters of first name from employee table.*/
SELECT 
    LEFT(first_name, 3), first_name
FROM
    employees;

/* 13. Write a query to get first name from employees table after removing white spaces from both side.*/
SELECT 
    TRIM(first_name), first_name
FROM
    employees;

/* 14. Write a query to get the length of employee names(first_name,last_name) from employee table.*/
SELECT 
    LENGTH(first_name), LENGTH(last_name)
FROM
    employees;

/* 15. Write a query to check if first_name fields of the employees table contains numbers.*/
SELECT 
    first_name,
    CASE
        WHEN first_name REGEXP '[0-9]' THEN 'Yes'
        ELSE 'No'
    END AS `Contains No.`
FROM
    employees;

/* 16. Write a query to display names(first_name,last_name) and salary  from all employees whose salary is not in the range $10,000 through $15,000.*/
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary >= 10000 AND salary <= 15000;
    
    
 /* 17. Write a query to display the name(first_name,last_name) and department ID of all employees in departments 30 or 100 in ascending order.*/
SELECT 
    first_name, last_name, department_id
FROM
    employees
WHERE
    department_id IN (30 , 100)
ORDER BY department_id;
 
 /* 18. Write a query to display the name(first_name,last_name) and salary for all employees whose salary is not in range $10,000 through $15,000 and are in department 30 or 100.*/
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    (salary NOT BETWEEN 10000 AND 15000)
        AND department_id IN (30 , 100);
 
 /* 19. Write a query to display the name(first_name,last_name) and hire date for all employee who were hired in 1987.*/
SELECT 
    first_name, last_name, hire_date
FROM
    employees
HAVING YEAR(hire_date) = 1987;
 
 /* 20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.*/
SELECT 
    first_name
FROM
    employees
WHERE
    first_name RLIKE 'a|b';
 
 /* 21. Write a query to display the last name ,job,and salary for all employees whose job is that of a Programmer or a Shipping clerk, and whose salary is not equal to $4,500,$10,000, or $15,000.*/
SELECT 
    last_name, j.job_title AS job, salary
FROM
    employees AS e
        INNER JOIN
    jobs AS j ON e.job_id = j.job_id
WHERE
    j.job_title IN ('Programmer' , 'Shipping Clerk')
        AND salary NOT IN (4500 , 10000, 15000);
 
 /* 22. Write a query to display the last name of employee whose names have exactly 6 character.*/
SELECT 
    last_name
FROM
    employees
WHERE
    LENGTH(first_name) = 6
        AND LENGTH(last_name) = 6;
 
 /* 23. Write a query to display the last name of employees having 'e' as the third character.*/
SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE '__e%';
 
 /* 24. Write a query to get the job_id and related employee's id.*/
SELECT 
    job_id, employee_id
FROM
    employees;
 
 /* 25. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.*/
/*--------------------For hr database-----------------------------*/ 
 use hr;
UPDATE employees 
SET 
    phone_number = REPLACE(phone_number, '123', '999')
WHERE
    phone_number LIKE '%123%';
SELECT 
    *
FROM
    employees;
     /*--------------------------for test database----------------------------*/
 use test_db;
UPDATE emp_phn_no 
SET 
    phone_number = REPLACE(phone_number, '123', '999')
WHERE
    phone_number LIKE '%123%';
SELECT 
    *
FROM
    emp_phn_no;
 
 /* 26. Write a query to get the details of the employees where the length of the first name greater than or equal to 8.*/
SELECT 
    *
FROM
    employees
WHERE
    LENGTH(first_name) >= 8;
 
 /* 27. Write a query to append '@example.com' to email field.*/
 /*---------------------------- Query for Test database ------------------------*/
 use test_db;
CREATE TABLE emp_details SELECT * FROM
    hr.employees;
SELECT 
    *
FROM
    emp_details;
UPDATE emp_details 
SET 
    email = CONCAT(email, '@example.com');
SELECT 
    *
FROM
    emp_details;
 
 /*---------------------- For Hr database ----------------------------------------*/
 use hr;
UPDATE employees 
SET 
    email = CONCAT(email, '@example.com');
 
 /* 28. Write a query to extract the last 4 character of phone number.*/
SELECT 
    phone_number, RIGHT(phone_number, 4)
FROM
    employees;
 
 /* 29. Write a query to get the last word of the street address.*/
SELECT 
    street_address, SUBSTRING_INDEX(street_address, ' ', - 1)
FROM
    locations;
 
 
 /* 30. Write a query to get the locations that have minimum street length.*/
SELECT 
    *
FROM
    locations
WHERE
    LENGTH(street_address) <= (SELECT 
            MIN(LENGTH(street_address))
        FROM
            locations);

/* 31. Write a query to display the first word from those job titiles which contains more than one words.*/
SELECT 
    job_title,
    SUBSTRING(job_title,
        1,
        INSTR(job_title, ' ') - 1)
FROM
    jobs;

/* 32. Write a query to display the length of first name for employees where last name contains character 'c' after 2nd position.*/
SELECT 
    first_name, last_name, LENGTH(first_name)
FROM
    employees
WHERE
    INSTR(last_name, 'c') > 2;

/* 33. Write a query that display the first name and length of the first name for all employees whose name start with the letters 'A','J' or 'M'. Given each column an appropriate label.Sort the result by the employees'first names.*/
SELECT 
    first_name, LENGTH(first_name)
FROM
    employees
WHERE
    first_name REGEXP '^[AMJ]'
ORDER BY first_name;

/* 34. Write a query to display the first name and salary for all employees. Format the salary to be 10 character long,left-padded with the $ symbol. Label the coulmn Salary.*/
SELECT 
    first_name, LPAD(salary, 10, '$') AS SALARY
FROM
    employees;
 
 /* 35. Write a query to display the first eight characters of the employees'first names and indicates the amounts of their salaries with '$' sign.Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary.*/
SELECT 
    LEFT(first_name, 8), LPAD(salary, 10, '$')
FROM
    employees;
 
 /* 36. Write a query to display the employess with their code,first name,last name and hire date who hired either on seventh day of any month or seventh month in any year.*/
SELECT 
    employee_id, first_name, last_name, hire_date
FROM
    employees
WHERE
    DAYOFMONTH(hire_date) = 7
        OR MONTH(hire_date) = 7;

/*-------------------------- NorthWind Database Excerises -------------------------------------*/
use northwind;

/* 1. Write a query to get Product name and quantity/unit.*/
SELECT 
    ProductName, QuantityPerUnit
FROM
    products;

/* 2. Write a query to get current Product list(Product ID and name). */
SELECT 
    ProductID, ProductName
FROM
    products
WHERE
    Discontinued = 0;


/* 3. Write a query to get discontinued Product list (Product ID and name). */
SELECT 
    ProductID, ProductName
FROM
    products
WHERE
    Discontinued = 1;

/* 4. Write a query  to get most expense and least expensive Product list(name and unit price).*/
SELECT 
    ProductName, UnitPrice
FROM
    products
ORDER BY UnitPrice DESC;

/* 5. Write a query to get Product list(id,name,unit price) where current products cost less than $20.*/
SELECT 
    ProductID, ProductName, UnitPrice
FROM
    products
WHERE
    Discontinued = 0 AND UnitPrice < 20;

/* 6. Write a query to get Product list(id,name,unit price) where product cost between $15 and $25.*/
SELECT 
    ProductID, ProductName, UnitPrice
FROM
    products
WHERE
    UnitPrice BETWEEN 15 AND 25
ORDER BY UnitPrice DESC;

/* 7. Write a query to get Product list(name,unitprice) of above average price.*/
SELECT 
    ProductName, UnitPrice
FROM
    products
WHERE
    UnitPrice > (SELECT 
            AVG(UnitPrice)
        FROM
            products)
ORDER BY UnitPrice;

/* 8. Write a query to get Product list (name, unit price) of ten most expensive products.*/
SELECT 
    ProductName, UnitPrice
FROM
    products
ORDER BY UnitPrice DESC
LIMIT 10;

/* 9. Write a query to count current and discontinued products.*/
SELECT 
    COUNT(ProductID)
FROM
    products
GROUP BY Discontinued;

/* 10. Write a query to get Product list(name,unit on order,unit in stock) of stock is less than the quantity on order.*/
SELECT 
    ProductName, UnitsOnOrder, UnitsInStock
FROM
    products
WHERE
    (UnitsInStock < UnitsOnOrder)
        AND Discontinued = 0;
