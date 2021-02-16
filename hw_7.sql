-- homework 7 --

-- Task 1
SELECT	
	users.id,
    users.email,
    users.phone,
    media.file,
    media.created_at
FROM users
JOIN media ON users.id = media.users_id;

-- Task 2
SELECT 
	products.id,
    products.name,
    products.price,
    catalogs.name
FROM products
JOIN catalogs ON products.catalog_id = catalogs.id;
