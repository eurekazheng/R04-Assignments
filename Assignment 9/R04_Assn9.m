% Engineering 12 Assignment #9
% Team R04
% Kevin Pietz, Evan White, Eureka Zheng
% Purpose: Perform functional analysis

clear all;
clc;

% Prompt user for function, store as variable
f=menu('What type of function would you like to use?','File','Anonymous');

switch f
    case 1
        funf=input('Please enter the filename: ','s');
    case 2
        funf=input('Enter the function, no need for the ''@'' symbol: ','s');
        funf=strcat(['@(x)',funf]);
        funf=eval(funf);
end

% Prompt for analysis type, perform request
analysistype=menu('Which type of analysis do you want to perform?','Find roots','Find minima','Find maxima','Find area under the curve');

switch analysistype
    case 1
        disp('roots');
    case 2
        disp('minima');
    case 3
        disp('maxima');
    case 4
        disp('area');
end