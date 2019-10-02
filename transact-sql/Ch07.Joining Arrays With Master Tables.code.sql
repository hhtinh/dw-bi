-- Joining Arrays With Master Tables
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT t.StudentId,
   MAX(CASE WHEN t.Member1=p.id 
            THEN p.Name 
            ELSE NULL END) Member1,
   MAX(CASE WHEN t.Member2=p.id 
            THEN p.Name 
            ELSE NULL END) Member2,
   MAX(CASE WHEN t.Member3=p.id 
            THEN p.Name 
            ELSE NULL END) Member3 
FROM StudentThesis t, Professors p
GROUP BY t.StudentId


SELECT t.StudentId, p1.Name, p2.Name, P3.Name, t.Grade
FROM 
   StudentThesis t JOIN Professors p1 ON t.Member1 = p1.Id
   JOIN Professors p2 ON t.Member2 = p2.Id
   JOIN Professors p3 ON t.Member3 = p3.Id
