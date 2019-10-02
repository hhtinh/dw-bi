
-- Dijkstra’s algorithm using R (runs in a few seconds)

declare @SourceIdent nvarchar(255) = 'KSEA'
declare @DestIdent nvarchar(255) = 'KDFW'

declare @sourceId int = (select Id from Node where Name = @SourceIdent)
declare @destId int = (select Id from Node where Name = @DestIdent)

DECLARE @RScript nvarchar(max)
SET @RScript = CONCAT(N'
if (!require(igraph)
	install.packages("igraph")
library(igraph)
if (!require(jsonlite)
	install.packages("jsonlite")
library(jsonlite)

mynodes <- fromJSON(Nodes)
myedges <- fromJSON(Edges)

destNodeId <- ', @destId,'
destNodeName <- subset(mynodes, Id == destNodeId)

g <- graph.data.frame(myedges, vertices=mynodes, dir = FALSE)

(tmp2 = get.shortest.paths(g, from=''', @sourceId, ''', to=''',@destId , ''', output = "both", weights = E(g)$Weight))

TotalDistance <- sum(E(g)$Weight[tmp2$epath[[1]]])

PathIds <- paste(as.character(tmp2$vpath[[1]]$name), sep="''", collapse=",")
PathNames <- paste(as.character(tmp2$vpath[[1]]$Name), sep="''", collapse=",")

OutputDataSet <- data.frame(Id = destNodeId, Name = destNodeName$Name, Distance = TotalDistance, Path = PathIds, NamePath = PathNames)
')

PRINT (@RScript)

DECLARE @NodesInput VARCHAR(MAX) = (SELECT * FROM dbo.Node FOR JSON AUTO);
DECLARE @EdgesInput VARCHAR(MAX) = (SELECT * FROM dbo.Edge FOR JSON AUTO);
declare @distOut float
DECLARE @PathIdsOut VARCHAR(MAX)
DECLARE @PathNamesOut VARCHAR(MAX)

EXECUTE sp_execute_external_script
@language = N'R',
@script = @RScript,
@input_data_1 = N'SELECT 1',
@params = N'@Nodes varchar(max), @Edges varchar(max), @TotalDistance float OUTPUT, @PathIds varchar(max) OUTPUT, @PathNames varchar(max) OUTPUT',
@Nodes = @NodesInput, @Edges = @EdgesInput, @TotalDistance = @distOut OUTPUT, @PathIds = @PathIdsOut OUTPUT, @PathNames = @PathNamesOut OUTPUT
WITH RESULT SETS (( Id int, Name varchar(500), Distance float, [Path] varchar(max) , NamePath varchar(max)))

-- here we format the result in different units of distance - miles and nautical miles
SELECT @distOut * 0.00062137 AS DistanceInMiles, @distOut * 0.00053996 AS DistanceInNauticalMiles
