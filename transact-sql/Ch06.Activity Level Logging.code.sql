-- Activity Level Logging
--
-- Chapter 6 - Audit Logging
-- Type of content: objects 
-- Date: 2002-1-24
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TABLE EventLog
GO
CREATE TABLE EventLog (
   EventId INTEGER IDENTITY,
   CodeId INTEGER NOT NULL,
   IdPointer VARCHAR(40) NULL,
   IdPointerType CHAR(1) NULL,
   EventMessage VARCHAR(255) NULL,
   PRIMARY KEY(EventId)
)
GO

DROP TABLE EventLogMaster
GO
CREATE TABLE EventLogMaster (
   CodeID INTEGER NOT NULL,
   MessageText VARCHAR(255),
   Severity INTEGER,
   LangId CHAR(1),
   PRIMARY KEY(codeID,langID)
)
GO

INSERT INTO EventLogMaster(CodeId,MessageText,Severity,LangId) VALUES(456,'Purchase of product',3,'E')
GO

DROP TABLE GlobalVariables
GO
CREATE TABLE GlobalVariables(
   VarName VARCHAR(10), 
   VarValue INT
)
GO

INSERT INTO GlobalVariables (VarName, VarValue) VALUES ('Severity',3)
GO

DROP PROCEDURE EventMessage
GO
CREATE PROCEDURE EventMessage
   @CodeID INTEGER,
   @IdPointer VARCHAR(40)=null,
   @IdPointerType VARCHAR(1)=null,
   @EventMessage VARCHAR(255) = null
   
AS
   DECLARE @Severity INTEGER
   DECLARE @SevPerm INTEGER

   SELECT 
      @Severity=MAX(Severity) 
   FROM EventLogMaster 
   WHERE CodeID=@CodeID

   SELECT 
      @SevPerm=VarValue 
   FROM GlobalVariables 
   WHERE VarName='Severity'

   IF @Severity>=@SevPerm		
      INSERT INTO EventLog(CodeId, IdPointer,
         IdPointerType, EventMessage) 
      VALUES(@CodeID, @IdPointer, @IdPointerType, 
         @EventMessage)
GO


EventMessage 456,'O','','Bananas 10'
GO

SELECT EventId, MessageText, EventMessage 
FROM EventLog l JOIN EventLogMaster m 
ON l.CodeId=m.CodeID 
WHERE LangId='E'

GO