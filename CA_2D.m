% 2D CA

%% Setup
pause('on');

numGenerations = 30;
size = 10;
numCells = [size, size]; % note only square matrices allowed

plane = zeros(numCells);


%% Read Setup State
plane = readmatrix("Initial2DState.txt");




%% Display and print to file, the initial state of the plane
dispFileID = fopen("ca2d.dat", "w");
fprintf(dispFileID, '2D CA');
    fprintf(dispFileID, '\n-----\nInitial State\n');
    pause(1)
    disp('Initial State:');
    disp(plane)

    for i = 1:numCells(1)
        fprintf(dispFileID, '%d ', plane(i,:));
        fprintf(dispFileID, '\n');
    end


%% Update and Display Loop    
for gen = 1:numGenerations
   
    plane = updatePlane(plane, 0);

    fprintf(dispFileID, '\n-----\nGeneration %01.3d \n', gen);
    pause(1)
    disp(['Generation: ', num2str(gen)]);
    disp(plane)

    for i = 1:numCells(1)
        fprintf(dispFileID, '%d ', plane(i,:));
        fprintf(dispFileID, '\n');
    end
end

fclose(dispFileID);