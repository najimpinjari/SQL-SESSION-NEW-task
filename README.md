# SQL-SESSION-NEW-

-- Today's assignment 8/11/2023 
-- solve above problems using this tables 

-- Create the users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- Insert some sample data into the users table
INSERT INTO users (user_id, username, email) VALUES
    (1, 'JohnDoe', 'johndoe@example.com'),
    (2, 'JaneDoe', 'janedoe@example.com'),
    (3, 'AliceSmith', 'alicesmith@example.com');

-- Create the mobiles table
CREATE TABLE mobiles (
    mobile_id INT PRIMARY KEY,
    user_id INT,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert some sample data into the mobiles table
INSERT INTO mobiles (mobile_id, user_id, brand, model) VALUES
    (1, 1, 'Apple', 'iPhone 13'),
    (2, 2, 'Samsung', 'Galaxy S21'),
    (3, 3, 'OnePlus', '9 Pro');


	select * from mobiles
	select * from users

	--Retrieve all mobiles with their users' information:
select mobiles.*, users.username,email
from mobiles 
left join users
on mobiles.user_id = users.user_id

--Count the number of mobiles for each user:

select users.username, count(mobiles.mobile_id) as num_mobile 
from users
left join mobiles
on mobiles.user_id = users.user_id
group by users.username

--List the users who do not have any mobiles:
select users.username
from users
left join mobiles
on mobiles.user_id = users.user_id
where mobiles.mobile_id is null

--Find the user who owns the most mobiles:
SELECT u.username, COUNT(m.mobile_id) AS num_mobiles
FROM users u
JOIN mobiles m ON u.user_id = m.user_id
GROUP BY u.username
ORDER BY num_mobiles DESC
LIMIT 1

--Retrieve the details of the mobile with the highest mobile_id:
select * 
from mobiles 
order by mobile_id desc 
limit 1 

--List the users and the count of mobiles they own, sorted by the count in descending order:

select users.username, count( mobile_id) as num_mobiles
from users  
left join mobiles
on mobiles.user_id = users.user_id
group by users.username
order by num_mobiles desc	

--Retrieve the number of users in the database:
select count(*) as num_users
from users

--Retrieve the average number of mobiles per user:

select avg(num_mobile) as	avg_mobile_per_user
from 
( select users.username, count(mobiles.mobile_id ) as num_mobile
from users
left join mobiles 
on mobiles.mobile_id = users.user_id
group by users.username )


