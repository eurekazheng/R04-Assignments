% Engineering 12 Assignment #9
% Team R04
% Kevin Pietz, Evan White, Eureka Zheng
% Purpose: Perform functional analysis

clear;
clc;
close all;

runAgain=1;
typeAgain=1;

while runAgain==1
    % Prompt user for function, store as variable
    f=menu('What type of function would you like to use?','File','Anonymous');

    switch f
        case 1
            funf=str2func(['@',input('Please enter the filename: ','s')]);
            mfileplot(funf);
        case 2
            funf=input('Enter the function, no need for the ''@'' symbol: ','s');
            funf=str2func(strcat(['@(x)',funf]));
            mfileplot(funf);
    end
    
    while typeAgain==1
    
        % Prompt for analysis type, perform request
        analysistype=menu('Which type of analysis do you want to perform?','Find roots','Find minima','Find maxima','Find area under the curve');

        switch analysistype
            case 1
                roots(funf);
            case 2
                minimumoffunf(funf);
            case 3
                maxoffunf(funf);
            case 4
                area(funf);
        end
        
        typeAgain=menu('Would you like to choose another type of funcational analysis ?', ...
            'yes', 'no');
    end
    
    runAgain=menu('Would you like to run again?', 'yes', 'no');
end