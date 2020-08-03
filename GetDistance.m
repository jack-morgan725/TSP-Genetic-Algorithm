
    % Calculates the distance value for a single chromosome.
    function [TD] = GetDistance(Chromosome, CityDistanceTable)
        TD = 0;
        [R, C] = size(Chromosome); 

        % 1: Remove fitness column.
        Chromosome = Chromosome(1, 1:end-1); 

        % 2: Calculate total distance for chromosome.
        for (i=1:C-2) 
            TD = TD + CityDistanceTable(Chromosome(1, i), Chromosome(1, i+1));
        end

        % 3: Add distance from end to start city as we need to return.
        TD = TD + CityDistanceTable(Chromosome(1), Chromosome(end));
    end


