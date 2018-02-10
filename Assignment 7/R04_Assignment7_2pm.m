%Evan White, Eureka Zheng, Kevin Pietz
%Engineering 0012 T,Th 2:00-4:00
%Instructor: Mandala
%Created on 2/10/2018
%Assignment 7
%Purpose: Plotting of xy data and performing analysis of said data
%clearing and setting for the while loop using functions

%TO-DO:

%absolute and relative errors, and the x value they are located at (make a
%function)

%display equation of polynomial in command window

%function to allow user to put plot title, axis labels

%function for estimating y value at user entered x point. allow for running
%multiple times

%allow user to enter new dataset at end. do not use a menu. check for input
%error

%create datasets on page M-202 of book

%do the procedure parts of the book

clear;
clc;

[x,y]=dataload;
plotchoice=PlotChoice;

again='y';
while again=='y'
    plottype=menu('Which type of fit do you want to use? ','linear','polynomial','spline','semi-log','log-log');
    
    clear r2;
    clear xnew;
    clear ynew;
    
    if plottype==1
        [xnew,ynew,coeffs]=linearfit(x,y);
        r2=GetR2(y,ynew);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
    
    elseif plottype==2
        [xnew,ynew,coeffs]=PolynomialFit(x,y);
        r2=GetR2(y,ynew);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
    
    elseif plottype==3
        [xnew,ynew,coeffs]=splinefit(x,y);
        r2=GetR2(y,ynew);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
    
    elseif plottype==4
        [xnew,ynew,coeffs,y2]=SemilogYFit(x,y);
        r2=GetR2(log(y2),ynew);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
   
    else
        [xnew,ynew,coeffs,y2]=logfit(x,y);
        r2=GetR2(log(y2),ynew);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
    end
    
    addequation(coeffs,plottype);
    
    again=menu('Do you want to choose another fit type?','Yes','No');
    switch again
        case 1
            again='y';
        case 2
            again='n';
    end
end