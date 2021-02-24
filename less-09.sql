START TRANSACTION;
INSERT INTO `sample`.users SELECT id,name FROM `shop`.users WHERE users.id = 1;
DELETE FROM shop.users WHERE id = 1;		
COMMIT;
	

-- TASK 2

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `new_view` AS
    SELECT 
        `products`.`id` AS `id`,
        `products`.`name` AS `name1`,
        `products`.`price` AS `price`,
        `catalogs`.`name` AS `name2`
    FROM
        (`products`
        JOIN `catalogs` ON ((`products`.`catalog_id` = `catalogs`.`id`)))

-- task 3

USE shop;

DELIMITER //

CREATE FUNCTION hello ()
RETURNS TINYTEXT NOT DETERMINISTIC
BEGIN
	DECLARE hour INT;
	SET hour = HOUR(NOW());
	CASE
		WHEN hour BETWEEN 0 AND 5 THEN RETURN "Доброй ночи";
		WHEN hour BETWEEN 6 AND 11 THEN RETURN "Доброе утро";
		WHEN hour BETWEEN 12 AND 17 THEN RETURN "Добрый день";
		WHEN hour BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
	END CASE;
END//

SELECT NOW(), hello()//

-- task 4

CREATE TRIGGER vallidate_name_description_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Both name and desxription are NULL';
	END IF;
END//