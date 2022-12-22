function path = GeneratePath(pheromoneLevel, visibilityMatrix, alpha, beta)
    nrOfNodes = length(visibilityMatrix);
    startNode = randi(nrOfNodes);
    tabuList = [startNode];
    path = [startNode];
    for i = 1:(nrOfNodes-1)
        node = GetNode(tabuList, pheromoneLevel, visibilityMatrix, alpha, beta);
        path(end+1) = node;
        tabuList(end+1) = node;
    end
%     path(end+1) = startNode;        % Adding the start node in the end 
                                    % So we can in an easy way
                                    % calculate the pathlength
                                    % between the last new node and it's 
                                    % origin position






    
end

