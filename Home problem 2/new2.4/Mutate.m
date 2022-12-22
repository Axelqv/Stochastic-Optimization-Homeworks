function mutatedIndividual = Mutate(individual,mutationConstant,operatorSet, nVariableRegisters, nConstantRegisters)
    nGenes = length(individual);
    nRegisters = nVariableRegisters+nConstantRegisters;
    mutatedIndividual = individual;
    nOperator = length(operatorSet);
    mutationProbability = mutationConstant;
    
    for i = 1:nGenes/4
        iMutate = 1 + (i-1)*4;

        r = rand;
        if (r < mutationProbability)
            % Mutate operator
            mutatedIndividual(iMutate) = randi(nOperator);
        end

        r = rand;
        if (r < mutationProbability)
            % Mutate destinationRegister
            mutatedIndividual(iMutate+1) = randi(nVariableRegisters);
        end

        r = rand;
        if (r < mutationProbability)
            % Mutate operand 1
            mutatedIndividual(iMutate+2) = randi(nRegisters);
        end
        
        r = rand;
        if (r < mutationProbability)
            % Mutate operand 2
            mutatedIndividual(iMutate+3) = randi(nRegisters);
        end
    end
end

% function mutatedChromosome = Mutate(chromosome, nVariableRegisters, nConstantRegisters)
%     mutatedChromosome = chromosome;
%     nGenes = length(chromosome);
%     pMutVary = (1/nGenes)*3;
%     for i = 1:nGenes
%         p = rand;
%         if p <= pMutVary
%             
%             % mutate
%             switch mod(i, 4)
%                 case 1
%                     % Allowed operand range [1, 4]
%                     newVal = 1 + fix(rand*4); 
%                 case 2
%                     % Allowed destination range [1, nVariableRegisters] 
%                     newVal = 1 + fix(rand*nVariableRegisters); 
%                 case 3
%                     % Allowed range [1, nVariableRegisters + nConstantRegisters]
%                     newVal = 1 + fix(rand*(nVariableRegisters + nConstantRegisters)); 
%                 case 0
%                     % Allowed range [1, nVariableRegisters + nConstantRegisters]
%                     newVal = 1 + fix(rand*(nVariableRegisters + nConstantRegisters)); 
%             end 
%             
%             % Update value
%             mutatedChromosome(i) = newVal;
%         end 
%     end 
% end 