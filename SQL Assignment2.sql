use hr;
/* 1. Write a query to find the addresses(location_id,street_address,city,state_province,country_name) of all the departments.*/
SELECT 
    location_id,
    street_address,
    city,
    state_province,
    country_name
FROM
    locations AS l
        left JOIN
    countries AS c ON l.country_id = c.country_id;
/* 2. Write a query to find the name (first_name,last name), department ID and name of all the employees.*/
SELECT 
    first_name, last_name, e.department_id, department_name
FROM
    employees AS e
        LEFT JOIN
    departments AS d ON e.department_id = d.department_id;

/* 3. Write a query to find the name(first_name,last_name),job,department ID and name of the employees who works in London.*/      
SELECT 
    first_name,
    last_name,
    e.job_id,
    e.department_id,
    d.department_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
        JOIN
    locations AS l ON l.location_id = d.location_id
WHERE
    l.city = 'London';
    
/* 4. Write a query  to find the employee_id,name(last_name) along with their manager_id and name(last_name).*/
SELECT 
    e.employee_id,
    e.last_name AS employee,
    m.employee_id AS Manager_ID,
    m.last_name AS Manager
FROM
    employees AS e
        JOIN
    employees AS m ON e.employee_id = m.manager_id;
    
/* 5. Write a query to find the name (first_name,last_name) and hire date of the employees who hired after 'Jones'.*/
SELECT 
    first_name, last_name, hire_date
FROM
    employees
WHERE
    hire_date > (SELECT 
            hire_date
        FROM
            employees
        WHERE
            last_name = 'Jones')
ORDER BY hire_date;

/* 6. Write a query to get the department name and number of employees in the department.*/
SELECT 
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS `No.of employees`
FROM
    departments AS d
        JOIN
    employees AS e ON d.department_id = e.department_id
GROUP BY d.department_id;
select * from job_history;
/* 7. Write a query to display department name,name(first_name,last_name), hire_date,salary of the manager for all managers whose experience is more than 15 year.*/
SELECT 
    department_name,
    first_name,
    last_name,
    hire_date,
    salary,
    (DATEDIFF(NOW(), hire_date)) / 365 AS Experience
FROM
    employees AS m
        JOIN
    departments AS d ON d.manager_id = m.employee_id
WHERE
    (DATEDIFF(NOW(), hire_date)) / 365 > 15;
    
/* 8. Write a query to find name(first_name,last_name) and salary of the employees who have a higher salary than the employee whose last_name ='Bull'.*/
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > (SELECT 
            salary
        FROM
            employees
        WHERE
            last_name = 'Bull');    
    
/* 9. Write a query to find the name(first_name,last_name) of all the employees who works in the IT department.*/
SELECT 
    first_name, last_name, department_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    d.department_name = 'IT';   
    
/* 10. Write  query to find the name (first_name,last_name) of the employees who have a manager and worked in a USA based department.*/
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    manager_id IN (SELECT 
            employee_id
        FROM
            employees
        WHERE
            department_id IN (SELECT 
                    department_id
                FROM
                    departments
                WHERE
                    location_id IN (SELECT 
                            location_id
                        FROM
                            locations
                        WHERE
                            country_id = 'US')));

/* 11. Write a query to find the name (first_name,last_name), and salary of the employees whose salary is greater than the average salary.*/
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees);  
            
/* 12. Write a query to find the name (first_name,last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.*/
SELECT 
    first_name, last_name, salary
FROM
    employees AS e
        JOIN
    jobs AS j ON e.job_id = j.job_id
WHERE
    e.salary = j.min_salary;            
    
/* 13. Write a query to find the name (first_name,last_name), and salary of the employees who earns more than the average salary and work in any of the IT departments.*/    
SELECT 
    first_name, last_name, salary
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees)
        AND d.department_name LIKE 'IT%';


/* 14. Write a query to find the name (first_name,last_name) and salary of the employees who earn the same salary as the minimum salary for all department.*/
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary = (SELECT 
            MIN(salary)
        FROM
            employees);

/* 15. write a query to find name (first_name,last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Cleark(job_id='SH_CLERK'). Sort the results of the salary of the lowest to highest.*/
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > ALL (SELECT 
            salary
        FROM
            employees
        WHERE
            job_id = 'SH_CLERK')
ORDER BY salary;
                          