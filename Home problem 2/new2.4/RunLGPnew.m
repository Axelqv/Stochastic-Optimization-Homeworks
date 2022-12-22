% Run LGP file
close all
clear all
clc

% some other parameters
populationSize = 200;
tournamentProbability = 0.8;
crossoverProbability = 0.2;
mutationProbability = 0.025;
tournamentSize = 6;
numberOfGenerations = 1000;




% Some parameters regarding the chromosome
M = 5;                                   
variabelRegisters = zeros(1,M);

operatorSet = ['+', '-', '*', '/'];
nOperators = length(operatorSet);

constantRegisters = [1, 3, -1, -5, 10];
N = length(constantRegisters);          

registers = [variabelRegisters, constantRegisters];
nRegisters = M+N;

instructionLength = 4;
instructionsBoundary = [10 80];


population = InitializePopulation(populationSize, instructionsBoundary, M, N, nOperators);
functionData = LoadFunctionData;
bestOfAllFitness = 0;
nGenerations = 10000;
for iGeneration = 1:nGenerations
    fitnessValuess = zeros(1, populationSize);
    maximumFitness = 0;
    bestChromosome = struct('Chromosome', []);
    
    % Evaluation
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitnessValuess(i) = EvaluateIndividual(functionData,chromosome,registers,operatorSet);

        if (maximumFitness < fitnessValuess(i))
            bestChromosome = population(i).Chromosome;
            maximumFitness = fitnessValuess(i);
            bestOfAllFitness = maximumFitness;
            fprintf('Best fitness so far %.4f Generation %.f\n', bestOfAllFitness, iGeneration)
        end
    end


    % New Generation
    population = NewGeneration(population, populationSize,fitnessValuess,tournamentProbability,tournamentSize,crossoverProbability,mutationProbability,...
    nRegisters,M,nOperators,bestChromosome);
    
end

