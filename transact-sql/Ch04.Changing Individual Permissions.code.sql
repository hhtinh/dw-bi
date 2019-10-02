-- Changing Individual Permissions
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code 
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT m.AccountId, g.ProductType, 
   CASE WHEN isnull(MIN(a.Limit),0) > MIN(g.Limit) 
      THEN MIN(a.Limit) 
      ELSE MIN(g.Limit) 
   END Limit
FROM GroupMembership m JOIN GroupPermissions g 
      ON (m.GroupId=g.GroupId)
   LEFT OUTER JOIN AccountPermissions a 
      ON (m.AccountId=a.AccountId AND g.ProductType=a.ProductType)
WHERE  m.AccountId='Alex0001' 
GROUP BY m.AccountId, g.ProductType
HAVING MIN(g.status)='V' AND isnull(MIN(a.status),MIN(g.status))='V'
