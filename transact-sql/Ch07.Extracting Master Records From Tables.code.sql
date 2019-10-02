-- Extracting Master Records From Tables
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0


INSERT INTO ProfessorMaster(ProfessorName)
SELECT Member1 FROM ThesisOld
UNION
SELECT Member2 FROM ThesisOld
UNION
SELECT Member3 FROM ThesisOld

INSERT INTO ThesisData(StudentId, Member1, Member2, Member3, Grade )
   SELECT StudentId,  
      (SELECT m.ProfessorId
         FROM ProfessorMaster m 
         WHERE t.Member1 = m.ProfessorName),
      (SELECT m.ProfessorId
         FROM ProfessorMaster m 
         WHERE t.Member2 = m.ProfessorName),
      (SELECT m.ProfessorId
         FROM ProfessorMaster m 
         WHERE t.Member3 = m.ProfessorName),
      Grade
   FROM ThesisOld AS t

SELECT DISTINCT StudentId, Member1
FROM ThesisOld AS t
WHERE NOT EXISTS (
   SELECT * FROM ProfessorMaster AS m 
   WHERE m.ProfessorName=t.Member1)
