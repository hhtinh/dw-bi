-- Aggregating Hierarchies Revised
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code 
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT SUM(cost) Total 
FROM ProjectPaths a JOIN Projects p 
   ON a.VertexId=p.VertexId 
WHERE
   Path LIKE (SELECT Path FROM ProjectPaths WHERE VertexId=1)+'%'


SELECT Space(Depth*2)+Name Project
FROM ProjectPaths a JOIN Projects p 
ON a.VertexId=p.VertexId 
WHERE
   Path LIKE (SELECT Path FROM ProjectPaths WHERE VertexId=1)+'%'
ORDER BY a.Path


SELECT * 
FROM ProjectPaths a JOIN Projects p 
   ON a.VertexId=p.VertexId
WHERE a.Depth=2
