%used for loop instead of sum() because assignment says to use a loop
%used test data because actual data file isn't on courseweb yet
%put data in column for sorting
%will have to make a way to find min an max without the sort later

%Evan White, Eureka Zheng, Kevin Pietz
%Created on 1/24/2018
%Last Edited on 1/24/2018
%Assignment 3 of ENGR0012
%Purpose: Statistical Analysis of User inputed data files

clear;
clc;

%userdata will be the variable for whatever data is input
userdata=input('Please enter the name of your datafile: ','s');

%making sure it actually exists, if not, they have to reenter the name
while exist(userdata,'file')==0
    userdata=input('Error! Please reenter the name of your datafile: ','s');
end

%loading the data into the variable userdata
userdata=load(userdata);

%cant use the sort it looks like reading the assignment
%sorting the data into ascending order onto the same variable
userdata=sort(userdata);

%finding the number datapoints and putting into "numvariable"
numvariable=length(userdata);

%for loop to get the total of all the data
totalofdata=0;
for n=1:numvariable
    totalofdata=userdata(n)+totalofdata;
end

%getting mean of data using totalofdata divided by numvariable
meanofdata=totalofdata/numvariable;
disp('The Mean of the Data is: ');
disp(meanofdata);

%min of data is first data point of sorted data
minofdata=userdata(1);
disp('The Min of the Data is: ');
disp(minofdata);

%max of data is last in the sorted data
maxofdata=userdata(numvariable);
disp('The Max of the Data is: ');
disp(maxofdata);


