-- Finding Continuous Periods
--
-- Chapter 5 - Temporal Data
-- Type of content: code 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   c1.ContractorId ContractorId, 
   CAST(c1.JobStart AS CHAR(12)) JobStart,
   CAST(c2.JobEnd AS CHAR(12)) JobEnd,
   DATEDIFF(d,c1.JobStart, c2.JobEnd)+1 Length
FROM 
   ContractorsSchedules c1, 
   ContractorsSchedules c2, 
   ContractorsSchedules c3
WHERE 
   c1.ContractorId=c2.ContractorId AND c1.JobStart <= c2.JobStart AND 
   c1.ContractorId=c3.ContractorId AND 
      c3.JobStart BETWEEN c1.JobStart AND c2.JobEnd AND
   NOT EXISTS(
      SELECT * FROM ContractorsSchedules c4 
      WHERE c4.ContractorId=c1.ContractorId AND 
         c2.JobEnd+1 BETWEEN c4.JobStart AND c4.JobEnd) AND
   NOT EXISTS(
      SELECT * FROM ContractorsSchedules c5 
      WHERE c5.ContractorId=c1.ContractorId AND 
         c1.JobStart-1 BETWEEN c5.JobStart AND c5.JobEnd) 
GROUP BY c1.ContractorId, c1.JobStart, c2.JobEnd
HAVING    
   SUM(DATEDIFF(d,c3.JobStart,c3.JobEnd)) + COUNT(*)
   = 
   DATEDIFF(d,c1.JobStart,c2.JobEnd) + 1
ORDER BY ContractorId, c1. JobStart


SELECT 
   c1.ContractorId ContractorId, 
   CAST(c1.JobStart AS CHAR(12)) JobStart1,
   CAST(c2.JobEnd AS CHAR(12)) JobEnd2,
   DATEDIFF(d,c1.JobStart, c2.JobEnd)+1 Length,
   CAST(c3.JobStart as CHAR(12)) JobStart3,
   CAST(c3.JobEnd as CHAR(12)) JobEnd3
FROM 
   ContractorsSchedules c1, 
   ContractorsSchedules c2, 
   ContractorsSchedules c3
WHERE 
   c1.ContractorId=c2.ContractorId AND c1.JobStart <= c2.JobStart AND 
   c1.ContractorId=c3.ContractorId AND 
   c3.JobStart BETWEEN c1.JobStart AND c2.JobEnd



SELECT 
   c1.ContractorId ContractorId, 
   CAST(c1.JobStart AS CHAR(12)) JobStart1,
   CAST(c2.JobEnd AS CHAR(12)) JobEnd2,
   DATEDIFF(d,c1.JobStart, c2.JobEnd)+1 Length,
   CAST(c3.JobStart as CHAR(12)) JobStart3,
   CAST(c3.JobEnd as CHAR(12)) JobEnd3
FROM 
   ContractorsSchedules c1, 
   ContractorsSchedules c2, 
   ContractorsSchedules c3
WHERE 
   c1.ContractorId=c2.ContractorId AND c1.JobStart <= c2.JobStart AND 
   c1.ContractorId=c3.ContractorId AND 
      c3.JobStart BETWEEN c1.JobStart AND c2.JobEnd AND
   NOT EXISTS(
      SELECT * FROM ContractorsSchedules c4 
      WHERE c4.ContractorId=c1.ContractorId AND 
         c2.JobEnd+1 BETWEEN c4.JobStart AND c4.JobEnd) AND
   NOT EXISTS(
      SELECT * FROM ContractorsSchedules c5 
      WHERE c5.ContractorId=c1.ContractorId AND 
         c1.JobStart-1 BETWEEN c5.JobStart AND c5.JobEnd) 



