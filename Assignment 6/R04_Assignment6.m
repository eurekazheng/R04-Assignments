%Evan White, Eureka Zheng, Kevin Pietz
%Engineering 0012 T,Th 2:00-4:00
%Instructor: Mandala
%Created on 1/31/2018
%Assignment 5
%Purpose: Plotting of xy data and performing analysis of said data
%clearing and setting for the while loop

%to do:
%spline and log-log
%finish semi-log
%maybe clear xhat, yhat, and numdata at the end of each fit, because of
%incorrect array sizes possible

%Explanation of variables:
%userdata: all of the user inputted data
%rows: number of rows in data
%cols: number of cols in data
%x: the x values of the data
%y: the y values of the data
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
%again: variable for running the script again
%SSE: sum of square of error
%SST: sum of the squares of the deviations
%rsquared: the rsquared value of the data
%xest: the user input x value to estimate a y value
%yest: the estimated value based on the inputted x value and the fit line

clear;
clc;
again='y';

while again=='y' %loop for user to try again
    
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
    
    %getting variables for both loops
    numdata=length(x);
    xmax=max(x);
    xmin=min(x);
    
    plottype=menu('Which type of fit do you want to use? ','linear','polynomial','spline','semi-log','log-log');
    
    
    
    
    
    
    
    if plottype==1
        
        
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
        fitchoice=strcat(color2,'-');
        
        
        
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
            %absolute error is the absolute value of the y value minus the fitted y
            %value
            abserror(n)=abs(y(n)-fity(n));
            if y(n)>0
                %if the y value isn't zero, the relerror at n is the abserror
                %divided by y value
                relerror(n)=abserror(n)/y(n);
            end
            if abserror(n)>maxabserror
                %if the abserror this loop is greater than current max, switch
                %current max to abserror
                maxabserror=abserror(n);
                %get the xvalue of this point to say where the maxabserror is
                xval=x(n);
            end
            if relerror(n)>maxrelerror
                %getting max same way as max abserror
                maxrelerror=relerror(n);
                xval2=x(n);
            end
        end
        
        %displaying the max errors
        disp(['The max absolute error is ',num2str(maxabserror),' at x = ',num2str(xval)]);
        disp(['The max relative error is ',num2str(maxrelerror),' at x = ',num2str(xval2)]);
        
        % find the r-squared value
        sse=0;
        sst=0;
        
        for n=1:numdata
            sse=sse+(y(n)-fity(n))^2;
        end
        for n=1:numdata
            sst=sst+(y(n)-meany)^2;
        end
        
        rsquared=1-sse/sst;
        
        %Add equation, r-squared value, and labels to graph
        gtext(['y = ',num2str(fitslope),'x + ',num2str(fityint)]);
        gtext(['The r-squared is: ',num2str(rsquared)]);
        
        graphlab=input('Type your title: ','s');
        title(graphlab);
        xlab=input('Type your x label: ','s');
        xlabel(xlab);
        ylab=input('Type your y label: ','s');
        ylabel(ylab);
        
        xest=input('Please enter an x value to estimate the y value of: ');
        yest=fitslope*xest+fityint;
        disp(['The estimated y value for your x value (',num2str(xest),') is: ',num2str(yest)]);
        %end of linear fit
        %----------------------
        %----------------------
        %----------------------
        %----------------------
        %start of polynomial fit
    elseif plottype==2
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
        fitchoice=strcat(color2,'-');
        
        degree=2;
        again2='y';
        ynew=zeros(1,300);
        hold on;
        
        %while loop for *polynomial* fit
        while again2=='y'
            xnew=linspace(xmin,xmax,300);
            %creates new x values from min and max x values using linspace
            polycoeff=polyfit(x,y,degree);
            %polyfit creates coefficients for x and y using a given degree
            ynew=polyval(polycoeff,xnew);
            %polyval goes through each x value and uses the coefficients to
            %calculate y values
            plot(xnew,ynew,fitchoice);
            
            %Output text monstrosity
            outputtext=' ';
            for n=1:degree
                outputtext=strcat(num2str(polycoeff(degree+1-n)),'x^',num2str(n),' + ',outputtext);
            end
            outputtext=strcat('y = ',outputtext,num2str(polycoeff(degree+1)));
            gtext(outputtext);
            
            
            
            
            
            
            maxdegree=numdata-1;
            
            %seeing if they want to choose another degree of polynomial
            again2=input('Would you like to choose another degree polynomial? (y/n)  ','s');
            
            %error check
            while strcmpi(again2,'y')==0&&strcmpi(again2,'n')==0&&strcmpi(again2,'yes')==0&&strcmpi(again2,'no')==0
                again2=input('Error! Would you like to choose another degree polynomial? (y/n)  ','s');
            end
            
            %checking for degree input errors
            if strcmpi(again2,'y')==1
                degree=input('Choose a new degree for your polynomial fit: ');
                while degree>maxdegree
                    degree=input('Error! Degree too large! Please choose a new degree for your polynomial fit: ');
                end
            elseif strcmpi(again2,'yes')==1
                again2='y';
                degree=input('Choose a new degree for your polynomial fit: ');
                while degree>maxdegree
                    degree=input('Error! Degree too large! Please choose a new degree for your polynomial fit: ');
                end
            end
        end
        
        %add stuff to graph
        graphlab=input('Type your title: ','s');
        title(graphlab);
        xlab=input('Type your x label: ','s');
        xlabel(xlab);
        ylab=input('Type your y label: ','s');
        ylabel(ylab);
        %End of Polynomial Fit
        %----------------------
        %----------------------
        %----------------------
        %Start of Spline Fit
    elseif plottype==3
        hold on;
        
        %End of Spline Fit
        %----------------------
        %----------------------
        %----------------------
        %Start of Semi-log Fit
    elseif plottype==4
        hold on;
        %filtering negative and zero values, then keeping the correct yhat
        %value associated with its x value
        m=1;
        for n=1:numdata
            if y(n)>0
                y2(m)=y(n);
                xhat(m)=x(n);
                m=m+1;
            end
        end
        numdatan=length(xhat);
        yhat=log(y2);
        semilcoeff=polyfit(xhat,yhat,1);
        yslog=polyval(semilcoeff,xhat);
        plot(xhat,yslog);
        
        %End of Semi-log Fit
        %----------------------
        %----------------------
        %----------------------
        %Start of Log-Log Fit
    elseif plottype==5
        hold on;
        
        
        %end of Log-Log Fit
        %----------------------
        %----------------------
        %----------------------
    end
    
    %check to EVERYTHING again (with error check)
    again=input('Would you like to run again? (y/n)  ','s');
    while strcmpi(again,'y')==0&&strcmpi(again,'n')==0&&strcmpi(again,'yes')==0&&strcmpi(again,'no')==0
        again=input('Error! Would you like to run again? (y/n)  ','s');
    end
    if strcmpi(again,'y')==1
    elseif strcmpi(again,'yes')==1
        again='y';
    elseif strcmpi(again,'n')==1
        disp('Goodbye!');
    elseif strcmpi(again,'no')==1
        again='n';
        disp('Goodbye!');
    end
    
end
%YAY we're done!