
    % Creates a 100 x 100 grid describing the distances from one city to
    % another.
    function CityDistances = CreateDistanceTable(CityCoords)

        % 1: Create a container for the the distances. 
        [R, C] = size(CityCoords); 
        CityDistances = zeros(R, R);

        % 2: Calculate and insert Euclidean distances into container.
        for distX1=1:R                 
            for distY1=1:R            
                CityDistances(distX1, distY1) = pdist2(CityCoords(distX1, :), CityCoords(distY1, :));
            end
        end    
    end

