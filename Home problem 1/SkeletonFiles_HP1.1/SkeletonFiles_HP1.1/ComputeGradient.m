% This function should return the gradient of f_p = f + penalty.
% You may hard-code the gradient required for this specific problem.

function gradF = ComputeGradient(x,mu)
    
    % If the constraint is not met the penalty term is also consider in the
    % gradient
    if x(1)^2 + x(2)^2 - 1 >= 0 
        gradFx1 = 2*x(1) - 2 + 4*mu*x(1)*(x(1)^2 + x(2)^2 - 1);
        gradFx2 = 4*x(2) - 8 + 4*mu*x(2)*(x(1)^2 + x(2)^2 - 1);
    else
        gradFx1 = 2*x(1) - 2;
        gradFx2 = 4*x(2) - 8;
    end
         
    gradF = [gradFx1, gradFx2];

end




