-- Aggregating Hierarchies 
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: objects 
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE Projects
GO
CREATE TABLE Projects(
   Name VARCHAR(20),
   Cost INTEGER,
   Parent INTEGER,
   VertexId INTEGER,
   Primary key(VertexId)
)
GO

INSERT INTO Projects VALUES('New SW',0,0,1)
INSERT INTO Projects VALUES('Specifications',0,1,2)
INSERT INTO Projects VALUES('Interviews',5,2,3)
INSERT INTO Projects VALUES('Drafts',10,2,4)
INSERT INTO Projects VALUES('Consolidations',2,2,5)
INSERT INTO Projects VALUES('Final document',15,2,6)
INSERT INTO Projects Values('Presentation',1,6,7)
INSERT INTO Projects VALUES('Prototype',0,1,8)
INSERT INTO Projects VALUES('UI Design',10,8,9)
INSERT INTO Projects VALUES('Calculations',10,8,10)
INSERT INTO Projects VALUES('Correctness Testing',3,10,11)
INSERT INTO Projects VALUES('Database',10,8,12)
INSERT INTO Projects VALUES('Development',30,1,13)
INSERT INTO Projects VALUES('UI Implementation',10,13,14)
INSERT INTO Projects VALUES('Coding',20,13,15)
INSERT INTO Projects VALUES('Initial testing',40,13,16)
INSERT INTO Projects VALUES('Beta testing',40,1,17)
INSERT INTO Projects VALUES('Final adjustments',5,17,18)
INSERT INTO Projects VALUES('Production testing',20,1,19)
GO