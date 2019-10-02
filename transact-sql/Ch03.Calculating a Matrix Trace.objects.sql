-- Calculating a Matrix Trace
--
-- Chapter 3 - Data Structures
-- Type of content: objects
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TABLE Matrices
GO
CREATE TABLE Matrices (
   Matrix VARCHAR(20),
   X INTEGER,
   Y INTEGER,
   Value INTEGER
)
GO

INSERT INTO Matrices VALUES('A',1,1,6)
INSERT INTO Matrices VALUES('A',1,2,3)
INSERT INTO Matrices VALUES('A',2,1,4)
INSERT INTO Matrices VALUES('A',2,2,7)
INSERT INTO Matrices VALUES('B',1,1,6)
INSERT INTO Matrices VALUES('B',1,2,3)
INSERT INTO Matrices VALUES('B',2,1,5)
INSERT INTO Matrices VALUES('B',2,2,2)
INSERT INTO Matrices VALUES('S',1,1,5)
INSERT INTO Matrices VALUES('S',2,1,6)
INSERT INTO Matrices VALUES('D',1,1,3)
INSERT INTO Matrices VALUES('D',1,2,4)
INSERT INTO Matrices VALUES('D',1,3,5)
INSERT INTO Matrices VALUES('D',2,1,5)
INSERT INTO Matrices VALUES('D',2,2,6)
INSERT INTO Matrices VALUES('D',2,3,7)
INSERT INTO Matrices VALUES('D',3,1,8)
INSERT INTO Matrices VALUES('D',3,2,9)
INSERT INTO Matrices VALUES('D',3,3,0)
GO