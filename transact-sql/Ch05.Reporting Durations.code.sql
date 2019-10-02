-- Reporting Durations 
--
-- Chapter 5 - Temporal Data
-- Type of content: code
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

SELECT
   12345678/86400/30 months, 
   (12345678/86400)%30 days, 
   (1234567%86400)/3600 hours, 
   (12345678%3600)/60 minutes, 
   12345678%60 seconds



