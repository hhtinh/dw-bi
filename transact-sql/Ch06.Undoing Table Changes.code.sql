-- Undoing Table Changes
--
-- Chapter 6 - Audit Logging
-- Type of content: code 
-- Date: 2002-1-24
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP PROCEDURE UndoLog
GO
CREATE PROCEDURE UndoLog 
AS
   DECLARE @ProductID CHAR(40)
   DECLARE @Qty INTEGER
   DECLARE @Type CHAR(1)

   SELECT
      @ProductID=ProductID,
      @Qty=Qty,
      @Type=Type 
   FROM StockLog 
   WHERE LogId=(SELECT MAX(LogId) 
      FROM StockLog) AND Type!='N'

   IF @type='D'  
      INSERT INTO Stock(ProductID,Qty) 
         VALUES(@productID,@qty)

   IF @type='I' 
      DELETE FROM Stock WHERE ProductID=@productID

   IF @type='E' 
      UPDATE Stock SET Qty=@qty 
         WHERE ProductID=@productID

GO
