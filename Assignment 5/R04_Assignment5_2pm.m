%Evan White, Eureka Zheng, Kevin Pietz
%Engineering 0012 T,Th 2:00-4:00
%Instructor: Mandala
%Created on 1/31/2018
%Assignment 5
%Purpose: Plotting of xy data and performing analysis of said data
%clearing and setting for the while loop

%Explanation of variables:
%userdata: all of the user inputted data
%rows: number of rows in data
%cols: number of cols in data
%symbol: symbol at points on the graph
%color: color of points on the graph
%symbol2: symbol of points on the best fit line
%color2: color of points on the best fit line and the line itself
%plotchoice: the user inputs for color and symbol of the plot
%fitchoice: the user inputs for color and symbol of the fit line
%n: used in for loops
%meanx: mean of x values of user data
%meany: mean of y values of user data
%fityint: y intercept of best fit line
%fity: y values of best fit line
%fitslope: slope of best fit line
%abserror: an array of absolute errors for each value
%relerror: an array of relative for each value except when the y is 0
%maxabserror: the max absolute error
%maxrelerror: the max relative error
%xval: the x value where the max absolute error is
%xval2: the x value where the max relative error is
%output: A concatenated string used for displaying the max errors

clear;
clc;


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

%creating a new figure if run again then plotting the x and y data
figure
plot(x,y,plotchoice);


%pausing for viewing of plot before best fit line is created
disp('View your plot, then press any key to continue: ');
pause;
disp('Unpaused');

%the menu to choose the symbol for best fit line
symbol2=menu('Choose a symbol for line of best fit: ','point','circle','x-mark','plus','star','square','diamond','triangle (down)','triangle (up)','triangle (left)','triangle (right)','pentragram','hexagram');

%switch case for the symbol of best fit line, cases align with the menu
switch symbol2
    case 1
        symbol2='.';
    case 2
        symbol2='o';
    case 3
        symbol2='x';
    case 4
        symbol2='+';
    case 5
        symbol2='*';
    case 6
        symbol2='s';
    case 7
        symbol2='d';
    case 8
        symbol2='v';
    case 9
        symbol2='^';
    case 10
        symbol2='<';
    case 11
        symbol2='>';
    case 12
        symbol2='p';
    case 13
        symbol2='h';
end

%getting the color and checking for errors for best fit line
color2=input('Please choose a color for line of best fit (blue, green, red, cyan, magenta, yellow, black, or white): ','s');
while strcmp(color2,'blue')~=1&&strcmp(color2,'green')~=1&&strcmp(color2,'red')~=1&&strcmp(color2,'cyan')~=1&&strcmp(color2,'magenta')~=1&&strcmp(color2,'yellow')~=1&&strcmp(color2,'black')~=1&&strcmp(color2,'white')~=1
    color2=input('Error! Please retype your color (blue, green, red, cyan, magenta, yellow, black, or white): ','s');
end

%converting the color input to one that can be intrepreted by plot command
if strcmp(color2,'blue')==1
    color2='b';
elseif strcmp(color2,'green')==1
    color2='g';
elseif strcmp(color2,'red')==1
    color2='r';
elseif strcmp(color2,'cyan')==1
    color2='c';
elseif strcmp(2,'magenta')==1
    color2='m';
elseif strcmp(color2,'yellow')==1
    color2='y';
elseif strcmp(color2,'black')==1
    color2='k';
elseif strcmp(color2,'white')==1
    color2='w';
end

%concatenating the user choices, and setting it to be a solid line
fitchoice=strcat(symbol2,color2,'-');

%getting the number of data points
numdata=length(x);

%getting mean of x and y, setting deltay and deltax to 0 initially
meanx=mean(x);
meany=mean(y);
deltay=0;
deltax=0;

%2 for loops to get the deltay and deltax for slope of best fit line
for n=1:numdata
    deltay=(x(n)-meanx)*(y(n)-meany)+deltay;
end
for n=1:numdata
    deltax=((x(n)-meanx)^2)+deltax;
end
fitslope=deltay/deltax;

%getting the intercept and the y values of best fit line
fityint=meany-(fitslope*meanx);
fity=fitslope*x+fityint;

%plotting the best fit line after holding old graph on the figure
hold on;
plot(x,fity,fitchoice)

%setting up the error variables beforehand
abserror=zeros(1,numdata);
relerror=zeros(1,numdata);
maxabserror=0;
maxrelerror=0;

%calculating the errors and recording the maxes in 1 for loop
for n=1:numdata
    abserror(n)=abs(y(n)-fity(n));
    if y(n)>0
        relerror(n)=abserror(n)/y(n);
    end
    if abserror(n)>maxabserror
        maxabserror=abserror(n);
        xval=x(n);
    end
    if relerror(n)>maxrelerror
        maxrelerror=relerror(n);
        xval2=x(n);
    end
end

%displaying the max errors
output=['The max absolute error is ',num2str(maxabserror),' at x = ',num2str(xval)];
disp(output);
output=['The max relative error is ',num2str(maxrelerror),' at x = ',num2str(xval2)];
disp(output);
