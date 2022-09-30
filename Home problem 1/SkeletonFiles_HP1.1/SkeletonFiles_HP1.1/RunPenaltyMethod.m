%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Penalty method for minimizing
%
% (x1-1)^2 + 2(x2-2)^2, s.t.
%
% x1^2 + x2^2 - 1 <= 0.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The values below are suggestions - you may experiment with
% other values of eta and other (increasing) sequences of the
% µ parameter (muValues).
clear all
close all
clc


muValues = [1 10 50 100 500 1000 1200];
eta = 0.0001;
xStart =  [1, 2];
gradientTolerance = 1E-6;

for i = 1:length(muValues)
 mu = muValues(i);
 x = RunGradientDescent(xStart,mu,eta,gradientTolerance);
 sprintf('x(1) = %3f, x(2) = %3f mu = %d',x(1),x(2),mu)
 x1Values(i) = round(x(1),4); % Saving all the x1-values for different my-values, and round to 4 decimal places
 x2Values(i) = round(x(2),4); % Saving all the x1-values for different my-values, and round to 4 decimal places
end
% Creating scatter plot
scatter(muValues,x1Values,'DisplayName','x*1')
hold on
scatter(muValues,x2Values,'DisplayName','x2')
xlabel('mu')
ylabel('x*-values')
xlim([muValues(1) - 100,muValues(end) + 100])
ylim([min(x1Values(1),x2Values(2))- 0.3,max(x1Values(end),x2Values(end)) + 0.3])
legend


