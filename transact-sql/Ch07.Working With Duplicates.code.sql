-- Working With Duplicates
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT DISTINCT * FROM Bookstore 


SELECT DISTINCT Name, Type, Price FROM Bookstore


SELECT Name, Type, Price 
FROM Bookstore
GROUP BY Name, Type, Price
HAVING count(*) > 1 


SELECT Name, Type, Price, count(*) Count 
FROM Bookstore
GROUP BY Name, Type, Price 
ORDER BY count(*) DESC


SELECT Name, Type, Price, count(*) Count 
FROM Bookstore
GROUP BY Name, Type, Price 
HAVING count(*) > 1
ORDER BY count(*) DESC


SELECT Name, Type, Price, count(*) Count 
FROM Bookstore
GROUP BY Name, Type, Price
HAVING count(*) >= 3


SELECT Name, Type, Price
FROM Bookstore
GROUP BY Name, Type, Price
HAVING count(*)= 1


SELECT Name, Type, Price, count(*) Count 
FROM Bookstore
GROUP BY Name, Type, Price
HAVING count(*) % 2 = 1 AND count(*)>1


SELECT Name, Type, Price, count(*) Count 
FROM Bookstore
GROUP BY Name, Type, Price
HAVING count(*) % 2 = 0


DELETE
FROM Warehouse
WHERE BookId NOT IN (
   SELECT MAX(BookId)
   FROM Bookstore
   GROUP BY Name, Type
   HAVING COUNT(*) > 1)

DROP INDEX Bookstore.BookstoreInd
CREATE UNIQUE INDEX BookstoreInd on Bookstore
   (Name, Type, Price)

