-- Deriving the First and Last Dates of the Month
--
-- Chapter 5 - Temporal Data
-- Type of content: code
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

SELECT 
   CONVERT(CHAR(8),CURRENT_TIMESTAMP,120)+'01' First_date,
   CAST(SPACE(
      DATEPART(weekday,
         CONVERT(CHAR(8),CURRENT_TIMESTAMP,120)+'01'
      )-1)+'*' as CHAR(8)) "SMTWTFS",
   CONVERT(CHAR(10),
      DATEADD(day,-1,
         DATEADD(month,1,CONVERT(CHAR(8),CURRENT_TIMESTAMP,120)+'01')
      ),120) Last_date,
   CAST(SPACE(
      DATEPART(weekday,
         DATEADD(day,-1,DATEADD(m,1,
            CONVERT(CHAR(8),CURRENT_TIMESTAMP,120)+'01')
         )
      )-1)+'*' AS CHAR(8)) "SMTWTFS "
