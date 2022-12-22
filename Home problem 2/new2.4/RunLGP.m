% Run LGP file
close all
clear all
clc

% some other parameters
populationSize = 200;
tournamentProbability = 0.75;
crossoverProbability = 0.9;
mutationProbability = 0.025;
tournamentSize = 2;
numberOfGenerations = 1000;




% Some parameters regarding the chromosome
M = 3;                                   
variabelRegisters = zeros(1,M);

operatorSet = ['+', '-', '*', '/'];
nOperators = length(operatorSet);

constantRegisters = [1, 3, 10];
N = length(constantRegisters);          

registers = [variabelRegisters, constantRegisters];
nRegisters = M+N;

instructionLength = 4;
instructionsBoundary = [10 100];


population = InitializePopulation(populationSize, instructionsBoundary, M, N, nOperators);
functionData = LoadFunctionData;
 
for iGeneration = 1:numberOfGenerations
    
    maximumFitness = 0.0;
    xBest = zeros(1,2);
    bestIndividualIndex = 0;
    
    % Evaluation
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitnessValues(i) = EvaluateIndividual(functionData,chromosome,registers,operatorSet);

        if (fitnessValues(i) > maximumFitness)
            disp(iGeneration)
            maximumFitness = fitnessValues(i);
            bestIndividualIndex = i;
        end

    end
    
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
    
    for i = 1:populationSize
        originalChromosome = tempPopulation(i).Chromosome;
    %     mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        mutatedChromosome = Mutate(originalChromosome, mutationProbability, nRegisters, M, nOperators);
        tempPopulation(i).Chromosome = mutatedChromosome;
    end
    
    tempPopulation(1).Chromosome = population(bestIndividualIndex).Chromosome;
    population = tempPopulation;
end



















