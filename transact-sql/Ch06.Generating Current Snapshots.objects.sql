-- Generating Current Snapshots
--
-- Chapter 6 - Audit Logging
-- Type of content: objects 
-- Date: 2002-1-24
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE Stock
GO
CREATE TABLE Stock(
   ProductId CHAR(40),
   Qty INTEGER
   PRIMARY KEY(ProductId)
)
GO

DROP TABLE StockLog
GO
CREATE TABLE StockLog(
   ProductID CHAR(40),
   Qty INTEGER,
   Type CHAR(1) CHECK (type IN ('D','E','I','N')), 
   UserId VARCHAR(40),
   EventTime DATETIME,
   LogId INTEGER IDENTITY,
   EventId UNIQUEIDENTIFIER
   PRIMARY KEY(LogId)
)
GO


DROP TRIGGER InsertStock
GO
CREATE TRIGGER InsertStock
ON Stock
FOR INSERT
AS
BEGIN
   INSERT INTO StockLog 
      (ProductId, Qty, Type, EventID, UserId, EventTime)
      SELECT i.ProductId, i.Qty, 'I', NEWID(),
         CURRENT_USER, CURRENT_TIMESTAMP 
      FROM inserted I
END
GO

DROP TRIGGER DeleteStock
GO
CREATE TRIGGER DeleteStock
ON Stock
FOR DELETE
AS 
BEGIN
   INSERT INTO StockLog
      (ProductId, Qty, Type, EventID, UserId, EventTime)
      SELECT d.ProductId, d.Qty, 'D',NEWID(), 
         CURRENT_USER, CURRENT_TIMESTAMP 
      FROM deleted d
END
GO

DROP TRIGGER UpdateStock
GO
CREATE TRIGGER UpdateStock
ON Stock
FOR UPDATE
AS 
BEGIN
   
   DECLARE @ProductId CHAR(40)
   DECLARE @dQty INTEGER
   DECLARE @iQty INTEGER
   DECLARE @guid UNIQUEIDENTIFIER

   DECLARE UpdateStockLog CURSOR
      FOR SELECT d.ProductID,d.Qty,i.Qty 
             FROM deleted d, inserted i 
             WHERE d.ProductId=i.ProductId
   OPEN UpdateStockLog
   
   FETCH NEXT FROM UpdateStockLog
   INTO @ProductId, @dQty, @iQty

   WHILE (@@FETCH_STATUS=0) BEGIN
      SELECT @guid=NEWID()
      INSERT INTO StockLog
         (ProductID, Qty, Type, EventID, UserID, EventTime)
         VALUES(@productID,@dQty,'E', @guid,
            CURRENT_USER,CURRENT_TIMESTAMP)
       INSERT INTO StockLog
         (ProductID, Qty, Type, EventID, UserID, EventTime)
         VALUES(@productID,@iQty,'N', @guid,
            CURRENT_USER,CURRENT_TIMESTAMP)

      FETCH NEXT FROM UpdateStockLog
      INTO @ProductId, @dQty, @iQty
   END
  
   CLOSE UpdateStockLog
   DEALLOCATE UpdateStockLog
END
GO

INSERT INTO Stock(ProductID,Qty) VALUES('Banana',10)
INSERT INTO Stock(ProductID,Qty) VALUES('Apple',20)
INSERT INTO Stock(ProductID,Qty) VALUES('Orange',30)
UPDATE STOCK SET Qty=2 WHERE ProductID='Banana'
DELETE FROM Stock WHERE ProductID='Banana'
GO
