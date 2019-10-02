-- Querying Periods and Respecting Granularity
--
-- Chapter 5 - Temporal Data
-- Type of content: code 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   JobId, ContractorId, JobStart, JobEnd
FROM ContractorsSchedules
WHERE JobStart < (CAST('2001-1-11' AS DATETIME)+1)
  AND JobEnd >= CAST('2001-1-11' AS DATETIME)


