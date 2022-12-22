function registers = DecodeChromosome(chromosome, registers, operatorSet)
    
    cMax = 1e15;
    nInstructions = length(chromosome)/4;
%     nGenes = length(chromosome);
%     for i = 1:4:nGenes
%         
%         %Taking out the operator
%         operatorIndex = chromosome(i);
%         operator = operatorSet(operatorIndex);
% 
%         %Taking out destination register
%         destinationRegisterIndex = chromosome(i+1);
%         
%         %Taking out operand 1
%         operand1Index = chromosome(i+2);
%         operand1 = registers(operand1Index);
% 
%         %Taking out operand 2
%         operand2Index = chromosome(i+3);
%         operand2 = registers(operand2Index);
    for i = 1:nInstructions
        instructionIndex = 1 + (i-1)*4;
        
        operator = operatorSet(chromosome(instructionIndex));
        destinationRegisterIndex = chromosome(instructionIndex+1);
        operand1 = registers(chromosome(instructionIndex+2));
        operand2 = registers(chromosome(instructionIndex+3));
        destinationRegister = registers(destinationRegisterIndex);
% 
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

        registers(destinationRegisterIndex) = destinationRegister;    % Storing the value of the destionation register variabel
    end
%     
% end


