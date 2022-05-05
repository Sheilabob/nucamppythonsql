WITH names AS (
	SELECT company_name FROM customers
	UNION ALL
	SELECT company_name FROM suppliers
	UNION ALL
	SELECT company_name FROM shippers
)
SELECT company_name
FROM names
WHERE company_name LIKE 'D%';

SELECT p.product_name 
FROM products p
WHERE EXISTS(
	SELECT category_id, category_name FROM categories c
	WHERE c.category_id = p.category_id
	AND c.category_name LIKE 'C%'
);