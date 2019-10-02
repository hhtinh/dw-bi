-- Finding Complements of Sets with Different Universes
--
-- Chapter 2 - Sets
-- Type of content: objects
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE Students
GO
CREATE TABLE Students (
   CourseId CHAR(20),
   StudentName CHAR(40),
   Score DECIMAL(4,2),
   TermPaper INTEGER
)
GO

INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Andrew',15.60,4)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Andrew',10.40,2)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Andrew',11.00,3)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Bert',13.40,1)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Bert',11.20,2)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Bert',13.00,3)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Cindy',12.10,1)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Cindy',16.20,2)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('MGMT120','Andrew',20.20,1)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('MGMT120','Andrew',21.70,2)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('MGMT120','Andrew',23.10,3)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('MGMT120','Cindy',12.10,1)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('MGMT120','Cindy',14.40,2)
INSERT INTO Students(CourseId,StudentName,Score, TermPaper) VALUES('MGMT120','Cindy',16.00,3)
GO

DROP TABLE CourseMaster
GO
CREATE TABLE CourseMaster(
   CourseId CHAR(20),
   numTermPapers INTEGER
)
GO

INSERT INTO CourseMaster VALUES('ACCN101',4)
INSERT INTO CourseMaster VALUES('MGMT120',3)
GO

DROP TABLE Foo
GO
CREATE TABLE Foo(
	i CHAR(1)
)
GO

INSERT INTO Foo VALUES('0')
INSERT INTO Foo VALUES('1')
INSERT INTO Foo VALUES('2')
INSERT INTO Foo VALUES('3')
INSERT INTO Foo VALUES('4')
INSERT INTO Foo VALUES('5')
INSERT INTO Foo VALUES('6')
INSERT INTO Foo VALUES('7')
INSERT INTO Foo VALUES('8')
INSERT INTO Foo VALUES('9')
GO

DROP TABLE Pivot
GO
CREATE TABLE Pivot (
   i INT,
   PRIMARY KEY(i)
)
GO

INSERT INTO Pivot
   SELECT f1.i+f2.i+f3.i
   FROM Foo f1, Foo F2, Foo f3
GO