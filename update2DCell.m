function nextState = update2DCell(cell, plane,updateStratagy)
%update2DCell helps a 2D CA determine the next state of an individual cell
%   Determines the next state of a specific cellout 
arguments (Input)
    cell
    plane
    updateStratagy
end

arguments (Output)
    nextState
end
%% Useful Logic and Variables
% the cell self
i = cell(1);
j = cell(2);


% neighbor values, setup to wrap around on out of bound neighbors
Left = i-1;
Right = i+1;
Top = j - 1;
Bottom = j + 1;
squareSize = size(plane,1);

if i == 1 
    Left = squareSize;
end
if i == squareSize
    Right = 1;
end

if j == 1
    Top = squareSize;
end
if j == squareSize
    Bottom = 1;
end


%% Updating

if updateStratagy == 0
    % Conways Game of Life
    numLiveN = 0;

    if plane(Left,Top) ~= 0
        numLiveN = numLiveN + 1;
    end
    if plane(i,Top) ~= 0
        numLiveN = numLiveN + 1;
    end
    if plane(Right,Top) ~= 0
        numLiveN = numLiveN + 1;
    end

    if plane(Left,j) ~= 0
        numLiveN = numLiveN + 1;
    end
    if plane(Right,j) ~= 0
        numLiveN = numLiveN + 1;
    end

    if plane(Left,Bottom) ~= 0
        numLiveN = numLiveN + 1;
    end
    if plane(i,Bottom) ~= 0
        numLiveN = numLiveN + 1;
    end
    if plane(Right,Bottom) ~= 0
        numLiveN = numLiveN + 1;
    end

    if (numLiveN <= 1) || (numLiveN >= 4)
        % Less than 2 neighbors, die of isolation
        % More than 3 neighbors, die of overcrowding
        nextState = 0;
    else
        if (plane(i,j) == 0 && numLiveN == 2)
            % Dead cell with 2 live neighbors remain dead
            nextState = 0;
        else  
            % Live cells with 2 or 3 live neighbors survive
            % Dead cells with 3 live neighbors are born / gifted life
            nextState = 1;
        end
        
    end

else 
    % Default, no specified update strategy provided.
    % Behavoir here is predictable, non-emergent, and not stable.
    % Incrementing is easily noticable to identify when erronous update stratagy
    % codes are used.
    % Each generation, the cell is incremented.
    nextState = plane(cell(1), cell(2)) + 1;
end

end