-- Implementing General Hierarchies
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT Name FROM Projects p 
WHERE NOT EXISTS(
   SELECT * FROM Projects 
   WHERE Parent=p.VertexId)


SELECT Name FROM Projects p 
WHERE EXISTS(
   SELECT * FROM Projects 
   WHERE Parent=p.VertexId)


SELECT TOP 5 Name, Cost 
FROM Projects 
ORDER BY cost DESC


SELECT Name FROM Projects 
WHERE Parent=(
   SELECT VertexId FROM Projects 
   WHERE Name='Specifications' )


SELECT Name FROM Projects WHERE Parent=0
