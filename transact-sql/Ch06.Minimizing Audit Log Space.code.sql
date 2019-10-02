-- Minimizing Audit Log Space Consumption
--
-- Chapter 6 - Audit Logging
-- Type of content: code 
-- Date: 2002-1-24
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


-- No NULL values
DROP TABLE StockLog
GO
CREATE TABLE StockLog(
   ProductId CHAR(40) NOT NULL,
   Qty INTEGER NULL,
   Price INTEGER NULL,
   EventTime DATETIME NOT NULL,
   DeleteFlag CHAR(1) NULL,
   LogId INTEGER IDENTITY
)
GO


DROP TRIGGER insertStock
GO
CREATE TRIGGER insertStock
ON Stock
FOR INSERT
AS
BEGIN
   INSERT INTO StockLog 
      (ProductId, Qty, Price, DeleteFlag, EventTime)
      SELECT i.ProductId, i.Qty, i.Price, null, CURRENT_TIMESTAMP
      FROM inserted I
END
GO

DROP TRIGGER deleteStock
GO
CREATE TRIGGER deleteStock
ON Stock
FOR DELETE
AS 
BEGIN
   INSERT INTO StockLog
      (ProductId, Qty, Price, DeleteFlag, EventTime)
      SELECT d.ProductId, null, null, 'D', CURRENT_TIMESTAMP 
      FROM deleted d
END
GO

DROP TRIGGER updateStock
GO
CREATE TRIGGER updateStock
ON Stock
FOR UPDATE
AS 
BEGIN
      INSERT INTO stockLog
      (ProductId, Qty, Price, DeleteFlag, EventTime)
      SELECT d.productId, 
		(CASE WHEN d.Qty!=i.Qty THEN i.Qty ELSE NULL END),
		(CASE WHEN d.Price!=i.Price THEN i.Price ELSE NULL END),
		null, CURRENT_TIMESTAMP 
      FROM deleted d,inserted I
      WHERE d.ProductId=i.ProductId
  
END
GO

INSERT INTO Stock(ProductID, Qty, Price)  VALUES ('Bananas', 10, 112)
INSERT INTO Stock(ProductID, Qty, Price)  VALUES ('Apples', 20, 223)
UPDATE Stock SET Qty=25 WHERE ProductID='Apples'
UPDATE Stock SET Qty=30 WHERE ProductId='Apples'
DELETE FROM Stock WHERE ProductId='Bananas'
GO

SELECT t.ProductId,
   Qty=(SELECT TOP 1 tQ.Qty FROM StockLog tQ
      WHERE tQ.Qty IS NOT NULL 
         AND tQ.ProductId=t.ProductId 
         AND tQ.EventTime <= @TIME 
      ORDER BY tQ.LogId DESC),     
   Price=(SELECT TOP 1 tP.Price FROM StockLog tP
      WHERE tP.Price IS NOT NULL 
         AND tP.ProductId=t.ProductId
         AND tP.EventTime <= @TIME 
      ORDER BY tP.LogId DESC)
FROM StockLog t 
WHERE  t.EventTime<=@TIME
GROUP BY t.ProductId
HAVING NOT EXISTS(SELECT * FROM StockLog 
   WHERE productID=t.productID 
   AND logID=MAX(t.logID) AND DeleteFlag='D')


-- NULL values
DROP TABLE StockLog
GO
CREATE TABLE StockLog(
   ProductId char(40) NOT NULL,
   Qty INTEGER NULL,
   Price INTEGER NULL,
   IsEmptyPrice BIT,
   IsEmptyQty BIT,
   EventTime DATETIME NOT NULL,
   DeleteFlag CHAR(1) NULL,
   LogId INTEGER IDENTITY 
)
GO

SELECT t.ProductId,
   Qty=(SELECT TOP 1 tQ.Qty FROM StockLog tQ
      WHERE tQ.IsEmptyQty=0
         AND tQ.ProductId=t.ProductId 
         AND tQ.EventTime <= @TIME
      ORDER BY tQ.LogId DESC ),
   Price=(SELECT TOP 1 tP.Price FROM StockLog tP
      WHERE tP.IsEmptyPrice=0
         AND tP.ProductId=t.ProductId 
         AND tP.EventTime <= @TIME
      ORDER BY tp.LogId DESC)
FROM StockLog t 
WHERE  EventTime<=@TIME
GROUP BY t.ProductId
HAVING NOT EXISTS(SELECT * FROM StockLog 
   WHERE productID=t.productID 
   AND logID=MAX(t.logID) AND DeleteFlag='D')
