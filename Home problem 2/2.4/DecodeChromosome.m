function registers = DecodeChromosome(chromosome, registers, operatorSet)
    

    cMax = 1e15;
    nGenes = length(chromosome);
    for i = 1:4:nGenes
        
        %Taking out the operator
        operatorIndex = chromosome(i);
            
        operator = operatorSet(operatorIndex);

        %Taking out destination register
        destionationRegisterIndex = chromosome(i+1);
        destionationRegister = registers(destionationRegisterIndex);
       
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
    
end

