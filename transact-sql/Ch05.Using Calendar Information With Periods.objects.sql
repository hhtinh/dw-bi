-- Using Calendar Information With Periods 
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

DROP TABLE Foo
GO
CREATE TABLE Foo(
	i CHAR(1)
)
GO

INSERT INTO Foo VALUES('0')
INSERT INTO Foo VALUES('1')
INSERT INTO Foo VALUES('2')
INSERT INTO Foo VALUES('3')
INSERT INTO Foo VALUES('4')
INSERT INTO Foo VALUES('5')
INSERT INTO Foo VALUES('6')
INSERT INTO Foo VALUES('7')
INSERT INTO Foo VALUES('8')
INSERT INTO Foo VALUES('9')
GO

DROP TABLE Pivot
GO
CREATE TABLE Pivot (
   i INT,
   PRIMARY KEY(i)
)
GO

INSERT INTO Pivot
   SELECT f1.i+f2.i+f3.i
   FROM Foo f1, Foo F2, Foo f3
GO

DROP TABLE Holidays
GO
CREATE TABLE Holidays(
   Holiday DATETIME, 
   HolidayName CHAR(30)  
)
GO

INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-01-01','New Year Holiday')              
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-01-02','New Year Holiday')              
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-02-08','Slovene Culture Holiday')       
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-04-16','Easter Monday')                 
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-04-27','Resistance Day')                
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-05-01','Labour Holiday')                
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-05-02','Labour Holiday')                
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-06-25','Day of the Republic')           
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-08-15','Assumption of Mary')            
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-10-31','Reformation Day')               
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-12-25','Christmas')                     
INSERT INTO Holidays(Holiday, HolidayName) VALUES('2001-12-26','Independance Day')   
GO
