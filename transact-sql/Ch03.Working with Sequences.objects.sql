-- Working with Sequences
--
-- Chapter 3 - Data Structures
-- Type of content: objects
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE ProductionLine
GO
CREATE TABLE ProductionLine (
   ContainerId INTEGER,
   Purity INTEGER
)
GO

INSERT INTO ProductionLine(ContainerId, Purity) VALUES(1, 100);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(2, 100);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(3, 101);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(4, 102);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(5, 103);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(6, 100);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(7, 103);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(8, 108);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(9, 109);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(10, 100);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(11, 100);
INSERT INTO ProductionLine(ContainerId, Purity) VALUES(12, 100);
GO
