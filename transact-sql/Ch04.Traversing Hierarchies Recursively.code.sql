-- Traversing Hierarchies Recursively
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP PROCEDURE TraverseProjectsRecursive
GO
CREATE PROCEDURE TraverseProjectsRecursive
@VertexId INTEGER
AS
   /* to change action on each vertex, change these lines */
   DECLARE @Name VARCHAR(20)
   SELECT @Name=(SELECT Name 
                    FROM Projects WHERE VertexId=@VertexId) 
   PRINT SPACE(@@NESTLEVEL*2)+STR(@VertexId)+' '+@Name
   /* ****** */

   DECLARE subprojects CURSOR LOCAL FOR
      SELECT VertexId FROM Projects WHERE Parent=@VertexId      

   OPEN subprojects
      FETCH NEXT FROM subprojects INTO @VertexId
      WHILE @@FETCH_STATUS=0 BEGIN
         EXEC TraverseProjectsRecursive @VertexId
         FETCH NEXT FROM subprojects INTO @VertexId
      END
   CLOSE subprojects
   DEALLOCATE subprojects
GO