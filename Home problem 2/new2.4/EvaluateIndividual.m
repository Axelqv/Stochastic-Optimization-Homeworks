function fitnessValue = EvaluateIndividual(functionData,chromosome, registers, operatorSet)

    nDataPoints = length(functionData);
    errorSum = 0;
    for k = 1:nDataPoints
        x = functionData(k,1);
        y = functionData(k,2);
        registers(1) = x;
        registers(2:3) = 0;
        
        %Calculating the output y_hatt as the first variabel register r_1
        %Then calculating the summation in the error formula
        output = DecodeChromosome(chromosome, registers, operatorSet);
        yEstimation = output(1);
        errorSum = errorSum + (yEstimation - y)^2;
    end
    
    %Calculating the error and the fitness value
    error = sqrt(1/nDataPoints * errorSum);
    fitnessValue = 1/error;
end