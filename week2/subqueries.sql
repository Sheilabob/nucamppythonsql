WITH all_names AS(
	SELECT last_name FROM professors
	UNION ALL
	SELECT last_name FROM students
)
SELECT last_name, COUNT(*)
FROM all_names
GROUP BY last_name;

WITH all_names AS(
	SELECT last_name FROM professors
	UNION ALL
	SELECT last_name FROM students
)
SELECT last_name, COUNT(*)
FROM all_names
GROUP BY last_name
HAVING COUNT(*) > 1;

SELECT first_name, last_name, department_id FROM professors
UNION ALL
SELECT first_name, last_name, major_department_id FROM students;

SELECT 'professor' AS occupation, first_name, last_name, department_id FROM professors
UNION ALL
SELECT 'student' AS occupation, first_name, last_name, major_department_id FROM students;
	

WITH people AS (
	SELECT 'professor' AS occupation, first_name, last_name, department_id FROM professors
	UNION ALL
	SELECT 'student' AS occupation, first_name, last_name, major_department_id FROM students
)
SELECT occupation, first_name, last_name, d.code
FROM people
JOIN departments d
ON department_id = d.id;

WITH people AS (
	SELECT 'professor' AS occupation, first_name, last_name, department_id FROM professors
	UNION ALL
	SELECT 'student' AS occupation, first_name, last_name, major_department_id FROM students
)
SELECT occupation, first_name, last_name, d.code
FROM people
LEFT JOIN departments d
ON department_id = d.id;