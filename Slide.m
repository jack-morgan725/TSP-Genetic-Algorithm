
    % Selects two points within the chromosome and slides the element at the
    % first point to the second point shifting everything between it and the
    % second point. Slide mutation.
    function [Chromosome] = Slide(Chromosome)

        % 1: Remove fitness column from chromosome.
        Chromosome = Chromosome(1, 1:end-1);

        % 2: Generate crossover points.
        CP1 = randi(length(Chromosome)-2);  
        CP2 = randi(length(Chromosome)-2) + 1;

        % 3: Ensure CP2 > CP1.
        while (CP2 >= length(Chromosome) || CP2 <= CP1)
            CP2 = randi(length(Chromosome)) + CP1;
        end

        % 4: Get elements between CP1 and CP2.
        CrossSection = Chromosome(1, CP1:CP2);

        % 5: Get the first element in the crossover section.
        First = CrossSection(1, 1);         

        % 6: Remove the first element from the crossover section.
        CrossSection(:, 1) = [];

        % 7: Add the first element to the end ofthe crossover section.
        CrossSection = [CrossSection, First];

        % 8: Recombine elements to form mutated chromosome.
        Chromosome = [Chromosome(1:CP1-1), CrossSection(1, 1:end), Chromosome(1, CP2+1:end), zeros(1, 1)];
    end

