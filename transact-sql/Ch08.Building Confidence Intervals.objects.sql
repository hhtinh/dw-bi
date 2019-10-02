-- Building Confidence Intervals
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

DROP TABLE T_distribution
GO
CREATE TABLE T_distribution(
   p DECIMAL(5,3),
   df INTEGER
)
GO

INSERT INTO T_distribution VALUES(12.706,1)
INSERT INTO T_distribution VALUES(4.303,2)
INSERT INTO T_distribution VALUES(3.182,3)
INSERT INTO T_distribution VALUES(2.776,4)
INSERT INTO T_distribution VALUES(2.571,5)
INSERT INTO T_distribution VALUES(2.447,6)
INSERT INTO T_distribution VALUES(2.365,7)
INSERT INTO T_distribution VALUES(2.306,8)
INSERT INTO T_distribution VALUES(2.262,9)
INSERT INTO T_distribution VALUES(2.228,10)
INSERT INTO T_distribution VALUES(2.201,11)
INSERT INTO T_distribution VALUES(2.179,12)
INSERT INTO T_distribution VALUES(2.160,13)
INSERT INTO T_distribution VALUES(2.145,14)
INSERT INTO T_distribution VALUES(2.131,15)
INSERT INTO T_distribution VALUES(2.120,16)
INSERT INTO T_distribution VALUES(2.110,17)
INSERT INTO T_distribution VALUES(2.101,18)
INSERT INTO T_distribution VALUES(2.093,19)
INSERT INTO T_distribution VALUES(2.086,20)
INSERT INTO T_distribution VALUES(2.080,21)
INSERT INTO T_distribution VALUES(2.074,22)
INSERT INTO T_distribution VALUES(2.069,23)
INSERT INTO T_distribution VALUES(2.064,24)
INSERT INTO T_distribution VALUES(2.060,25)
INSERT INTO T_distribution VALUES(2.056,26)
INSERT INTO T_distribution VALUES(2.052,27)
INSERT INTO T_distribution VALUES(2.048,28)
INSERT INTO T_distribution VALUES(2.045,29)
INSERT INTO T_distribution VALUES(2.042,30)
INSERT INTO T_distribution VALUES(1.960,-1)
GO

