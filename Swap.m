
    % Selects a two positions in a chromosome and swaps them. Swap mutation.
    function [Vector] = Swap(Vector)
       % 1: Select two random points in the vector.
       Point1 = randi(length(Vector)-2)+1;
       Point2 = randi(length(Vector)-2)+1;

       % 2: Swap the two elements.
       TempElement = Vector(Point2);
       Vector(Point2) = Vector(Point1);
       Vector(Point1) = TempElement; 
    end

