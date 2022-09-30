%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change: (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;  	       % Do NOT change

tournamentSize = 2;                % Changes allowed
tournamentProbability = 0.75;      % Changes allowed (= pTour)
crossoverProbability = 0.8;        % Changes allowed (= pCross)
mutationProbability = 0.02;        % Changes allowed. (Note: 0.02 <=> 1/numberOfGenes)
numberOfGenerations = 2000;        % Changes allowed.
nrRuns = 10;                       % The nr of running the RunSingle

% Creating two vectors with ones to be able to append values for every
% run. Vectors for best variables (x1,x2) and also the corresponding function value g(x1,x2) 
bestVariableValuesVector = ones(nrRuns,2);
gFunctionValues = ones(nrRuns,1);

for i = 1:nrRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                           tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    bestVariableValuesVector(i,1) = bestVariableValues(1);
    bestVariableValuesVector(i,2) = bestVariableValues(2);
    gFunctionValue = (1 / maximumFitness) - 1;          % Calculating the function value of g(x1,x2)
    gFunctionValues(i,1) = gFunctionValue;

    sprintf('Fitness: %d, x(1): %0.10f, x(2): %0.10f', maximumFitness, bestVariableValues(1), bestVariableValues(2))
end



