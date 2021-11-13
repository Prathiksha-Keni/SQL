Create database library;-- used to create the database
USE library;-- used to locate to database
CREATE TABLE Book_Details (-- used to create table
book_id tinyint,-- creating field(or row name with data type)
book_name varchar(30),
book_author varchar(30),
book_price float,
publication_year year,
volume char(10)
);
DESCRIBE Book_Details;-- gives the structure of the table

INSERT INTO Book_Details VALUE (1,'Python','Martin C',500,2000,'v1');-- Inserting values into table
INSERT INTO Book_Details VALUE (2,'Java','Herbert',1000,2005,'v6');

SELECT * FROM Book_Details;-- Shows all the data entered
SELECT book_name FROM Book_Details WHERE publication_Year >= "2000";-- searching publication year >=2000 by book name 
SELECT * FROM Book_Details WHERE book_id = 1;-- searching book id = 1 
SELECT COUNT(*) FROM Book_Details;-- searching how many data are there in the table
ALTER TABLE Book_Details ADD COLUMN No_Of_Pages INT;-- altering table by adding new column at end
ALTER TABLE Book_Details DROP COLUMN No_Of_Pages;-- droping the column
ALTER TABLE Book_Details ADD COLUMN No_Of_Pages INT AFTER book_name;-- altering table by adding new column at specified location
ALTER TABLE Book_Details RENAME COLUMN book_price to Book_Amount;-- renaming column names
ALTER TABLE Book_Details RENAME TO Books;-- renaming table names
DESCRIBE Books;-- gives the structure of the new named table(after renaming)
SELECT * FROM Books;-- shows all the data 
TRUNCATE Books;-- deletes only the data
DROP TABLE Books;-- deletes the table
DROP DATABASE library;-- deletes the database

Create database library;-- since deleted the database creating again 
USE library;
CREATE TABLE Book_Details (-- since deleted the table creating again 
Book_id TINYINT,
Book_Name VARCHAR(20) UNIQUE,-- unique means data should not repeat(or duplicate)
Book_Author VARCHAR(30) NOT NULL,-- not null means have to give some value
Book_Price FLOAT DEFAULT (500),-- default means if we wont give any value it will take default value as 500
Publication_Year YEAR CHECK(Publication_Year > "2000"),-- chcek means when data is entred check if publication year is >2000
Volume CHAR(10),
PRIMARY KEY(Book_Id)-- primary key menas combination of unique key and not null
);
DESCRIBE Book_Details;

INSERT INTO Book_Details VALUE (1,'Python','Martin C',700,2005,'v1'),
							   (2,'Java','Herbert',1000,2004,'v6'),
                               (3,'2666','Robert Bolano',2000,2003,''),-- have assign volume values or else it will not take it
                               (4,'All about Love','Bell Hooks',800,2008,''),
                               (5,'Desert Solitaire','Edward Abbey',100,2010,'v6'),
                               (6,'Disgrace','J M Coetzee',6000,2002,'v10'),
                               (7,'Gilead','Marilynne',350,2009,'v4'),
                               (8,'Giovanni Room','James Baldwin',5500,2016,''),
                               (9,'The Handmaids Tale','Margarete Atwood',8000,2018,'v3'),
                               (10,'Infinite Jest','David',6000,2001,'');
SELECT * FROM Book_Details;
INSERT INTO Book_Details (Book_id,Book_Name,Book_Author,Publication_Year,Volume) VALUE (11,'Python Program','Martin C',2005,'v5');-- insearting values only to specified table names
INSERT INTO Book_Details (Book_id,Book_Name,Book_Author,Publication_Year) VALUE (12,'Java Lang','Herbert',2005);-- here we have not given the price so it will take default value as set
SELECT * FROM Book_Details WHERE Volume IS NULL;-- gives result if volume is null
SELECT * FROM Book_Details WHERE Volume IS NOT NULL;-- gives result if volume is not null

ALTER TABLE Book_Details MODIFY Book_Name VARCHAR(40) NOT NULL;-- changes book name varchar size and sets it to not null
SELECT DISTINCT Book_Author FROM Book_Details;-- gives the details of author(repearing ones are not shown)
UPDATE Book_Details SET Volume = 'v11' WHERE Book_Id = 3;-- updates the value by searching via book id

INSERT INTO Book_Details VALUE (13,'Python l','Martin C',700,2005,'v1');
DELETE FROM Book_Details WHERE Book_id = 13;-- delets the data by searching via book id

SELECT * FROM Book_Details ORDER BY Book_Price;-- orders in aesc order
SELECT * FROM Book_Details ORDER BY Book_Price DESC;-- orders in desc order
SELECT * FROM Book_Details LIMIT 5;-- limits display to 5 data in aesc order
SELECT * FROM Book_Details ORDER BY Book_Id DESC LIMIT 5;-- limits display to 5 data in desc order
SELECT * FROM Book_Details WHERE Book_Name IN('Java', 'Python','Desert');-- display the books that contains these 
SELECT * FROM Book_Details WHERE Book_Price BETWEEN 2000 AND 8000;-- displays books between 2000 and 8000 of price
SELECT Book_Price AS Book_Amount FROM Book_DetaiLs WHERE Book_Price > 500;-- displays books >500 of price and stores it in Book_Amount(new table)

SELECT Book_Author, COUNT(Book_Name) AS Count_Book_Author FROM Book_details GROUP BY Book_Author;
SELECT Book_Name, COUNT(Book_Price) AS Count_Book_Price FROM Book_Details GROUP BY Book_Price;
SELECT Publication_Year, COUNT(Book_Name) AS count_book_name, Book_Name FROM Book_Details WHERE Publication_Year > 2005 GROUP BY Publication_Year;
