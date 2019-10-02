-- Calculating a Matrix Trace
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT SUM(Value) Trace 
FROM Matrices
WHERE Matrix='D' and X=Y
