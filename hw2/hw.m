% Linear equations system solver
% Shaoming Zheng, Evan White, Kevin Pietz

disp('This is a linear equations system solver');
reply = 'y';
while reply == 'y'
    datafile = input('Enter the name of the data file: ', 's');
    if exist(datafile, 'file') == 0
        disp('Error: file not exist!');
        continue;
    end
    mat = load(datafile);
    [rows, cols] = size(mat);
    if (rows > cols)
        [cols, rows] = deal(rows, cols);
        mat = mat';
    end
    A = mat(:, 1:cols-1);
    if cols ~= rows + 1
        disp('Error: inconsistent dimensions!');
    elseif det(A) == 0
        disp('Error: unsolvable matrix!');
    else
        b = mat(:, cols);
        x = A \ b
    end
    reply = input('Do you want to continue? (y/N): ', 's');
end
        
