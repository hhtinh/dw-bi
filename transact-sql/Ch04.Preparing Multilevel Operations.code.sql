-- Preparing Multilevel Operations
--
-- Chapter 4 - Hierarchies in SQL
-- Type of content: code 
-- Date: 2002-1-20
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

DROP PROCEDURE BuildProjectPathsRecursive
GO
CREATE PROCEDURE BuildProjectPathsRecursive
@VertexId INTEGER
AS
SET NOCOUNT ON
   DECLARE @Path VARCHAR(300)
   DECLARE @Depth INTEGER

   SELECT @Depth=a.Depth,@Path=a.Path
   FROM ProjectPaths a JOIN Projects p ON p.parent=a.vertexId
   WHERE @vertexId=p.vertexId  
     
   DELETE FROM ProjectPaths WHERE VertexId=@VertexId
   INSERT INTO ProjectPaths VALUES(
         @VertexId, 
         isnull(@Depth,0)+1, 
         isnull(@Path,'.')+CAST(@VertexId AS VARCHAR(15))+'.')

   DECLARE subprojects CURSOR LOCAL FOR
      SELECT VertexId FROM Projects p WHERE Parent=@VertexId        
   OPEN subprojects

      FETCH NEXT FROM subprojects INTO @VertexId
      WHILE @@FETCH_STATUS=0 BEGIN

         EXEC BuildProjectPathsRecursive @VertexId
         FETCH NEXT FROM subprojects INTO @VertexId
      END
   CLOSE subprojects
   DEALLOCATE subprojects
SET NOCOUNT OFF
GO


DROP PROCEDURE BuildProjectsPaths
GO
CREATE PROCEDURE BuildProjectsPaths 
@VertexId INTEGER
AS
SET NOCOUNT ON

   DECLARE @lvl INTEGER

   CREATE TABLE #stack (
      VertexId INTEGER, 
      Lvl INTEGER
   )

   SELECT @Lvl = 1
 
   INSERT INTO #stack 
      SELECT VertexId,1 FROM Projects WHERE VertexId=@VertexID
   
   WHILE @Lvl > 0 BEGIN
      IF EXISTS (SELECT * FROM #stack WHERE lvl = @lvl) BEGIN

         SELECT TOP 1 @VertexId = VertexId FROM #stack 
            WHERE lvl = @lvl
            ORDER BY VertexId
   
          DELETE FROM ProjectPaths WHERE VertexId=@VertexId
          INSERT INTO ProjectPaths
            SELECT p.vertexId, 
               isnull(a.Depth,0)+1,
               isnull(a.Path,'.')+CAST(p.VertexId AS VARCHAR(15))+'.'
   	        FROM ProjectPaths a,Projects p
   	        WHERE @vertexId=p.vertexId AND p.parent*=a.vertexId

         DELETE FROM #stack WHERE vertexId = @VertexId

         INSERT #stack
            SELECT VertexId, @lvl + 1 FROM Projects 
            WHERE parent = @VertexId

         IF @@ROWCOUNT > 0
            SELECT @lvl = @lvl + 1
      END ELSE 
         SELECT @lvl = @lvl - 1
      
   END
SET NOCOUNT OFF 
GO