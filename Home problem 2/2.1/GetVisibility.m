function visibilityMatrix = GetVisibility(cityLocation)
    numberOfCities = length(cityLocation);
    distanceMatrix = zeros(numberOfCities,numberOfCities);
    for i = 1:numberOfCities
        for j = 1:numberOfCities
            if i~=j

                % The distance between same point is zero 
                distanceMatrix(i,j) = pdist2(cityLocation(i,:),cityLocation(j,:));
            end
            
        end
    end
    visibilityMatrix = 1./distanceMatrix;
end



