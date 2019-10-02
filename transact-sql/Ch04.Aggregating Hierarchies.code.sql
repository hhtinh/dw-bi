-- Aggregating Hierarchies 
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code 
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP PROCEDURE AggregateProjects
GO
CREATE PROCEDURE AggregateProjects
@VertexId INTEGER
AS
SET NOCOUNT ON
   DECLARE @lvl INTEGER
   DECLARE @Name VARCHAR(20) 
   DECLARE @Cost INTEGER
   DECLARE @Sum INTEGER

   CREATE TABLE #stack (
      VertexId INTEGER, 
      Name VARCHAR(20),
      Cost INTEGER,
      Lvl INTEGER
   )
   
   SELECT @Sum=0
   SELECT @Lvl = 1
   
   INSERT INTO #stack 
      SELECT VertexId, Name, Cost, 1 FROM Projects 
      WHERE VertexID=@VertexId  
   
   WHILE @Lvl > 0 BEGIN
      IF EXISTS (SELECT * FROM #stack WHERE lvl = @lvl) BEGIN

         SELECT TOP 1 @VertexId = VertexId, @Name=Name, @Cost=Cost 
            FROM #stack WHERE lvl = @lvl
            ORDER BY VertexId

         /* to change action each vertex, change this line */
         SELECT @Sum=@Sum+@Cost
         /* ******* */

         DELETE FROM #stack WHERE vertexId = @VertexId

         INSERT #stack
            SELECT VertexId, Name, Cost, @lvl + 1 
            FROM Projects WHERE parent = @VertexId

         IF @@ROWCOUNT > 0
            SELECT @lvl = @lvl + 1
      END ELSE 
         SELECT @lvl = @lvl - 1
      
   END
   PRINT 'Sum of project costs is '+STR(@Sum)+'.'
   DROP TABLE #stack
SET NOCOUNT OFF
GO