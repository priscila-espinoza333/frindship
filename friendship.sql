/*Usuarios con nombre de sus amigos*/
SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name  
FROM friendships LEFT JOIN users
	ON friendships.user_id = users.id
LEFT JOIN users as user2 
	ON friendships.friend_id = user2.id;
/*-----------------------------------------------------*/  
			/*Consulta 1*/
SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name 
FROM friendships LEFT JOIN users
	ON friendships.user_id = users.id
LEFT JOIN users as user2 
	ON friendships.friend_id = user2.id
WHERE users.id = 1;
/*-----------------------------------------------------*/  
			/*Consulta 2*/ 
SELECT DISTINCT friendships.friend_id, user2.first_name as friend_first_name, user2.last_name as friend_last_name 
FROM friendships LEFT JOIN users
	ON friendships.user_id = users.id
LEFT JOIN users as user2 
	ON friendships.friend_id = user2.id
WHERE friendships.friend_id < 6;   

/*-----------------------------------------------------*/  
			/*Consulta 3*/ 
SELECT users.first_name, users.last_name, COUNT(friendships.friend_id) AS numero_amigos
FROM friendships
LEFT JOIN users ON friendships.user_id = users.id
WHERE users.id = 1
GROUP BY users.first_name, users.last_name;

/*-----------------------------------------------------*/  
			/*Consulta 4*/ 
INSERT INTO users (id, first_name, last_name, created_at) 
VALUES ('6', 'nik', 'patrol', '2023-10-07 22:22:22');

INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('7', '6', '2', '2023-10-07 22:22:22');
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('8', '6', '4', '2023-10-07 22:22:22');
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('9', '6', '5', '2023-10-07 22:22:22');

/*-----------------------------------------------------*/  
			/*Consulta 5*/   
SELECT friendships.friend_id, user2.first_name as friend_first_name, user2.last_name as friend_last_name 
FROM friendships LEFT JOIN users
	ON friendships.user_id = users.id
LEFT JOIN users as user2 
	ON friendships.friend_id = user2.id
WHERE users.id = 2
ORDER BY user2.first_name ASC;   

/*-----------------------------------------------------*/  
			/*Consulta 6*/ 
DELETE FROM friendships WHERE (id = 5);  

/*-----------------------------------------------------*/  
			/*Consulta 7*/           
SELECT DISTINCT user2.first_name as friend_first_name, user2.last_name as friend_last_name 
FROM friendships LEFT JOIN users
	ON friendships.user_id = users.id
LEFT JOIN users as user2 
	ON friendships.friend_id = user2.id
WHERE friendships.friend_id < 6;
            