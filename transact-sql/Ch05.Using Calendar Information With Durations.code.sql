-- Using Calendar Information With Durations
--
-- Chapter 5 - Temporal Data
-- Type of content: code 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

SELECT CAST(DATEADD(day,p2.i,'2001-1-1') AS CHAR(12)) Date
FROM Pivot p1, Pivot p2
WHERE 
   p1.i<=p2.i AND
   DATEPART(weekday,
      DATEADD(day,p1.i,'2001-1-1')) BETWEEN 2 AND 6 AND
   NOT EXISTS(SELECT * FROM Holidays 
      WHERE holiday=DATEADD(day,p1.i,'2001-1-1')) 
GROUP BY p2.i
HAVING COUNT(*)=15


SELECT CAST(DATEADD(day,p2.i,'2001-1-1') AS CHAR(12)) p2i,
       CAST(DATEADD(day,p1.i,'2001-1-1') AS CHAR(12)) p1i
FROM Pivot p1, Pivot p2
WHERE 
   p1.i<=p2.i AND
   DATEPART(weekday,
      DATEADD(day,p1.i,'2001-1-1')) BETWEEN 2 AND 6 AND
   NOT EXISTS(SELECT * FROM Holidays 
      WHERE holiday=DATEADD(day,p1.i,'2001-1-1'))
ORDER BY DATEADD(day,p2.i,'2001-1-1')


SELECT CAST(DATEADD(day,p2.i,'2001-1-1') AS CHAR(12)) p2i,
       COUNT(*) days_past
FROM Pivot p1, Pivot p2
WHERE 
   p1.i<=p2.i AND
   DATEPART(weekday,
      DATEADD(day,p1.i,'2001-1-1')) BETWEEN 2 AND 6 AND
   NOT EXISTS(SELECT * FROM Holidays 
      WHERE holiday=DATEADD(day,p1.i,'2001-1-1'))
GROUP BY p2.i
ORDER BY p2.i

