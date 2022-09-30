close all
clear all
clc
x1Values = [2/21, 1/8, 0, 3/7, 0, 1, 0];
x2Values = [16/21, 1, 3/4, 3/7, 0, 1, 1];



functionValues = ones(1, length(x1Values));

for i = 1:length(x1Values)
    functionValue = ComputeFun(x1Values(i),x2Values(i));
    functionValues(i) = sym(functionValue);
end


[minFunctionVal, minIndex] = min(functionValues);
    