
    % Selects a chromosome from the top 25% of the generation.
    function [Selected] = TruncationSelection(Gen)
        [R, C] = size(Gen);

        % 1: Sort generation by fitness level in descending order.
        Gen = sortrows(Gen, -C); 

        % 2: Get an index value between 1-(Total Population / 4).
        Index = randi(round(R * 0.25));

        % 3: Select and return chromosome using index. 
        Selected = Gen(Index, :);
    end
    
    