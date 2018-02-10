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


%test stuff
[xnew,ynew,coeffs,graphtitle]=logfit(x,y);
figure
plot(x,y,plotchoice);
hold on;
plot(xnew,ynew,'k-');
title(graphtitle);

