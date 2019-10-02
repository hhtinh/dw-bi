-- Manipulating Hierarchies Recursively
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP PROCEDURE RemoveProjectsRecursive
GO
CREATE PROCEDURE RemoveProjectsRecursive
@VertexId INTEGER
AS
   SET NOCOUNT ON
   DECLARE @LocalVertex INTEGER
   SELECT @LocalVertex=@VertexId

   DECLARE subprojects CURSOR LOCAL FOR
      SELECT VertexId FROM Projects WHERE Parent=@VertexId      

   OPEN subprojects
      FETCH NEXT FROM subprojects INTO @LocalVertex
      WHILE @@FETCH_STATUS=0 BEGIN
         EXEC RemoveProjectsRecursive @LocalVertex
         FETCH NEXT FROM subprojects INTO @LocalVertex
      END
    
   CLOSE subprojects
   DEALLOCATE subprojects

   DELETE FROM Projects WHERE VertexId=@VertexId

   PRINT 'Vertex ' +CONVERT(VARCHAR(8),@VertexId) + ' removed!'
GO