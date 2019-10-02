-- Generating Current Snapshots
--
-- Chapter 6 - Audit Logging
-- Type of content: code 
-- Date: 2002-1-24
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT ProductID, Qty
FROM StockLog
WHERE LogId IN 
   (SELECT 
      (SELECT (CASE WHEN MAX(Type)!='D' 
         THEN MAX(s.LogID) 
         ELSE 0 END) 
      FROM StockLog s1 
      WHERE s.ProductID=s1.ProductID 
         AND s1.LogID=MAX(s.LogID))
   FROM StockLog s
   GROUP BY ProductID)
