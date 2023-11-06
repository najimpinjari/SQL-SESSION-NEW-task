use piramalemployee
go
-- Create a table with a primary key
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL
);

-- Insert values into the Authors table
INSERT INTO Authors (AuthorID, AuthorName) VALUES
(1, 'J.K. Rowling'),
(2, 'George R.R. Martin'),
(3, 'J.R.R. Tolkien');

-- Create a table with a foreign key referencing the primary key of the Authors table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    BookName VARCHAR(255) NOT NULL,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Insert values into the Books table
INSERT INTO Books (BookID, BookName, AuthorID) VALUES
(1, 'Harry Potter and the Philosopher''s Stone', 1),
(2, 'A Game of Thrones', 2),
(3, 'The Fellowship of the Ring', 3),
(4, 'Harry Potter and the Chamber of Secrets', 1),
(5, 'A Clash of Kings', 2),
(6, 'The Two Towers', 3);


select * from Books
select * from Authors

--Select all books with their corresponding author

select b.BookName , a.AuthorName 
from books as b
join Authors as a
on b.AuthorID = a.AuthorID

--Find the author with the AuthorID 2
select Authors.AuthorName ,Authors.AuthorID as id
from Authors
 join Books
on Authors.AuthorID = Books.AuthorID
where Authors.AuthorID = 2
--or
select * from Authors where Authors.AuthorID= 2


--Rank all authors based on the number of books they have writte
SELECT 
    AuthorName, 
    DENSE_RANK() OVER (ORDER BY BookCount DESC) AS AuthorRank
FROM (
    SELECT 
        a.AuthorName, 
        COUNT(b.BookID) AS BookCount
    FROM Authors a
    LEFT JOIN Books b
    ON a.AuthorID = b.AuthorID
    GROUP BY a.AuthorID
) AS AuthorBookCount;



