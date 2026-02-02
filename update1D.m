function nextCells = update1D(cells)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    cells
end

arguments (Output)
    nextCells
end

% Create and return a next generation array
    nextCells = cells;

    for i = 1:length(cells)
        L = i - 1;
        R = i + 1;
        if (i == 1)
            % Special case for first cell
            L = length(cells);
        elseif (i == length(cells))
            % Special case for last cell
            R = 1;
        end

        if ( (cells(L) == 1) && (cells(R) == 1) ) || ( (cells(L) == 1) && (cells(i) == 1) ) || ( (cells(R) == 1) && (cells(i) == 1) )
            nextCells(i) = 1;
        else
            nextCells(i) = 0;
        end
        
    end

end