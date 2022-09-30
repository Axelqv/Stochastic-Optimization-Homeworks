function functionValue = EvaluateFunction(position) 
x = position(:,1);
y = position(:,2);

functionValue = (x.^2 + y - 11).^2 + (x + y.^2 - 7).^2;

end