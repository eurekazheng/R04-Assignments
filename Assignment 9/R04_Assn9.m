% Engineering 12 Assignment #9
% Team R04
% Kevin Pietz, Evan White, Eureka Zheng
% Purpose: Perform functional analysis

clear all;
clc;
f=menu('What type of function would you like to use?','File','Anonymous');

switch f
    case 1
        funf=input('Please enter the filename: ','s');
    case 2
        funf=input('Enter the function, no need for the ''@'' symbol: ','s');
        funf=strcat(['@(x)',funf]);
        funf=eval(funf);
end

