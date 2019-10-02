-- Finding Common Available Periods
--
-- Chapter 5 - Temporal Data
-- Type of content: code 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT  
   CAST(DATEADD(day,i,'2001-1-1') AS CHAR(12)) Date
FROM Pivot
WHERE 
   DATEADD(day,i,'2001-1-1') 
      BETWEEN '2001-1-1' AND '2001-2-28' AND
   NOT EXISTS(
      SELECT * FROM ContractorsSchedules 
      WHERE (ContractorId='Alex' OR ContractorId='Bob') AND 
         DATEADD(day,i,'2001-1-1') BETWEEN JobStart AND JobEnd
   )
