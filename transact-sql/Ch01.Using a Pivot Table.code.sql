-- Using a Pivot Table 
--
-- Chapter 1 - Pivot Tables
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT i Ascii_Code, CHAR(i) Ascii_Char FROM Pivot
WHERE i BETWEEN 32 AND 126

SELECT 
   CONVERT(CHAR(10),DATEADD(d,i,CURRENT_TIMESTAMP), 121) date,
   DATENAME(dw,DATEADD(d,i,CURRENT_TIMESTAMP)) day FROM Pivot
WHERE i BETWEEN 0 AND 6
