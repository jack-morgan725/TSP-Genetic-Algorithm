
    % Selects two chromosomes from the population to fight. Toughest chromosome
    % gets to return. With implementation.
    % For without implementation simply remove victors from the generation in
    % the TSP script to ensure that they cannot be selected to fight again. 
    function [Victor] = TournamentSelection(Gen, TSize)

        % 1: Create container for competing gladiators.
        [R, C] = size(Gen);
        Gladiators = zeros(TSize, C);

        % 2: Select random members of the population to compete.
        for i=1:TSize
            Gladiators(i, :) = Gen(randi(R-2) + 1, :);
        end

        Victor = Gladiators(1, :);

        % 3: Let gladiators fight. Return the victor.
        for i=1:TSize
            if Gladiators(i, end) > Victor(1, end)
                Victor = Gladiators(i, :);
            end
        end
    end