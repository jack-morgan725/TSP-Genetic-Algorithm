
    % Gives each element a ranking based on their fitness position in the
    % generation. Roulette Wheel Selection is then ran on the generation using
    % their rank instead of their fitness levels.
    function [Selected] = LinearRankedSelection(Gen)

        % 1: Sort generation by fitness levels.
        [R, C] = size(Gen);
        Gen = sortrows(Gen, C);

        % 2: Remember the fitness values for each chromosome.
        FitnessValues = Gen(:, C);

        % 3: Apply an appropriate fitness rank to each chromosome. Fitness rank
        % replaces fitness level.
        FitnessRank = 1:R;
        for i=1:R
            Gen(i, end) = FitnessRank(i);
        end

        % 4: Select a chromosome using roulette selection based on thier
        % fitness rank instead of fitness levels.
        Selected = RouletteSelection(Gen);

        % 5: Add fitness level back to chromosome.
        Rank = Selected(1, C);
        Selected(1, end) = FitnessValues(Rank, 1);
    end

    