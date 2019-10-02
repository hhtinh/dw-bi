-- Joining Arrays With Tables
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: objects
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE StudentThesis
GO
CREATE TABLE StudentThesis (
   StudentId INTEGER,
   Member1 INTEGER,
   Member2 INTEGER,
   Member3 INTEGER,
   Grade CHAR(1)
)
GO

INSERT INTO StudentThesis VALUES (1,234,322,456,'A');
INSERT INTO StudentThesis VALUES (2,456,322,344,'B');
INSERT INTO StudentThesis VALUES (3,456,455,344,'A');
INSERT INTO StudentThesis VALUES (4,322,123,455,'C');
GO

DROP TABLE Professors
GO
CREATE TABLE Professors (
   Id INTEGER,
   Name CHAR(20)
)
GO

INSERT INTO Professors VALUES (123,'Smith, John');
INSERT INTO Professors VALUES (456,'Newton, Isaac');
INSERT INTO Professors VALUES (455,'Einstein, Albert');
INSERT INTO Professors VALUES (344,'Base, Samuel');
INSERT INTO Professors VALUES (322,'Anderson, Terry');
INSERT INTO Professors VALUES (234,'Baird, Frances');
GO

DROP TABLE Students
GO
CREATE TABLE Students (
   StudentId INTEGER,
   StudentName CHAR(20)
)
GO
  
INSERT INTO Students VALUES (1, 'Bob One');
INSERT INTO Students VALUES (2, 'Mark Twain');
INSERT INTO Students VALUES (3, 'Brent Thrice');
INSERT INTO Students VALUES (4, 'Joe Forth');
GO
