-- Dynamic Classification System
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT DISTINCT s.StudentName,
   (CASE WHEN c.RuleId=1 THEN 'A' 
      WHEN c.RuleId=2 THEN 'B' 
      WHEN c.RuleId=3 THEN 'C' END) credit
FROM Students s JOIN CreditRules c
   ON s.CourseId=c.CourseId AND s.TermPaper=c.TermPaper
GROUP BY c.RuleId, c.TermId, s.StudentName
HAVING COUNT(*)=(SELECT COUNT(*)
           FROM CreditRules AS c1
           WHERE c.RuleId=c1.RuleId AND c.TermId=c1.TermId)
ORDER BY StudentName
