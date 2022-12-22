function pathLength = GetPathLength(path, cityLocation)
    
   
    nrOfNodes = length(path);
    pathLength = 0;
    for i = 1:nrOfNodes
        % Nodes to compute distance between
        node1 = path(i);
        if i == 50
            node2 = path(1);
        else
            node2 = path(i+1);
        end
        distance = pdist2(cityLocation(node1, :), cityLocation(node2, :));
        pathLength = pathLength + distance; 
    end


