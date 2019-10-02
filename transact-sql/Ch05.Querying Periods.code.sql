-- Querying Periods
--
-- Chapter 5 - Temporal Data
-- Type of content: code 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   JobId, ContractorId, CAST(JobStart AS CHAR(12)) JobStart, 
   CAST(JobEnd AS CHAR(12)) JobEnd, JobType 
FROM ContractorsSchedules
WHERE '2001-2-12' BETWEEN JobStart AND JobEnd 


SELECT 
   JobId, ContractorId, CAST(JobStart AS CHAR(12)) JobStart, 
   CAST(JobEnd AS CHAR(12)) JobEnd, JobType 
FROM ContractorsSchedules
WHERE '2001-1-12' > JobStart 
  AND JobEnd > '2001-1-12'

