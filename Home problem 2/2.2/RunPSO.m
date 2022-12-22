% Written by Axel Qvarnström        Civic nr: 980728-5532
% Particle swarm algorithm
clear all
close all
clc

% Parameters
weight = 1.4;
beta = 0.9;              % factor to reduce the weigth for each iterations
minWeight = 0.4;         % lower bound of the weight
nrOfParticles = 40;      % Should be somewhere between 20-40 according to course book
alpha = 1;
deltaT = 1;
vMax = 5;
c1 = 2;
c2 = 2;
xMin = -5;
xMax = 5;

%% Set up x and y values, the function and make a contour plots

x = linspace(xMin,xMax);
y = linspace(xMin,xMax);
[X,Y]  = meshgrid(x,y);

f = (X.^2 + Y - 11).^2 + (X + Y.^2 - 7).^2;

% Make the countour plot for the function log(a + f (x, y)) to easier see the minimas
a = 0.001;
fLog = log(a + f);
contour(X,Y,fLog,'ShowText','on');

% Initialize positions and velocities of particles
randomNumber1 = rand(nrOfParticles,2);
positions = xMin + randomNumber1 .* (xMax - xMin);

randomNumber2 = rand(nrOfParticles,2);
velocities = alpha/deltaT*(xMin + randomNumber2*(xMax - xMin));

% initialize the best position to the position in the start and sBest to
% some of the postions
particlesBest = positions;
sBest = positions(1,:);
sBestFunctionValue = 10;
while sBestFunctionValue > 1e-8
    for j = 1:nrOfParticles
        % Evaluate each paritcle,pbest and sBest
        particleFunctionValue = EvaluateFunction(positions(j,:));
        pBestFunctionValue = EvaluateFunction(particlesBest(j,:));
        sBestFunctionValue = EvaluateFunction(sBest);
    
        % If the particle have a lower function value than it's pBest than pBest is the postion
        if particleFunctionValue < pBestFunctionValue
            particlesBest(j,:) = positions(j,:);
            pBestFunctionValue = particleFunctionValue;
        end
    
        % Updating sBest if particle function value lower than sBest function
        % value
        if particleFunctionValue < sBestFunctionValue
            sBest = positions(j,:)
            sBestFunctionValue = particleFunctionValue
        end
    end
    
    for k = 1:nrOfParticles
        
        randomNumber3 = rand;
        randomNumber4 = rand;

        % Taking out each particle position and velocity and the particle best value
        position = positions(k,:); 
        velocity = velocities(k,:);
        pBest = particlesBest(k,:);
        
        % Updating the velocity
        cognotiveComponent = c1 * randomNumber3 * (pBest - position) / deltaT;
        socialComponent = c2 * randomNumber4 * (sBest - position) / deltaT;
        velocity = weight * velocity + cognotiveComponent + socialComponent;
    
        if velocity > vMax
            velocity = vMax;
        elseif velocity < -vMax
            velocity = -vMax;
        end
    
        % Updating position
        position = position + velocity * deltaT;
        positions(k,:) = position;
    end
    weight = max(weight*beta, minWeight);             % Reducing the weight for each iteration
end
        
   

    














