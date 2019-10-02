-- Extracting Master Records From Tables
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: objects
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TABLE ThesisOld
GO
CREATE TABLE ThesisOld (
   StudentId INTEGER,
   Member1 CHAR(255),
   Member2 CHAR(255),
   Member3 CHAR(255),
   Grade CHAR(2)
)
GO

INSERT INTO ThesisOld(StudentId,Member1,Member2,Member3) VALUES(1,'Baird, Frances', 'Anderson, Terry', 'Newton, Isaac')
INSERT INTO ThesisOld(StudentId,Member1,Member2,Member3) VALUES(2,'Newton, Isaac','Anderson, Terry','Smith, John')
INSERT INTO ThesisOld(StudentId,Member1,Member2,Member3) VALUES(3,'Newton, Isaac','Einstein, Albert','Base, Samuel')
INSERT INTO ThesisOld(StudentId,Member1,Member2,Member3) VALUES(4,'Anderson, Terry', 'Smith, John','Einstein, Albert')
GO


DROP TABLE ProfessorMaster
GO
CREATE TABLE ProfessorMaster(
   ProfessorId INTEGER IDENTITY,
   ProfessorName CHAR(255) UNIQUE
)
GO

DROP TABLE ThesisData
GO
CREATE TABLE ThesisData( 
   StudentId INTEGER,
   Member1 INTEGER,
   Member2 INTEGER,
   Member3 INTEGER,
   Grade CHAR(2)
)
GO


