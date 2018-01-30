%Evan White, Eureka Zheng, Kevin Pietz
%Engineering 0012 T,Th 2:00-4:00
%Instructor: Mandala
%Created on 1/29/2018, Edited on 1/29/2018
%Assignment 4
%Purpose: Graphing of user data files with menus and switch case

%clearing and setting for the while loop
clear;
clc;
again='y';

while again=='y'
    
    userdata=input('Please Enter the name of your datafile: ','s');
    
    %making sure it actually exists, if not, they have to reenter the name
    while exist(userdata,'file')==0
        userdata=input('Error! Please reenter the name of your datafile: ','s');
    end
    
    %loading the data file
    userdata=load(userdata);
    
    %getting the size of the data file
    [rows,cols]=size(userdata);
    
    %checking if the data file is 2 by num of data points, so its graphable
    while rows~=2&&cols~=2
        userdata=input('Error! Too many cols/rows. Please Enter the name of your datafile: ','s');
        while exist(userdata,'file')==0
            userdata=input('Error! Please reenter the name of your datafile: ','s');
        end
        userdata=load(userdata);
        [rows,cols]=size(userdata);
    end
    
    %the menu to choose the symbol
    symbol=menu('Choose a symbol: ','point','circle','x-mark','plus','star','square','diamond','triangle (down)','triangle (up)','triangle (left)','triangle (right)','pentragram','hexagram');
    
    %switch case for the symbol, in a format that works for plots
    switch symbol
        case 1
            symbol='.';
        case 2
            symbol='o';
        case 3
            symbol='x';
        case 4
            symbol='+';
        case 5
            symbol='*';
        case 6
            symbol='s';
        case 7
            symbol='d';
        case 8
            symbol='v';
        case 9
            symbol='^';
        case 10
            symbol='<';
        case 11
            symbol='>';
        case 12
            symbol='p';
        case 13
            symbol='h';
    end
    
    %color input and checking if the user input is one of the options
    color=input('Please choose a color (blue, green, red, cyan, magenta, yellow, black, or white): ','s');
    while strcmp(color,'blue')~=1&&strcmp(color,'green')~=1&&strcmp(color,'red')~=1&&strcmp(color,'cyan')~=1&&strcmp(color,'magenta')~=1&&strcmp(color,'yellow')~=1&&strcmp(color,'black')~=1&&strcmp(color,'white')~=1
        color=input('Error! Please choose a color (blue, green, red, cyan, magenta, yellow, black, or white): ','s');
    end
    
    %setting the color to an input that is accepted by the plot command
    if strcmp(color,'blue')==1
        color='b';
    elseif strcmp(color,'green')==1
        color='g';
    elseif strcmp(color,'red')==1
        color='r';
    elseif strcmp(color,'cyan')==1
        color='c';
    elseif strcmp(color,'magenta')==1
        color='m';
    elseif strcmp(color,'yellow')==1
        color='y';
    elseif strcmp(color,'black')==1
        color='k';
    elseif strcmp(color,'white')==1
        color='w';
    end
    
    %the third argument for the plot command, with symbol and color choice
    plotchoice=strcat(symbol,color);
    
    
    %getting the x and y values from the inputted data
    if rows>cols
        x=userdata(:,1);
        y=userdata(:,2);
    elseif cols>rows
        x=userdata(1,:);
        y=userdata(2,:);
    end
    
    %all the figure options and title/label inputs
    figure
    plot(x,y,plotchoice);
    graphlab=input('Type your title: ','s');
    title(graphlab);
    xlab=input('Type your x label: ','s');
    xlabel(xlab);
    ylab=input('Type your y label: ','s');
    ylabel(ylab);
    
    %checking if they want to run again, and checking their input
    again=input('Would you like to run again? (y/n)  ','s');
    if again=='y'
        
    elseif again=='n'
        disp('Goodbye!');
    else
        again=input('Error! Would you like to run again? (y/n)  ','s');
    end
    
end