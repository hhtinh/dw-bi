-- Generating Master Records Online
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP TRIGGER ThesisOldIns
GO
CREATE TRIGGER ThesisOldIns
ON ThesisOld
FOR INSERT
AS BEGIN
   
   DECLARE @StudentId INTEGER
   DECLARE @Grade CHAR(2)
   DECLARE @Member1 INTEGER
   DECLARE @Member2 INTEGER
   DECLARE @Member3 INTEGER
   DECLARE @Name1 CHAR(255)
   DECLARE @Name2 CHAR(255)
   DECLARE @Name3 CHAR(255)

   DECLARE ThesisOld CURSOR
      FOR SELECT StudentId, Member1, Member2, Member3, Grade 
             FROM inserted
   OPEN ThesisOld
   
   FETCH NEXT FROM ThesisOld
      INTO @StudentId, @Name1, @Name2, @Name3, @Grade 

   WHILE (@@FETCH_STATUS=0) BEGIN
     
      SELECT @Member1=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name1
      IF @@ROWCOUNT=0 BEGIN
         INSERT INTO ProfessorMaster(ProfessorName) VALUES(@Name1)
         SELECT @Member1=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name1
      END
            
      SELECT @Member2=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name2
      IF @@ROWCOUNT=0 BEGIN
         INSERT INTO ProfessorMaster(ProfessorName) VALUES(@Name2)
         SELECT @Member2=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name2
      END

      SELECT @Member3=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name3
      IF @@ROWCOUNT=0 BEGIN
         INSERT INTO ProfessorMaster(ProfessorName) VALUES(@Name3)
         SELECT @Member3=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name3
      END

      INSERT INTO ThesisData(StudentId,Member1,Member2,Member3,Grade) 
         VALUES(@StudentId,@Member1,@Member2,@Member3, @Grade)

      FETCH NEXT FROM ThesisOld
         INTO @StudentId, @Name1, @Name2, @Name3, @Grade 

   END
  
   CLOSE ThesisOld
   DEALLOCATE ThesisOld
END
GO

DROP VIEW ThesisDataView
GO
CREATE VIEW ThesisDataView AS
   SELECT d.StudentId, m1.ProfessorName Member1, 
      m2.ProfessorName Member2, m3.ProfessorName Member3, d.Grade 
   FROM ThesisData d JOIN ProfessorMaster m1 ON d.Member1=m1.ProfessorId
      JOIN ProfessorMaster m2 ON d.Member2=m2.ProfessorId
      JOIN ProfessorMaster m3 ON d.Member3=m3.ProfessorId
GO


DROP TRIGGER ThesisOldUpd
GO
CREATE TRIGGER ThesisOldUpd
ON ThesisOld
FOR Update
AS BEGIN
   
   DECLARE @StudentId integer
   DECLARE @ProfessorIdI integer
   DECLARE @Name1D CHAR(255)
   DECLARE @Name2D CHAR(255)
   DECLARE @Name3D CHAR(255)
   DECLARE @Name1I CHAR(255)
   DECLARE @Name2I CHAR(255)
   DECLARE @Name3I CHAR(255)
 
   DECLARE ThesisOld CURSOR
      FOR SELECT i.StudentId, i.Member1, i.Member2, i.Member3, d.Member1, d.Member2, d.Member3
             FROM inserted i, deleted d
             WHERE i.StudentId=d.StudentId
   OPEN ThesisOld
   
   FETCH NEXT FROM ThesisOld
      INTO @StudentId, @Name1I, @Name2I, @Name3I, @Name1D, @Name2D, @Name3D

   WHILE (@@FETCH_STATUS=0) BEGIN
     
      IF @Name1D<>@Name1I BEGIN
         SELECT @ProfessorIdI=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name1I
         IF @@ROWCOUNT=0 BEGIN
            INSERT INTO ProfessorMaster(ProfessorName) VALUES(@Name1I)
            SELECT @ProfessorIdI=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name1I
         END
         UPDATE ThesisData SET Member1=@ProfessorIdI WHERE StudentId=@StudentId 
      END

      IF @Name2D<>@Name2I BEGIN
         SELECT @ProfessorIdI=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name2I
         IF @@ROWCOUNT=0 BEGIN
            INSERT INTO ProfessorMaster(ProfessorName) VALUES(@Name2I)
            SELECT @ProfessorIdI=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name2I
         END
         UPDATE ThesisData SET Member2=@ProfessorIdI WHERE StudentId=@StudentId 
      END

      IF @Name3D<>@Name3I BEGIN
         SELECT @ProfessorIdI=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name3I
         IF @@ROWCOUNT=0 BEGIN
            INSERT INTO ProfessorMaster(ProfessorName) VALUES(@Name3I)
            SELECT @ProfessorIdI=ProfessorId FROM ProfessorMaster WHERE ProfessorName=@Name3I
         END
         UPDATE ThesisData SET Member3=@ProfessorIdI WHERE StudentId=@StudentId 
      END


      FETCH NEXT FROM ThesisOld
         INTO @StudentId, @Name1I, @Name2I, @Name3I, @Name1D, @Name2D, @Name3D
   END
  
   CLOSE ThesisOld
   DEALLOCATE ThesisOld
END
GO

DROP TRIGGER ThesisOldDel
GO
CREATE TRIGGER ThesisOldDel
ON ThesisOld
FOR Delete
AS BEGIN
   DELETE FROM ThesisData WHERE StudentId IN (SELECT StudentId FROM deleted)
END
