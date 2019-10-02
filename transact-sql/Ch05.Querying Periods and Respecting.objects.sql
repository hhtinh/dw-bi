-- Querying Periods and Respecting Granularity
--
-- Chapter 5 - Temporal Data
-- Type of content: objects 
-- Date: 2002-1-22
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TABLE ContractorsSchedules
GO
CREATE TABLE ContractorsSchedules(
   JobID CHAR(10),
   ContractorID CHAR(10),
   JobStart DATETIME,
   JobEnd DATETIME,
   JobType CHAR(1)  CHECK(JobType in ('B','H')), -- poglej za check condition B-booked,  H - holyday,
   PRIMARY KEY(ContractorId, JobStart)
)
GO

INSERT INTO ContractorsSchedules(JobID, ContractorID, JobStart, JobEnd, JobType) 
VALUES('', 'Alex', '2001-1-1','2001-1-10', 'H'); 
INSERT INTO ContractorsSchedules(JobID, ContractorID, JobStart, JobEnd, JobType) 
VALUES('RF10001', 'Alex', '2001-1-11','2001-1-20', 'B');
INSERT INTO ContractorsSchedules(JobID, ContractorID, JobStart, JobEnd, JobType) 
VALUES('RF10002', 'Alex', '2001-1-21','2001-1-30', 'B');
INSERT INTO ContractorsSchedules(JobID, ContractorID, JobStart, JobEnd, JobType) 
VALUES('RF10020', 'Alex', '2001-2-1','2001-2-5', 'B');
INSERT INTO ContractorsSchedules(JobID, ContractorID, JobStart, JobEnd, JobType) 
VALUES('RF10034', 'Alex', '2001-2-11','2001-2-20', 'B');
INSERT INTO ContractorsSchedules(JobID, ContractorID, JobStart, JobEnd, JobType) 
VALUES('RF10003', 'Bob', '2001-1-5','2001-1-15', 'B');
INSERT INTO ContractorsSchedules(JobID, ContractorID, JobStart, JobEnd, JobType) 
VALUES('RF10022', 'Bob', '2001-2-5','2001-2-15', 'B');
GO
