-- Centralizing Authorization Logic
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code 
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


CREATE VIEW orderAuthorization 
AS
SELECT AccountId, ProductType, MIN(Limit) Limit
FROM GroupMembership m JOIN GroupPermissions g
   ON m.groupId=g.groupId 
WHERE Status='V'
GROUP BY AccountId, ProductType


SELECT AccountId, ProductType, Limit
FROM OrderAuthorization
WHERE AccountId = 'Alex0001'


SELECT Limit 
FROM orderAuthorization 
WHERE AccountId='Alex0001' AND productType='Share'
