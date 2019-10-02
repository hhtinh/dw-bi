-- Folding Tables
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: objects
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE StudentRankings
GO
CREATE TABLE StudentRankings(
   Id INTEGER,
   Name CHAR(10),
   Y2000 INTEGER,
   Y2001 INTEGER,
   Y2002 INTEGER
)
GO

INSERT INTO StudentRankings(Id, Name,Y2000,Y2001,Y2002) VALUES(1,'Joe', 7, 8, 9)
INSERT INTO StudentRankings(Id, Name,Y2000,Y2001,Y2002) VALUES(2, 'Anna', 1, 2, 3)
INSERT INTO StudentRankings(Id, Name,Y2000,Y2001,Y2002) VALUES(3, 'Billy', 4, 5, 6)
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

