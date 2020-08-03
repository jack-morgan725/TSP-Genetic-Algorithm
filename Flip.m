
    % Selects a portion of the chromosome and reverses it. Flip mutation.
    function [Chromosome] = Flip(Chromosome)
        % 1: Remove fitness column.
        Chromosome = Chromosome(1, 1:end-1);

        % 2: Generate crossover points.
        CP1 = randi(length(Chromosome)-2) + 1;
        CP2 = randi(length(Chromosome)-2) + 1;

        % 3: Ensure that CP1 is less than total cities.
        while (CP1 >= length(Chromosome)-1)
            CP1 = randi(length(Chromosome)) + 1;
        end

        % 4: Ensure that CP2 is greater than CP1 and less than total cities.
        while (CP2 >= length(Chromosome) | CP2 <= CP1)
            CP2 = randi(length(Chromosome)) + CP1;
        end

        % 5: Flip values between crossover points and add them back.
        Chromosome(1, CP1:CP2) = fliplr(Chromosome(1, CP1:CP2));

        % 6: Append the fitness column back.
        Chromosome = [Chromosome, zeros(1, 1)];
    end

