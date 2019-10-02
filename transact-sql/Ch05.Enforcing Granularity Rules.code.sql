-- Enforcing Granularity Rules
--
-- Chapter 5 - Temporal Data
-- Type of content: code 
-- Date: 2002-1-22
-- Version: 1.0

DROP TRIGGER ContractorSchedulesUpdate
GO
CREATE TRIGGER ContractorSchedulesUpdate
ON ContractorsSchedules
FOR UPDATE, INSERT
AS 
    UPDATE ContractorsSchedules 
    SET JobStart=CONVERT(CHAR(10),i.JobStart,120), 
      JobEnd=CONVERT(CHAR(10),i.JobEnd,120)
    FROM ContractorsSchedules c, inserted i 
    WHERE c.JobId=i.JobId
GO


INSERT INTO ContractorsSchedules(JobID, ContractorID, JobStart, 
JobEnd, JobType) 
VALUES('', 'Cindy', '2001-1-1 05:12','2001-1-10 19:15', 'H')


SELECT ContractorId, JobStart, JobEnd 
FROM ContractorsSchedules WHERE ContractorId='Cindy'


DROP TRIGGER ContractorSchedulesUpdate
GO
CREATE TRIGGER ContractorSchedulesUpdate
ON ContractorsSchedules
FOR UPDATE, INSERT
AS 
    UPDATE ContractorsSchedules 
    SET JobStart=CONVERT(CHAR(13),i.JobStart,121)+':00', 
      JobEnd=CONVERT(CHAR(13),i.JobEnd,121)+':00'
    FROM ContractorsSchedules c, inserted i 
    WHERE c.JobId=i.JobId
GO
