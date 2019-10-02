-- Comparing Two Sets for Equality
--
-- Chapter 2 - Sets
-- Type of content: objects
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE StudentsOct
GO
CREATE TABLE StudentsOct (
   CourseId CHAR(20),
   StudentName CHAR(40),
   Score DECIMAL(4,2),
   TermPaper INTEGER
)
GO
INSERT INTO StudentsOct(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Andrew',11.00,3)
GO

DROP TABLE StudentsNov
GO
CREATE TABLE StudentsNov (
   CourseId CHAR(20),
   StudentName CHAR(40),
   Score DECIMAL(4,2),
   TermPaper INTEGER
)
GO

INSERT INTO StudentsNov(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Andrew',11.00,3)
INSERT INTO StudentsNov(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Andrew',11.00,3)
INSERT INTO StudentsNov(CourseId,StudentName,Score, TermPaper) VALUES('ACCN101','Bert',13.40,1)
GO