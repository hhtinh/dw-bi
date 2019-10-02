-- Pivoting Tables
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: objects
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE BalanceSheets2
GO
CREATE TABLE BalanceSheets2 (
   CompanyId INTEGER,
   CategoryId CHAR(1),
   Year INTEGER,
   Dollars DECIMAL(12,2)
)
GO
INSERT INTO Balancesheets2 VALUES (12445,'A',2000,36759);
INSERT INTO Balancesheets2 VALUES (12445,'L',2000,22252);
INSERT INTO Balancesheets2 VALUES (12445,'E',2000,14230);
INSERT INTO Balancesheets2 VALUES (12445,'A',2001,37472);
INSERT INTO Balancesheets2 VALUES (12445,'L',2001,22924);
INSERT INTO Balancesheets2 VALUES (12445,'E',2001,14548);
INSERT INTO Balancesheets2 VALUES (12445,'A',2002,38973);
INSERT INTO Balancesheets2 VALUES (12445,'L',2002,24476);
INSERT INTO Balancesheets2 VALUES (12445,'E',2002,14497);
GO

DROP TABLE QuarterlyBalanceSheets
GO
CREATE TABLE QuarterlyBalanceSheets (
   CompanyId INTEGER,
   CategoryId CHAR(1),
   Year INTEGER,
   Quarter INTEGER,
   Dollars DECIMAL(12,2)
)
GO
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'A',2002,1,1579);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'L',2002,1,345);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'E',2002,1,1579);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'A',2002,2,2666);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'L',2002,2,324);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'E',2002,2,2342);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'A',2002,3,1909);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'L',2002,3,453);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'E',2002,3,1456);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'A',2002,4,6245);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'L',2002,4,567);
INSERT INTO QuarterlyBalanceSheets VALUES (12445,'E',2002,4,5678);
GO





