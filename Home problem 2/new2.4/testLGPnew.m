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

N = length(constantRegisters); % number of constant registers
nRegisters = M + N;
operatorSet = ['+','-','*','/'];
nOperators = length(operatorSet);
instructionRange  = [10 80];

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
bestOfAllFitness = 0; %goat = greatest of all time
functionData = LoadFunctionData();
nGenerations = 1000;
%%%%%%

% clear all
% clc
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Parameter specifications
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% populationSize = 200;
% M = 5;
% variableRegisters = zeros(1,M);
% constantRegisters = [1, 3, -1, -5, 10];
% N = length(constantRegisters);
% nRegisters = M+N;
% operatorSet = ["+", "-", "*", "/"];
% nOperators = length(operatorSet);
% instructionRange  = [10 80];
% 
% tournamentSize = 6;
% tournamentProbability = 0.8;
% crossoverProbability = 0.2;
% mutationProbability = 0.025;
% tournamentSize = 6;
% numberOfGenerations = 1000;
% 
% 
% 
% 
% % Some parameters regarding the chromosome
% M = 5;                                   
% variabelRegisters = zeros(1,M);
% 
% operatorSet = ["+", "-", "*", "/"];
% nOperators = length(operatorSet);
% 
% constantRegisters = [1, 3, -1, -5, 10];
% N = length(constantRegisters);          
% 
% registers = [variabelRegisters, constantRegisters];
% nRegisters = M+N;
% 
% instructionLength = 4;
% instructionsBoundary = [10 80];
% 
% 
% population = InitializePopulation(populationSize, instructionsBoundary, M, N, nOperators);
% functionData = LoadFunctionData();
% bestOfAllFitness = 0;
% nGenerations = 1000;

for iGeneration = 1:nGenerations
    fitnessValuess = zeros(1, populationSize);
    maximumFitness  = 0;
    BestChromosome = struct('Chromosome', []);

    % Evaluate
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitnessValuess(i) = EvaluateIndividual(functionData,chromosome, registers, operatorSet);

        % Save the elite of this generation
        if maximumFitness < fitnessValuess(i)
            BestChromosome = population(i).Chromosome;
            maximumFitness = fitnessValuess(i);
            bestOfAllFitness = maximumFitness;
            fprintf('Best fitness so far %.4f Generation %.f\n', bestOfAllFitness, iGeneration)
        end

    end
    
%     %Form the next generation
%     mutationNumber = mutationNumber*mutationDecayRate;
%     population = NextGenerationTest(population, fitnessList, tournamentProbability, tournamentSize, M, N, operatorSet, crossoverProbability, mutationNumber,eliteIndividual, mutationProbability);
      population = NewGeneration(population, populationSize,fitnessValuess,tournamentProbability,tournamentSize,crossoverProbability,mutationProbability,...
    nRegisters,M,nOperators,BestChromosome);

end





