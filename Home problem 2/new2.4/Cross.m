function [newChromosome1,newChromosome2] = Cross(chromosome1,chromosome2)

    nGenes1 = length(chromosome1);
    nGenes2 = length(chromosome2);
    
    % Taking out possible cross over points
    nPossibleCrossoverPoints1 = nGenes1 / 4 - 1;
    nPossibleCrossoverPoints2 = nGenes2 / 4 - 1;
    
    % Appending two cross over points for each chromosome
    crossoverPoints1 =zeros(1,2);
    crossoverPoints2 = zeros(1,2);
    for i = 1:2
        crossoverPoints1(i) = randi(nPossibleCrossoverPoints1) * 4;
        crossoverPoints2(i) = randi(nPossibleCrossoverPoints2) * 4;
    end
    % Sorting so the smallest cross over point comes first
    crossoverPoints1 = sort(crossoverPoints1);
    crossoverPoints2 = sort(crossoverPoints2);

    % Taking out the 2 different pairs of each Chromosome
    part1Chromosome1 = chromosome1(1:crossoverPoints1(1));
    part3Chromosome1 = chromosome1(crossoverPoints1(2) + 1:end);

    part1Chromosome2 = chromosome2(1:crossoverPoints2(1));
    part3Chromosome2 = chromosome2(crossoverPoints2(2) + 1:end);

    % Taking the different parts and create the new chromosomes and append
    % them into a new chromosome pair
    newChromosome1 = [part1Chromosome1, part1Chromosome2, part3Chromosome1];
    newChromosome2 = [part1Chromosome2, part1Chromosome1, part3Chromosome2];

   

end