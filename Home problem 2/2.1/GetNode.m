function node = GetNode(tabuList, pheromoneLevel, visibilityMatrix, alpha, beta)
    nrOfNodes = length(visibilityMatrix);
    probabilityList = [];
    startNodeIndex = tabuList(end); % The node it start from for every new edge search
    for i = 1:nrOfNodes
        if ismember(i,tabuList)
            probabilityList(end+1) = 0;
            continue
        end
        probabilityNominator = pheromoneLevel(i,startNodeIndex)^alpha * visibilityMatrix(i,startNodeIndex)^beta;
        
        
        
        probabilityDenominator = 0;
        for k = 1:nrOfNodes
            if ~ismember(k,tabuList)
                probabilityDenominator = probabilityDenominator + pheromoneLevel(k,startNodeIndex)^alpha * visibilityMatrix(k,startNodeIndex)^beta;
            end
        end
        probability = probabilityNominator / probabilityDenominator;
        probabilityList(end+1) = probability;
    end

    summa = sum(probabilityList);
    cumulativeSum = cumsum(probabilityList);
    randomNumber = rand;
    node = find(cumulativeSum > randomNumber, 1);


end
    

    
