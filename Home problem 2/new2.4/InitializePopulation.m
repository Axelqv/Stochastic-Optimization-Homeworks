function population = InitializePopulation(populationSize, instructionsBoundary, M, N, nOperators)
    population = [];
    for i = 1:populationSize
        nInstuctionsMax = instructionsBoundary(1);
        nInstuctionsMin = instructionsBoundary(2);
        nInstructions = fix(rand*(nInstuctionsMax - nInstuctionsMin + 1)) + nInstuctionsMin;
    
        chromosomeLength = nInstructions * 4;
        chromosome = zeros(1, chromosomeLength);
    
        for iGene = 1:4:chromosomeLength
             chromosome(iGene) = randi(nOperators);
             chromosome(iGene+1) = randi(M);
             chromosome(iGene+2) = randi(M+N);
             chromosome(iGene+3) = randi(M+N);
         end
        
         individual = struct('Chromosome',chromosome);
         population = [population individual];
    end
end