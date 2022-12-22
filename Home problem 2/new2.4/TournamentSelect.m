function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
    % Taking out the nr of fitness values
    nFitnessValues = length(fitnessList);
    
    
    tournamentIndividuals = zeros(1,tournamentSize);  % Creating a vector to fill with randomly choosen individuals
    indexList = zeros(1,tournamentSize);  % To keep track of the index of the choosen individuals
    for i= 1:tournamentSize
        randomNumber = randi(nFitnessValues);
        indexList(i) = randomNumber;
        tournamentIndividuals(i) = fitnessList(randomNumber);
    end
   
    for j = 1:tournamentSize
        if j == tournamentSize
            [~,index] = max(tournamentIndividuals);
            selectedIndividualIndex = indexList(index);
        else
            randomNumber = rand;
            if randomNumber < tournamentProbability
                [~,index] = max(tournamentIndividuals);
                selectedIndividualIndex = indexList(index);
                break
            else
                tournamentIndividuals(tournamentIndividuals == max(tournamentIndividuals)) = -1;     % Setting to negative number because all fitness will be positive
            end
        end
    end
    
     
    
           
                
       
    
        
       
        

    
