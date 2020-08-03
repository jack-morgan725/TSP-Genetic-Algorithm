
    % Evaluates the fitless levels for an entire generation. Fitness levels are
    % stored in the last column for each chromosome.
    function [Generation] = EvalFitness(Generation, CityDistanceTable)
        [R, C] = size(Generation);
        for k=1:R                                            
            TD = 0;

            % 1: Get chromosome.
            TempChrom = Generation(k, :);
            TempChrom = TempChrom(1, 1:end-1);   

            % 2: Calculate total distance for chromosome.
            for(j=1:length(TempChrom)-1)
                TD = TD + CityDistanceTable(TempChrom(j), TempChrom(j+1));
            end

            % 3: Add distance from end to start city as we need to return.
            TD = TD + CityDistanceTable(TempChrom(1), TempChrom(end));

            % 4: Convert distance to a fitness level and store with chromosome.
            Generation(k, end) = 1 / TD;
        end
    end

    
    