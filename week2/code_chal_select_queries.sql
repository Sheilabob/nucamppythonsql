SELECT company_name FROM customers
WHERE company_name >= 'Q'
ORDER BY company_name DESC;

SELECT first_name, last_name FROM employees
WHERE title = 'Sales Representative'
ORDER BY last_name, first_name;

SELECT first_name, home_phone FROM employees
WHERE first_name LIKE 'A%' AND home_phone LIKE '%4%'
ORDER BY employee_id;