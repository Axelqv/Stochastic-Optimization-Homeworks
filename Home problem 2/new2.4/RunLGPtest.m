%Maximilian Salén
%19970105-1576
%Last updated: 2022-10-11
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
populationSize = 200;
M = 5; % number of variable registers
variableRegisters = zeros(1,M);
constantRegisters = [1 3 -1 -5 10];

mMax = 4*120;
N = length(constantRegisters); % number of constant registers
nRegisters = M + N;
operatorSet = ['+','-','*','/'];
nOperators = length(operatorSet);
instructionRange  = [10 80];

mutationConstant = 1;

tournamentSize = 6;
tournamentProbability = 0.8;
crossoverProbability = 0.2;
% mutationNumber = 3;
% mutationDecayRate = 0.99995;
numberOfGenerations = 20000;
mutationProbability = 0.025;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
registers = [variableRegisters constantRegisters];
population = InitializePopulation(populationSize,instructionRange,M,N,nOperators);
goatIndividual = struct('Chromosome', []);
goatFitness = 0; %goat = greatest of all time
fData = LoadFunctionData();
nGenerations = 10000;

for iGeneration = 1:nGenerations
    fitnessList = zeros(1, populationSize);
    eliteFitness  = 0;
    eliteIndividual = struct('Chromosome', []);

    % Evaluate
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
%         fitnessList(i) = EvaluateIndividual(chromosome,fData,operatorSet,registers,M,mMax);
%         fitnessList(i) = EvaluateIndividual2(fData,chromosome, registers, operatorSet);
        fitnessList(i) = EvaluateIndividual(fData,chromosome, registers, operatorSet);
        % Save the elite of this generation
        if eliteFitness < fitnessList(i)
            eliteIndividual = population(i).Chromosome;
            eliteFitness = fitnessList(i);
            goatFitness = eliteFitness;
            fprintf('Best fitness so far %.4f Generation %.f\n', goatFitness, iGeneration)
        end

    end
    
%     %Form the next generation
%     mutationNumber = mutationNumber*mutationDecayRate;
%     population = NextGenerationTest(population, fitnessList, tournamentProbability, tournamentSize, M, N, operatorSet, crossoverProbability, mutationNumber,eliteIndividual, mutationProbability);
      population = NextGenerationTest(population, fitnessList, tournamentProbability, tournamentSize, M, N, ...
    operatorSet,crossoverProbability, mutationConstant, eliteIndividual, mutationProbability);

end





