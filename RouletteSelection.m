
    % Returns a Chromosome selected via Roulette Wheel Selection from the 
    % supplied chromosome matice. 
    function [Selected] = RouletteSelection(Gen)
         [TotalPop, C] = size(Gen);
         SP = zeros(1, TotalPop);

         % 1: Calculate selection probability for each chromosome.
         for i=1:TotalPop
            SP(i) = Gen(i, end) / sum(Gen(:, end));
         end

         % 2: Calculate cumulative probability.
         CF = cumsum(SP);

         % 3: Generate a random pointer value between 0-1.
         WheelPointer = rand();

         % 4: Get the index of the chromosome the pointer points to.
         for i=1:TotalPop
             if (CF(i) > WheelPointer)
                 SelectedChromIndex = i;
                 break;
             end
         end

         % 5: Return the selected chromosome.
         Selected = Gen(SelectedChromIndex, :);
    end

