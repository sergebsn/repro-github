-------------------------------------- HomeWork 6 ---------------------------------------

-- Task 2
SELECT 
from_users_id ,
COUNT(*)
FROM `messages`
WHERE to_users_id = 11
GROUP BY from_users_id ;

-- Task 3
SELECT
	users_id,
	gender,
	TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age,
		(SELECT COUNT(*) 
	-- (COUNT(posts_id)+COUNT(messages_id)+COUNT(media_id))
				FROM vk.likes
				WHERE `likes`.users_id = `profiles`.users_id)
FROM `profiles`
ORDER BY TIMESTAMPDIFF(YEAR, birthday, NOW())
LIMIT 10

-- Task 4

SELECT 
	COUNT(posts_id),
	COUNT(messages_id),
	COUNT(media_id),
	(SELECT gender FROM `profiles` WHERE users_id = `likes`.users_id)
FROM vk.likes
GROUP BY (SELECT gender FROM `profiles` WHERE users_id = `likes`.users_id)


-- Task 5
SELECT 
*,
(SELECT COUNT(*) FROM messages WHERE from_users_id = users.id)+
(SELECT COUNT(*) FROM messages WHERE to_users_id = users.id)+
(SELECT COUNT(*) FROM posts WHERE users_id = users.id)+
(SELECT COUNT(*) FROM media WHERE users_id = users.id)+
(SELECT COUNT(*) FROM likes WHERE users_id = users.id) AS c_mess
FROM users
ORDER BY c_mess
LIMIT 10
