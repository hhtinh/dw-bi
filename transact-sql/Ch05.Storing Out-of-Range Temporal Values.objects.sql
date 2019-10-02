-- Storing Out-of-Range Temporal Values
--
-- Chapter 5 - Temporal Data
-- Type of content: objects 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TABLE Archive
GO
CREATE TABLE Archive(
   EventId CHAR(40),
   EventDate CHAR(8)
)
GO
