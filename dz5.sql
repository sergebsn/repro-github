#-------Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

# task 1
INSERT INTO `shop`.`users` 
	(`name`, `birthday_at`)
VALUES
	('test7', '1982-03-01'),
    ('test8', '1984-04-04'),
    ('test9', '1980-01-11');
    
UPDATE `users` SET `updated_at` = NOW(), `created_at` = NOW() WHERE `updated_at` IS NULL OR `created_at` IS NULL;

#----------------------------------------------------------------------------------------------------------------------
# task 2
truncate `shop`.`users`;

INSERT INTO `shop`.`users` 
	(`name`, `birthday_at`, `created_at`, `updated_at`)
VALUES
	('test10', '1982-03-01', '20.10.2017 8:10', '20.10.2017 8:10' ),
    ('test11', '1984-04-04', '20.10.2018 8:10', '20.10.2018 8:10' ),
    ('test12', '1980-01-11', '20.10.2019 8:10', '20.10.2019 8:10' );

SELECT STR_TO_DATE(created_at, "%d.%m.%Y %k:%i") FROM `shop`.`users` ;
SELECT STR_TO_DATE(updated_at, "%d.%m.%Y %k:%i") FROM `shop`.`users` ;

UPDATE `shop`.`users` SET `created_at` = STR_TO_DATE(created_at, "%d.%m.%Y %k:%i");
UPDATE `shop`.`users` SET `updated_at` = STR_TO_DATE(updated_at, "%d.%m.%Y %k:%i");

ALTER TABLE `shop`.`users` MODIFY created_at DATETIME
ALTER TABLE `shop`.`users` MODIFY updated_at DATETIME;

#------------------------------------------------------------------------------------------------------------------------
#task 3
SELECT * FROM storehouses_products;

INSERT INTO `shop`.`storehouses_products` 
	(`storehouse_id`, `product_id`, `value`)
VALUES
	(1, 2, 350),
    (2, 1, 150 ),
    (1, 3, 0),
    (1, 2, 90),
    (2, 1, 1150 ),
    (1, 3, 1350),
    (2, 1, 0),
    (1, 2, 50),
    (2, 3, 1150 ),
    (1, 2, 1250);
    
SELECT * FROM storehouses_products ORDER BY value=0, value ASC; #помог александр

#-------Практическое задание теме «Агрегация данных»
#task 1
SELECT `name`, TIMESTAMPDIFF(YEAR,`birthday_at`,CURDATE()) AS age  FROM `users`;

#task 2
SELECT dayname(CONCAT(YEAR(NOW()), '-' ,SUBSTRING(birthday_at,6,10))) AS week_day_this_year,
 COUNT(dayname(CONCAT(YEAR(NOW()), '-' ,SUBSTRING(birthday_at,6,10)))) AS amount
 FROM users
 GROUP BY week_day_this_year;