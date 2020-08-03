
totalCities = 100;                           
totalGen = 10000;                       
totalPop = 200;                                           
map = CreateDistanceTable(xy);       
currGen = zeros(totalPop, totalCities);

    % 1: Create initial generation.
    for i=1:totalPop
        currGen(i, :) = randperm(totalCities);              
    end
    % 2: Append fitness column to generation.
    currGen = [currGen, zeros(totalPop, 1)];

for i=1:totalGen
    
    % 3: Create a container for the next generation.
    nextGen = zeros(totalPop, totalCities+1);
    
    % 4: Evaluation the fitness of the current generation.
    currGen = EvalFitness(currGen, map);
    
    % 5: Allow the two most elite chromosomes in the current generation to
    % progress to the next generation.
    currGen = sortrows(currGen, -(totalCities+1));
    topChrom1 = currGen(1, 1:end);
    topChrom2 = currGen(2, 1:end);
    nextGen(1, :) = topChrom1;
    nextGen(2, :) = topChrom2;
    totalCreated = 2;

    % 6: Create the next generation.
    while totalCreated < totalPop
        
        % 6.1: Select two chromosomes from the current generation.
        chrom1 = TruncationSelection(currGen);
        chrom2 = TruncationSelection(currGen);

        % 6.2: Chance to crossover the chromosomes to produce two children.
        crossChance = rand();   
        if crossChance < 0.2
           %[chrom1, chrom2] = Crossover(chrom1, chrom2);
        end
        
        % 6.3: Chance to mutate first child.
        mutChance1 = rand();
        if mutChance1 < 0.7
            chrom1 = Flip(chrom1);
        end
        
        %6.4: Chance to mutate second child.
        mutChance2 = rand();
        if mutChance2 < 0.7
            chrom2 = Flip(chrom2);
        end
        
        % 6.5: Add child to the next generation.
        totalCreated = totalCreated + 1;
        nextGen(totalCreated, :) = chrom1;

        % 6.6: If generation capacity reached -> leave.
        if totalCreated >= totalPop  
            break
        end 
        
        % 6.7: Add child to the next generation.
        totalCreated = totalCreated + 1;
        nextGen(totalCreated, :) = chrom1;
    end
    
    % 7: Evaluate the fitness of the next generation.
    nextGen = EvalFitness(nextGen, map);
    
    % 8: The next generation becomes the current generation.
    currGen = nextGen;
end

% 9: Sort final generation by fitness.
currGen = sortrows(currGen, -(totalCities+1));
optRoute = currGen(1, :);

% 10: Display the best chromosome.
figure('Name','TSP_GA | Results','Numbertitle','off');
subplot(2,2,1);
pclr = ~get(0,'DefaultAxesColor');
plot(xy(:,1),xy(:,2),'.','Color',pclr);
title('City Locations');
subplot(2,2,2);
rte = optRoute([1:totalCities 1]);
plot(xy(rte,1),xy(rte,2),'r.-');
title(sprintf('Total Distance = %1.4f',GetDistance(currGen(1, 1:end), map)));    
    