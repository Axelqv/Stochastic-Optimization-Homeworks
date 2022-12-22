function upDatedPopulation = NewGeneration(population, populationSize,fitnessValues,tournamentProbability,tournamentSize,crossoverProbability,mutationProbability,...
    nRegisters,M,nOperators,bestChromosome)

    tempPopulation = population;
    % Tournament selection
    for i = 1:2:populationSize
        i1 = TournamentSelect(fitnessValues,tournamentProbability,tournamentSize);
        i2 = TournamentSelect(fitnessValues,tournamentProbability,tournamentSize);
        chromosome1 = population(i1).Chromosome;
        chromosome2 = population(i2).Chromosome;
        
        r = rand;
        if (r < crossoverProbability)
            [newChromosome1, newChromosome2] = Cross(chromosome1,chromosome2);
            tempPopulation(i).Chromosome = newChromosome1;
            tempPopulation(i+1).Chromosome = newChromosome2;
        else
            tempPopulation(i).Chromosome = chromosome1;
            tempPopulation(i+1).Chromosome = chromosome2;
        end
    end
    
    tempPopulation(1).Chromosome = bestChromosome;
    for i = 2:populationSize
        originalChromosome = tempPopulation(i).Chromosome;
    %     mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        mutatedChromosome = Mutate(originalChromosome, mutationProbability, nRegisters, M, nOperators);
        tempPopulation(i).Chromosome = mutatedChromosome;
    end
    
%     tempPopulation(1).Chromosome = population(bestIndividualIndex).Chromosome;
    upDatedPopulation = tempPopulation;
end

    