SELECT * FROM departments;

SELECT * FROM students;

SELECT * FROM professors;

SELECT s.last_name FROM students s
UNION
SELECT p.last_name FROM professors p;

SELECT s.last_name FROM students s
UNION ALL
SELECT p.last_name FROM professors p;

SELECT s.last_name FROM students s
UNION ALL
SELECT p.last_name FROM professors p
ORDER BY last_name;

SELECT s.last_name FROM students s
INTERSECT
SELECT p.last_name FROM professors p
ORDER BY last_name;

SELECT s.first_name, s.last_name, d.name
FROM departments d
INNER JOIN students s
ON d.id = s.major_department_id;

SELECT s.first_name, s.last_name, d.name
FROM departments d
RIGHT JOIN students s
ON d.id = s.major_department_id;

SELECT s.first_name, s.last_name, d.name
FROM departments d
FULL JOIN students s
ON d.id = s.major_department_id;

SELECT name FROM departments d
EXCEPT
SELECT DISTINCT name FROM departments d
INNER JOIN students s
ON s.major_department_id = d.id;