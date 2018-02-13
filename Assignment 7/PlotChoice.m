%function created by Evan White on 2/10/2018 for Assignment 8
%use: get user input for choice of plot point style and color
function [plotchoice,colort]=PlotChoice()

symbol=menu('Choose a symbol: ','point','circle','x-mark','plus','star','square','diamond','triangle (down)','triangle (up)','triangle (left)','triangle (right)','pentragram','hexagram');

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

color=menu('Please choose a color','blue','green','red','cyan','magenta','yellow','black','white');

switch color
    case 1
        color='b';
    case 2
        color='g';
    case 3
        color='r';
    case 4
        color='c';
    case 5
        color='m';
    case 6
        color='y';
    case 7
        color='k';
    case 8
        color='w';
end

plotchoice=strcat(symbol,color);

% color for trendline
colort=menu('Please choose a color for the trendline','blue','green','red','cyan','magenta','yellow','black','white');

switch colort
    case 1
        colort='b';
    case 2
        colort='g';
    case 3
        colort='r';
    case 4
        colort='c';
    case 5
        colort='m';
    case 6
        colort='y';
    case 7
        colort='k';
    case 8
        colort='w';
end

end