function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)

    nrOfNodes = length(pathCollection);
    deltaPheromoneLevel = zeros(nrOfNodes,nrOfNodes);
    for k = 1:nrOfNodes
        kDistance = pathLengthCollection(k);
        kPath = pathCollection(k,:);
        fromNode = kPath(end);
        for i = 1:length(kPath)
            nextNode = kPath(i);
            deltaPheromoneLevel(fromNode,nextNode) = deltaPheromoneLevel(fromNode,nextNode)...
                + 1/kDistance;
            fromNode = nextNode;
        end
    end
    
    lowerBoundPheromoneLevel = 10^(-15);
    deltaPheromoneLevel(deltaPheromoneLevel < lowerBoundPheromoneLevel) = lowerBoundPheromoneLevel;

end


            
        




    