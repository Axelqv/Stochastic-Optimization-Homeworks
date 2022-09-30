% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue)
    
    % 
    m = length(chromosome);     % Same as the number of genes of the chromosome
    n = numberOfVariables;
    k = m/n;
    d = maximumVariableValue;
    
    x = zeros(1,n);   % Creating x-vector to fill with x variables
    for i = 1:length(x)
        xTmp = 0;
        for j= 1:k
            xTmp = xTmp + 2^(-j) * chromosome(j + (i-1)*k);
        end
        x(i) = -d + 2*d/(1 - 2^(-k))*xTmp;
    end
    
end

    
    
    
    
 
            
            
        

