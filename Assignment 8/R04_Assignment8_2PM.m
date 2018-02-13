%Evan White, Eureka Zheng, Kevin Pietz
%Engineering 0012 T,Th 2:00-4:00
%Instructor: Mandala
%Created on 2/13/2018
%Assignment 8
%Purpose: This program loads and analyzes data
clear;
clc;
header;
again='y';

while again=='y'
filename=get_name;
userdata=loaddata(filename);
[m,sd,mr,sdr]=analysis(userdata);
printout(m,sd,mr,sdr);
again=CheckAgain;
end