-- Reporting Log Events
--
-- Chapter 6 - Audit Logging
-- Type of content: code
-- Date: 2002-1-24
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   MAX(UserID) AS UserID,
   MAX(
      CASE 
        WHEN Type='D' THEN 'Deleted' 
        WHEN Type='I' THEN 'Inserted'
        ELSE 'Updated'  END) AS Type,
   MAX(ProductID) AS ProductID,
   MAX(CASE 
         WHEN Type!='N' THEN Qty 
         ELSE null END) AS Qty1,
   MAX(CASE 
         WHEN Type='N' THEN Qty 
         ELSE null END) AS Qty2,
   MAX(EventTime) EventTime
FROM StockLog 
GROUP BY EventId
ORDER BY max(LogId)


