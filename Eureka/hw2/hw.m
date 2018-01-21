% Linear equations system solver
% Shaoming Zheng, Evan White, Kevin Pietz

clear;
disp('This is a linear equations system solver');
reply = 'y';
% Check for user decision
while reply == 'y'
    % Prompt for file name
    datafile = input('Enter the name of the data file: ', 's');
    % Check for file existence
    if exist(datafile, 'file') == 0
        disp('Error: file not exist!');
        continue;
    end
    mat = load(datafile);
    [rows, cols] = size(mat);
    % Convert column format to row format
    if (rows > cols)
        [cols, rows] = deal(rows, cols);
        mat = mat';
    end
    % Extract homogeneous term
    A = mat(:, 1:cols-1);
    % Check for matrix dimensions consistence
    if cols ~= rows + 1
        disp('Error: inconsistent dimensions!');
    % Check for matrix singularity
    elseif det(A) == 0
        disp('Error: unsolvable matrix!');
    else
        % Extract inhomogeneous term
        b = mat(:, cols);
        % Calculate and display answer
        x = A \ b
    end
    % Prompt if the user want to continue
    reply = input('Do you want to continue? (y/N): ', 's');
    % Check for user answer
    while ~strcmp(reply, 'y') && ~strcmp(reply, 'N')
        reply = input('Error: unrecognized answer, please re-enter: ', 's');
    end
end