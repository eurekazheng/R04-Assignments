%Evan White, Eureka Zheng, Kevin Pietz
%Engineering 0012 T,Th 2:00-4:00
%Instructor: Mandala
%Created on 2/10/2018
%Assignment 7
%Purpose: Plotting of xy data and performing analysis of said data
%clearing and setting for the while loop using functions

clear;
clc;
again='y';
while again=='y'
[x,y]=dataload;
plotchoice=PlotChoice;

again2='y';
while again2=='y'
    plottype=menu('Which type of fit do you want to use? ','linear','polynomial','spline','semi-log','log-log');
    
    clear r2;
    clear xnew;
    clear ynew;
    
    if plottype==1
        [xnew,ynew,coeffs]=linearfit(x,y);
        r2=GetR2(y,ynew);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
        ErrorCalc(x,y,ynew);
    
    elseif plottype==2
        [xnew,ynew,coeffs,yest]=PolynomialFit(x,y);
        r2=GetR2(y,yest);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
        ErrorCalc(x,y,yest);
    
    elseif plottype==3
        [xnew,ynew,coeffs,yest]=splinefit(x,y);
        r2=GetR2(y,yest);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
        disp('The Errors for Spline fit are zero.');
    
    elseif plottype==4
        [xnew,ynew,coeffs,y2]=SemilogYFit(x,y);
        r2=GetR2(log(y2),ynew);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
        hold on;
        plot(xnew,ynew,plotchoice);
        ErrorCalc(xnew,log(y2),ynew);
   
    else
        [xnew,ynew,coeffs,y2]=logfit(x,y);
        r2=GetR2(log(y2),ynew);
        plottrendline(x,y,xnew,ynew,plotchoice,r2);
        hold on;
        plot(xnew,ynew,plotchoice);
        ErrorCalc(xnew,log(y2),ynew);
        
    end
    
    addequation(coeffs,plottype);
    graphattributes;
    if plottype==2
        DispPolyEq(coeffs);
    end
    
    again2=menu('Do you want to choose another fit type?','Yes','No');
    switch again2
        case 1
            again2='y';
        case 2
            again2='n';
    end
end
findy(x,y)
again = CheckAgain('Do you want to use another dataset? (y/n)');
end