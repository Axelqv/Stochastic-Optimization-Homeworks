% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.

function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)
    
    xIterate = xStart;
    while true
        gradF = ComputeGradient(xIterate, mu);
        xNew = xIterate - eta.*gradF;
        
        % Computing the L2 norm of gradF
        gradFL2Norm = norm(gradF);
        
        if gradFL2Norm < gradientTolerance
            break      % Stops when the condition/tolerance is met
        end
        xIterate = xNew;
    end
    x = xNew;
end


    
        
        
    

