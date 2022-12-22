% function population = InitializePopulation(populationSize,minChromosomeLength,maxChromosomeLength,nOperators,M,nOperands, instructionLength)
% 
%     population = [];
%     for i = 1:populationSize
%      chromosomeLength = minChromosomeLength + fix(rand*(maxChromosomeLength-minChromosomeLength+1));
%      chromosome = zeros(1,chromosomeLength);
%      for iGene = 1:instructionLength:chromosomeLength
%          chromosome(iGene) = randi(nOperators);
%          chromosome(iGene+1) = randi(M);
%          chromosome(iGene+2) = randi(nOperands);
%          chromosome(iGene+3) = randi(nOperands);
%      end
%     
%      individual = struct('Chromosome',chromosome);
%      population = [population individual];
%     end
% end

% function population = InitializePopulation(populationSize, minNumberOfInstructions, maxNumberOfInstructions, nVariableRegisters, nConstantRegisters)
% 
%     population = [];
%     for i = 1:populationSize
%         
%         nInstructions = minNumberOfInstructions + fix(rand*(maxNumberOfInstructions - minNumberOfInstructions));
%         chromosome = zeros(1, nInstructions*4);
%         
%         for j = 1:nInstructions
%             % Instructions will always have four numbers
%             iGene = 1 + (j-1)*4;
%             
%              % Allowed range for operand [1,4]
%             chromosome(iGene) = 1 + fix(rand*4);
%             
%             % Allowed range for destination register [1,nVariableRegisters]
%             chromosome(iGene+1) = 1 + fix(rand*nVariableRegisters); 
%             
%             % Allowed range for arg1 [1,nVariableRegisters + nConstantRegisters]
%             chromosome(iGene+2) = 1 + fix(rand*(nVariableRegisters + nConstantRegisters)); 
%             
%             % Allowed range for arg2 [1,nVariableRegisters + nConstantRegisters]
%             chromosome(iGene+3) = 1 + fix(rand*(nVariableRegisters + nConstantRegisters)); 
%         end 
%         
%         individual = struct('Chromosome', chromosome);
%         population = [population individual];
%     end 
% end

function population = InitializePopulation(populationSize, instructionsBoundary, M, N, nOperators)
    population = [];
    for i = 1:populationSize
        nInstuctionsMax = instructionsBoundary(1);
        nInstuctionsMin = instructionsBoundary(2);
        nInstructions = fix(rand*(nInstuctionsMax - nInstuctionsMin + 1)) + nInstuctionsMin;
    
        chromosomeLength = nInstructions * 4;
        chromosome = zeros(1, chromosomeLength);
    
        for iGene = 1:4:chromosomeLength
             chromosome(iGene) = randi(nOperators);
             chromosome(iGene+1) = randi(M);
             chromosome(iGene+2) = randi(M+N);
             chromosome(iGene+3) = randi(M+N);
         end
        
         individual = struct('Chromosome',chromosome);
         population = [population individual];
    end
end


