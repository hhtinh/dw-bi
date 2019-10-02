-- Comparing Two Matrices for Size
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT m1.Matrix, 'is of equal size as', m2.Matrix
FROM Matrices m1, Matrices m2
WHERE m1.X=m2.X AND m1.Y=m2.Y AND m1.Matrix='A' AND m2.Matrix='B'
GROUP BY m1.Matrix, m2.Matrix 
HAVING 
   COUNT(*)=(SELECT COUNT(*) FROM Matrices WHERE Matrix='A') 
   AND COUNT(*)=(SELECT COUNT(*) FROM Matrices WHERE Matrix='B')
