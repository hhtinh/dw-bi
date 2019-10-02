-- Comparing Two Rows in an Array 
--
-- Chapter 3 - Data Structures
-- Type of content: objects
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TABLE ProductionFacility
GO
CREATE TABLE ProductionFacility(
   Line INTEGER,
   ContainerId INTEGER,
   Purity INTEGER
)
GO

INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(0, 1, 100);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(0, 2, 100);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(0, 3, 100);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(1, 1, 102);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(1, 2, 103);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(1, 3, 100);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(2, 1, 103);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(2, 2, 108);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(2, 3, 109);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(3, 1, 100);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(3, 2, 100);
INSERT INTO ProductionFacility(Line, ContainerId, Purity) VALUES(3, 3, 100);
GO

