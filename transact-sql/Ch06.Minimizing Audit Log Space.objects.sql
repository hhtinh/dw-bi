-- Minimizing Audit Log Space Consumption
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
   Qty INTEGER,
   Price INTEGER,
   PRIMARY KEY(ProductId)
)
GO


