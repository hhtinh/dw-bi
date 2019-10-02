-- Joining Arrays With Multiple Master Records
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT s.studentName,
   MAX(CASE WHEN t.Member1=p.id 
            THEN p.Name 
            ELSE NULL END) Member1,
   MAX(CASE WHEN t.Member2=p.id 
            THEN p.Name 
            ELSE NULL END) Member2,
   MAX(CASE WHEN t.Member3=p.id 
            THEN p.Name 
            ELSE NULL END) Member3 
FROM Professors p, 
   StudentThesis t JOIN Students s ON t.StudentId=s.StudentID
GROUP BY s.studentName
