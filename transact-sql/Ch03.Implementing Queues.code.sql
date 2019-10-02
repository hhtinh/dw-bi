-- Implementing Queues 
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT TOP 1 *  FROM ProductionLine ORDER BY ContainerId ASC

DROP PROCEDURE dequeue
GO
CREATE PROCEDURE dequeue 
AS 
DECLARE @id INTEGER

SELECT TOP 1 @id=ContainerId FROM ProductionLine ORDER BY ContainerId ASC
SELECT * FROM ProductionLine WHERE @id=ContainerId
DELETE FROM ProductionLine WHERE @id=ContainerId
GO

DROP PROCEDURE enqueue
GO
CREATE PROCEDURE enqueue @Purity INTEGER 
AS 
DECLARE @id INTEGER

SELECT TOP 1 @id=ContainerId FROM ProductionLine ORDER BY ContainerId DESC
INSERT INTO ProductionLine(ContainerId,Purity) VALUES(@id+1, @Purity)
SELECT * FROM ProductionLine WHERE ContainerId=@id+1
GO
