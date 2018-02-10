%Evan White, Eureka Zheng, Kevin Pietz
%Engineering 0012 T,Th 2:00-4:00
%Instructor: Mandala
%Created on 2/10/2018
%Assignment 7
%Purpose: Plotting of xy data and performing analysis of said data
%clearing and setting for the while loop using functions
clear;
clc;

[x,y]=dataload;
plotchoice=PlotChoice;

again='y';
while again=='y'
    plottype=menu('Which type of fit do you want to use? ','linear','polynomial','spline','semi-log','log-log');
    
    if plottype==1
        [xnew,ynew,coeffs]=linearfit(x,y);
        plottrendline(x,y,xnew,ynew,plotchoice);
    elseif plottype==2
        [xnew,ynew,coeffs]=PolynomialFit(x,y);
        plottrendline(x,y,xnew,ynew,plotchoice);
    elseif plottype==3
        [xnew,ynew,coeffs]=splinefit(x,y);
        plottrendline(x,y,xnew,ynew,plotchoice);
    elseif plottype==4
        [xnew,ynew,coeffs]=SemilogYFit(x,y);
        plottrendline(x,y,xnew,ynew,plotchoice);
    else
        [xnew,ynew,coeffs]=logfit(x,y);
        plottrendline(x,y,xnew,ynew,plotchoice);
    end
    
    again=menu('Do you want to choose another fit type?','Yes','No');
    switch again
        case 1
            again='y';
        case 2
            again='n';
    end
end