function newPopulation = NextGenerationTest(population, fitnessList, tournamentProbability, tournamentSize, nVariableRegisters, nConstantRegisters, ...
    operatorSet,crossoverProbability, mutationConstant, eliteIndividual, mutationProbability)
    populationSize = size(population,2);
    %newPopulation = [];
    temporaryPopulation = population;
    % Select two individual for tournament selection
    for i = 1:2:populationSize
        i1 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        i2 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        r = rand;
        
        % Two-point Crossover
        chromosome1 = population(i1).Chromosome;
        chromosome2 = population(i2).Chromosome;
        if (r < crossoverProbability) 
             [newChromosome1, newChromosome2] = Cross(chromosome1, chromosome2);
             temporaryPopulation(i).Chromosome = newChromosome1;
             temporaryPopulation(i+1).Chromosome = newChromosome2;
        else
             temporaryPopulation(i).Chromosome = chromosome1;
             temporaryPopulation(i+1).Chromosome = chromosome2;
        end
    end 

    temporaryPopulation(1).Chromosome = eliteIndividual;
    for i = 2:populationSize
        tempIndividual = Mutate(temporaryPopulation(i).Chromosome,mutationProbability,operatorSet,nVariableRegisters,nConstantRegisters);
        temporaryPopulation(i).Chromosome = tempIndividual;
    end
        
    % Next generation
    newPopulation = temporaryPopulation;

end

