-- Creating a Permission Hierarchy
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code 
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT m.AccountId, g.ProductType, MIN(g.Limit) Limit
FROM GroupMembership m Join GroupPermissions g
   ON m.groupId=g.groupId
WHERE  Status='V' AND AccountId='Alex0001'
GROUP BY m.AccountId, g.ProductType
