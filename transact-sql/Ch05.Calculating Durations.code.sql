-- Calculating Durations
--
-- Chapter 5 - Temporal Data
-- Type of content: code 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   DATEDIFF(second, '2001-1-1',CURRENT_TIMESTAMP) seconds,
   DATEDIFF(minute, '2001-1-1',CURRENT_TIMESTAMP) minutes,
   DATEDIFF(hour, '2001-1-1',CURRENT_TIMESTAMP) hours,
   DATEDIFF(day, '2001-1-1',CURRENT_TIMESTAMP) days,
   DATEDIFF(month, '2001-1-1',CURRENT_TIMESTAMP) months


SELECT 
   100*(POWER(1.0500, CONVERT(NUMERIC(10,4),DATEDIFF(d, '2001-1-1', 
      CURRENT_TIMESTAMP)/365.0000)))-100 Interest
