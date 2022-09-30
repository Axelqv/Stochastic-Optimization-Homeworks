
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc
numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		   % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutationProbabilities = [0 0.01 0.02 0.05 0.08 0.1 0.3 0.5 0.7 0.9];
nOfmutationProbabilities = length(mutationProbabilities);
medianList = zeros(1,nOfmutationProbabilities);
% Loops through all of the mutation probabilities and storing the median
% into median list define above
for j = 1:nOfmutationProbabilities
    
    mutationProbability = mutationProbabilities(j);
    sprintf('Mutation rate = %0.5f', mutationProbability)
    maximumFitnessList = zeros(numberOfRuns,1);
    for i = 1:numberOfRuns 
     [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                           tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
     sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList(i,1) = maximumFitness;
    end

%% Summary of results
    average = mean(maximumFitnessList);
    medianOfMaxFitness = median(maximumFitnessList);
    std = sqrt(var(maximumFitnessList));
    sprintf('PMut = %0.5f: Median: %0.10f, Average: %0.10f, STD: %0.10f',mutationProbability, medianOfMaxFitness, average, std)
    
    % adding median value to median list
    medianList(1,j) = medianOfMaxFitness;
    
end

% Making the plot
plot(mutationProbabilities, medianList, '-o');
xlabel('Mutation probability')
ylabel('Median of maximum fitness value')
title('Median of maximum fitness value as a function of mutation probability')


    
    

    