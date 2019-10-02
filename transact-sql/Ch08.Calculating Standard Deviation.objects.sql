-- Calculating Standard Deviation, Variance and Standard Error
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: objects
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE BulbLife
GO
CREATE TABLE BulbLife (
   bulbId INTEGER,
   hours INTEGER,
   testPit INTEGER
)
GO
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(1,1085,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(2,1109,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(3,1093,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(4,1043,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(5,1129,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(6,1099,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(7,1057,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(8,1114,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(9,1077,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(10,1085,1);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(1,1103,2);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(2,1079,2);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(3,1073,2);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(4,1086,2);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(5,1131,2);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(6,1087,2);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(7,1096,2);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(8,1167,2);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(9,1043,2);
INSERT INTO BulbLife(bulbId, hours, testPit) VALUES(10,1074,2);
GO
