-- Storing Out-of-Range Temporal Values
--
-- Chapter 5 - Temporal Data
-- Type of content: code 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


INSERT INTO Archive 
  VALUES ('Columbus departs from Palos, Spain', '14920802')
INSERT INTO Archive 
  VALUES ('Columbus arrives at Cuba', '14921029')
INSERT INTO Archive 
  VALUES ('Columbus returns to Spain', '14930315')


SELECT * FROM Archive
