-- Adding and Subtracting Matrices
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT DISTINCT m1.X, m2.Y, m1.Value+m2.Value Value
FROM Matrices m1, Matrices m2
WHERE m1.Matrix='A' AND m2.Matrix='B'
   AND m1.X=m2.X AND m1.Y=m2.Y
