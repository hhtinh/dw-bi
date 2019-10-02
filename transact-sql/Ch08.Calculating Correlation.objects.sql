-- Calculating Correlation 
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: objects
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TABLE BulbSales
GO
CREATE TABLE BulbSales(
   id INT IDENTITY,
   year INT,
   month INT,
   sales FLOAT
)
GO

INSERT INTO BulbSales(year,month,sales) VALUES(1995,1,9536);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,2, 9029);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,3, 8883);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,4, 10227);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,5, 9556);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,6, 9324);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,7, 10174);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,8, 9514);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,9, 9102);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,10, 9702);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,11, 8640);
INSERT INTO BulbSales(year,month,sales) VALUES(1995,12, 8372);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,1, 8879);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,2, 8182);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,3, 7884);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,4, 8730);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,5, 8271);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,6, 7749);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,7, 8461);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,8, 7866);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,9, 7487);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,10, 8131);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,11, 7477);
INSERT INTO BulbSales(year,month,sales) VALUES(1996,12, 7157);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,1, 7708);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,2, 7282);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,3, 6957);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,4, 7892);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,5, 7416);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,6, 7071);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,7, 7972);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,8, 7577);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,9, 7334);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,10, 8526);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,11, 8061);
INSERT INTO BulbSales(year,month,sales) VALUES(1997,12, 7830);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,1, 8791);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,2, 8501);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,3, 8110);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,4, 9048);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,5, 8643);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,6, 8139);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,7, 9115);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,8, 8634);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,9, 8199);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,10, 8974);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,11, 8659);
INSERT INTO BulbSales(year,month,sales) VALUES(1998,12, 8408);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,1, 9067);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,2, 8736);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,3, 8236);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,4, 9084);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,5, 8638);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,6, 8335);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,7, 9146);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,8, 8796);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,9, 8455);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,10, 9408);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,11, 8888);
INSERT INTO BulbSales(year,month,sales) VALUES(1999,12, 8506);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,1, 9574);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,2, 9163);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,3, 8636);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,4, 9692);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,5, 9163);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,6, 8889);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,7, 9786);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,8, 9408);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,9, 9073);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,10, 9767);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,11, 9467);
INSERT INTO BulbSales(year,month,sales) VALUES(2000,12, 9190);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,1, 9967);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,2, 9511);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,3, 9223);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,4, 9902);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,5, 9513);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,6, 9311);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,7, 10045);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,8, 9717);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,9, 9704);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,10, 10036);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,11, 9791);
INSERT INTO BulbSales(year,month,sales) VALUES(2001,12, 9440);
INSERT INTO BulbSales(year,month,sales) VALUES(2002,1, 10039);
INSERT INTO BulbSales(year,month,sales) VALUES(2002,2, 9802);
GO