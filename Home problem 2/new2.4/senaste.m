% Run LGP file
close all
clear all
clc

% some other parameters
populationSize = 200;
tournamentProbability = 0.8;
crossoverProbability = 0.2;
mutationProbability = 0.025;
tournamentSize = 4;
numberOfGenerations = 1000;




% Some parameters regarding the chromosome
M = 5;                                   
variabelRegisters = zeros(1,M);

operatorSet = ['+', '-', '*', '/'];
nOperators = length(operatorSet);

constantRegisters = [1, 2, 4 10];
N = length(constantRegisters);          

registers = [variabelRegisters, constantRegisters];
nRegisters = M+N;

instructionLength = 4;
instructionsBoundary = [10 80];
mutationDecayRate = 0.99995;
mutationNumber = 3;

population = InitializePopulation(populationSize, instructionsBoundary, M, N, nOperators);
functionData = LoadFunctionData;
bestOfAllFitness = 0;
nGenerations = 10000;
for iGeneration = 1:nGenerations
    fitnessValues = zeros(1, populationSize);
    maximumFitness = 0;
    
    % Evaluation
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitnessValues(i) = EvaluateIndividual(functionData,chromosome,registers,operatorSet);

        if (maximumFitness < fitnessValues(i))
            bestChromosome = population(i).Chromosome;
            maximumFitness = fitnessValues(i);
            bestOfAllFitness = maximumFitness;
            fprintf('Best fitness so far %.4f Generation %.f\n', bestOfAllFitness, iGeneration)
        end
    end


    % New Generation
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
    
%     mutationNumber = mutationNumber*mutationDecayRate;
    for i = 2:populationSize
        originalChromosome = tempPopulation(i).Chromosome;
    %     mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        mutatedChromosome = Mutate(originalChromosome, mutationProbability, nRegisters, M, nOperators);
%         mutatedChromosome = Mutate(chromosome, M, N);
        tempPopulation(i).Chromosome = mutatedChromosome;
    end
    
    
    tempPopulation(1).Chromosome = bestChromosome;
    population = tempPopulation;
    
end

