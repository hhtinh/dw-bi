-- Hiding the Import Procedure  
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: objects
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE BookStore
GO
CREATE TABLE BookStore(
   BookId INTEGER,
   Name CHAR(40),
   Quantity INTEGER,
   Price DECIMAL(10,2),
   Type CHAR(20)
) 
GO

INSERT INTO BookStore(BookId,Name,Quantity,Price,Type) VALUES(1,'Software Engineering', 5, 15,'Manual')
INSERT INTO BookStore(BookId,Name,Quantity,Price,Type) VALUES(2,'Modern Operating Systems', 7, 20,'Reference')
INSERT INTO BookStore(BookId,Name,Quantity,Price,Type) VALUES(3,'Learn SQL', 15, 18,'Textbook')
INSERT INTO BookStore(BookId,Name,Quantity,Price,Type) VALUES(4,'Learn Advanced SQL', 1, 8,'Textbook')
INSERT INTO BookStore(BookId,Name,Quantity,Price,Type) VALUES(5,'JavaScript Tutorial', 5, 10,'Textbook')
INSERT INTO BookStore(BookId,Name,Quantity,Price,Type) VALUES(6,'Modern Operating Systems', 7, 20,'Reference')
INSERT INTO BookStore(BookId,Name,Quantity,Price,Type) VALUES(7,'Learn SQL', 15, 18,'Textbook')
GO

DROP TABLE BookstoreBuffer
GO
CREATE TABLE BookstoreBuffer (
   Id UNIQUEIDENTIFIER DEFAULT NEWID(),
   BookId INTEGER,
   Name CHAR(40),
   Quantity INTEGER,
   Price DECIMAL(10,2),
   Type CHAR(20),
   Status CHAR(1) DEFAULT 'I'
)
GO

