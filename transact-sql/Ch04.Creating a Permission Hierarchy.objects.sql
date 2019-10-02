-- Creating a Permission Hierarchy
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: objects 
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


DROP TABLE GroupPermissions
GO
CREATE TABLE GroupPermissions(
   GroupId VARCHAR(20) NOT NULL,
   ProductType VARCHAR(10) NOT NULL,
   Status CHAR(1) CHECK(status in ('V','S')) DEFAULT('V'),
   Limit NUMERIC(10,2) NULL,
   PRIMARY KEY(GroupId,ProductType)
)
GO

INSERT INTO GroupPermissions VALUES('Derivatives','Future','V',200)
INSERT INTO GroupPermissions VALUES('Derivatives','Option','V',100)
INSERT INTO GroupPermissions VALUES('Equities','Share','V',1000)
INSERT INTO GroupPermissions VALUES('Debt','Bond','V',10000)
INSERT INTO GroupPermissions VALUES('Debt','Bill','V',10000)
GO


DROP TABLE GroupMembership
GO
CREATE TABLE GroupMembership(
   AccountId VARCHAR(20) NOT NULL,
   GroupId VARCHAR(20) NOT NULL
   PRIMARY KEY(AccountId,GroupId)
)
GO

INSERT INTO GroupMembership VALUES('Alex0001','Derivatives')
INSERT INTO GroupMembership VALUES('Alex0001','Equities')
INSERT INTO GroupMembership VALUES('Alex0001','Debt')
INSERT INTO GroupMembership VALUES('Betty0002','Derivatives')
INSERT INTO GroupMembership VALUES('Charles0003','Debt')
GO
