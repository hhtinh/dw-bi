-- Using Calendar Information With Periods 
--
-- Chapter 5 - Temporal Data
-- Type of content: code 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick



SELECT  
   CAST(DATEADD(day,i,'2001-1-1') AS CHAR(12)) Date
FROM Pivot, ContractorsSchedules c1
WHERE 
   DATEADD(day,i,'2001-1-1') BETWEEN '2001-1-1' AND '2001-2-28' AND
   DATEPART(weekday,DATEADD(day,i,'2001-1-1')) BETWEEN 2 AND 6 AND
   NOT EXISTS(SELECT * FROM Holidays 
      WHERE holiday=DATEADD(day,i,'2001-1-1'))
GROUP BY i  
HAVING (
   SELECT COUNT(DISTINCT c2.ContractorId) 
   FROM ContractorsSchedules c2 
   WHERE DATEADD(day,i,'2001-1-1') BETWEEN c2.JobStart AND c2.JobEnd)
   <
   COUNT(DISTINCT c1.ContractorId)
