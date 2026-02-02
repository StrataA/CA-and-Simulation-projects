% 1D Cellular Automata
numGenerations = 200;
numCells = 10;
cells = zeros(numCells, 1);
cells = ones(numCells, 1);
cells = linspace(0, 9, numCells);

%in case of manual conditions
cells = [1,0,1,0,1,0,1,0,1,0];

% Printing info
fileID = fopen('ca1d.dat', 'w');

pause('off');

for gen = 0:numGenerations
    disp(['Generation: ', num2str(gen)]);

    fprintf(fileID, 'Gen %01.3d | ', gen);
    fprintf(fileID, '%d ', cells)
    fprintf(fileID, '\n');
    

    cells = update1D(cells);
    pause(1);    
end

fclose("all");