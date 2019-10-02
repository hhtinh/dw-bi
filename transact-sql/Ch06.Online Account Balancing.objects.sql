-- Online Account Balancing
--
-- Chapter 6 - Audit Logging
-- Type of content: objects 
-- Date: 2002-2-17
-- Version: 1.1
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TABLE StockRecord
GO
CREATE TABLE StockRecord (
   RecordId INTEGER IDENTITY,
   AccountId INTEGER NOT NULL,
   ProductId VARCHAR(40),
   Qty NUMERIC(20,4) NULL,
   Type CHAR(1) NOT NULL 
      CHECK(Type in ('C','D','O','L','B')),
   ValidDate DATETIME,
   PRIMARY KEY(RecordID)
)
GO


INSERT INTO StockRecord(AccountId, ProductId, Qty, Type,ValidDate) VALUES('3','IBM',20,'O', '2000-07-02 7:30:09')
INSERT INTO StockRecord(AccountId, ProductId, Qty, Type,ValidDate) VALUES('3','CFT',40,'O', '2000-07-03 7:30:21')
INSERT INTO StockRecord(AccountId, ProductId, Qty, Type,ValidDate) VALUES('3','MSFT',10,'C','2000-07-02 10:30:39')
INSERT INTO StockRecord(AccountId, ProductId, Qty, Type,ValidDate) VALUES('3','MSFT',10,'D', '2000-07-02 10:45:54')
INSERT INTO StockRecord(AccountId, ProductId, Qty, Type,ValidDate) VALUES('3','MSFT',25,'C', '2000-07-02 12:11:15')
INSERT INTO StockRecord(AccountId, ProductId, Qty, Type,ValidDate) VALUES('3','MSFT',15,'C', '2000-07-02 12:41:22')
INSERT INTO StockRecord(AccountId, ProductId, Qty, Type,ValidDate) VALUES('3','MSFT',10,'B', '2000-07-03 09:00:00')
INSERT INTO StockRecord(AccountId, ProductId, Qty, Type,ValidDate) VALUES('3','USD',1000,'L', '2000-07-03 09:00:00')
GO
