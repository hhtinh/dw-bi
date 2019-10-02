-- Implementing Full Intersection
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