function fitnessValue = EvaluateIndividual2(functionData,chromosome, registers, operatorSet)
    
    cMax = 1e15;
    nDataPoints = length(functionData);
    errorSum = 0;
    nGenes = length(chromosome);
    for k = 1:nDataPoints
        x = functionData(k,1);
        y = functionData(k,2);
        registers(1) = x;
        registers(2:3) = 0;
        
        for i = 1:4:nGenes
        
            %Taking out the operator
            operatorIndex = chromosome(i);
                
            operator = operatorSet(operatorIndex);
    
            %Taking out destination register
            destionationRegisterIndex = chromosome(i+1);
            destinationRegister = registers(destionationRegisterIndex);
           
            %Taking out operand 1
            operand1Index = chromosome(i+2);
            operand1 = registers(operand1Index);
    
            %Taking out operand 2
            operand2Index = chromosome(i+3);
            operand2 = registers(operand2Index);
    
            if operator == '+'
                destinationRegister = operand1 + operand2;
            elseif operator == '-'
                destinationRegister = operand1 + operand2;
            elseif operator == '*'
                destinationRegister = operand1 * operand2;
            else
                if operand2 == 0
                    destinationRegister = cMax;
                else
                    destinationRegister = operand1 / operand2;
                end
            end
    
            registers(destionationRegisterIndex) = destinationRegister;    % Storing the value of the destionation register variabel
        end
        
        %Calculating the output y_hatt as the first variabel register r_1
        %Then calculating the summation in the error formula
        yEstimation = registers(1);
        errorSum = errorSum + (yEstimation - y)^2;
    end
    
    %Calculating the error and the fitness value
    error = sqrt(1/nDataPoints * errorSum);
    fitnessValue = 1/error;
end