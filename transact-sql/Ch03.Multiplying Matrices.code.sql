-- Multiplying Matrices 
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick



SELECT DISTINCT X, Y ,Value*5 Value
FROM Matrices
WHERE Matrix='A'


SELECT m1.X, SUM(m1.Value*v.Value) VALUE
FROM Matrices m1, Matrices v
WHERE m1.Matrix='A' AND v.Matrix='S' AND m1.Y=v.X 
GROUP BY m1.X


SELECT m1.X, m2.Y, SUM(m1.Value*m2.Value) Value
FROM Matrices m1, Matrices m2
WHERE m1.Matrix='A' AND m2.Matrix='B' AND m1.Y=m2.X
GROUP BY m1.X, m2.Y





