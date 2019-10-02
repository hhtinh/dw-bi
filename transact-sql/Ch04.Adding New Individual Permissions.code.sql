-- Adding New Individual Permissions
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code 
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT m.AccountId, g.ProductType, MIN(g.Limit) Limit
FROM GroupMembership m JOIN GroupPermissions g
   ON m.groupId=g.groupId 
WHERE Status='V' AND AccountId='Betty0002' 
   AND NOT EXISTS(SELECT * FROM AccountPermissions  a
      WHERE m.AccountId=a.AccountId AND g.ProductType=a.ProductType) 
GROUP BY m.AccountId, g.ProductType
UNION
SELECT a.AccountId, a.ProductType,a.Limit 
FROM AccountPermissions a
WHERE a.AccountId='Betty0002' AND a.Status='V'



CREATE VIEW Permissions 
AS
SELECT m.AccountId, g.ProductType, MIN(g.Limit) Limit
   FROM GroupMembership m JOIN GroupPermissions g
      ON m.groupId=g.groupId 
   WHERE Status='V' 
   GROUP BY m.AccountId, g.ProductType
UNION
   SELECT a.AccountId, a.ProductType,a.Limit 
   FROM AccountPermissions a
   WHERE  a.Status='V'



SELECT ProductType, MIN(Limit) Limit FROM permissions 
WHERE AccountId='Alex0001'
GROUP BY ProductType
