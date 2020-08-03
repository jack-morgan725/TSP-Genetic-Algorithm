
    % Order-based crossover. Produces two offspring from parent chromosomes.
    function [Offspring1, Offspring2] = Crossover(Parent1, Parent2)

        % 1: Cut fitness column from chromosomes.
        Parent1 = Parent1(1,1:end-1);                      
        Parent2 = Parent2(1,1:end-1);   

        % 2: Generate crossover point after initial city and before last city.
        CP1 = randi(length(Parent1)-2) + 1;  
        CP2 = randi(length(Parent1)-2) + 1;

        % 3: Ensure that CP2 is greater than CP1.
        while (CP2 <= CP1 || CP2 > length(Parent1))
            CP2 = randi(length(Parent1)) + CP1;
        end

        % 4: Create offspring container.
        Offspring1 = zeros(1, length(Parent1));
        Offspring2 = zeros(1, length(Parent2));

        % 5: Put elements between crossover sections in P1 into offspring.
        Offspring1(1, CP1:CP2) = Parent1(1, CP1:CP2);
        Offspring2(1, CP1:CP2) = Parent2(1, CP1:CP2);

        OffspringCounter = CP2+1;
        if OffspringCounter > length(Offspring1)
            OffspringCounter = 1;
        end

        % 6: Put remaining elements from parent two into offspring one.
        for i=1:length(Parent2)
            if ismember(Parent2(1, i), Offspring1)
                continue
            end
            Offspring1(1, OffspringCounter) = Parent2(1, i);
            OffspringCounter = OffspringCounter + 1;
            if OffspringCounter > length(Offspring1)
                OffspringCounter = 1;
            end
        end

        OffspringCounter = CP2+1;
        if OffspringCounter > length(Offspring1)
            OffspringCounter = 1;
        end

        % 7: Put remaining elements from parent one into offspring two.
        for i=1:length(Parent2)
            if ismember(Parent1(1, i), Offspring2)
                continue
            end
            Offspring2(1, OffspringCounter) = Parent1(1, i);
            OffspringCounter = OffspringCounter + 1;
            if OffspringCounter > length(Offspring2)
                OffspringCounter = 1;
            end
        end 

        % Append fitness bar back.
        [R, C] = size(Parent2);
        Offspring1 = [Offspring1, zeros(1, R)];
        Offspring2 = [Offspring2, zeros(1, R)];
    end







