%used for loop instead of sum() because assignment says to use a loop
%test data file because actual data isnt on courseweb yet
%testdata2 has an odd number of data points for median calculation
%made a for loop to find min and max because we cant use min() or max()
%1-4 of the homework are on here now

%Still Need:
%manually find variance using the equation for it
%manually find standard deviation (square root of variance)
%the histogram with both sets of data on it
%Be able to run twice for both sets of data
%show stats for both sets of data

%Evan White, Eureka Zheng, Kevin Pietz
%Created on 1/24/2018
%Last Edited on 1/24/2018
%Assignment 3 of ENGR0012
%Purpose: Statistical Analysis of User inputed data files

%Explanation of Variables:
%userdata: the array of all data points input by user
%numdata: the number of data points
%totalofdata: sum of all data points, acquired using a for loop
%n: an increment variable for the for loops. reset before each
%meanofdata: the average of the data
%minofdata: the min of the data
%maxofdata: the max of the data
%currmin: the current min of the data in a for loop
%currmax: the current max of the data in a for loop
%sorteddata: the sorted data for use in finding the median
%point1: first point for median calculation, data point at 1/2 numvariable
%point2: second point for median calculation, at 1/2 numvariable+1
%point: point for median calculation odd num of variables

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

%finding the number datapoints and putting into "numdata"
numdata=length(userdata);

%for loop to get the total of all the data
totalofdata=0;
for n=1:numdata
    totalofdata=userdata(n)+totalofdata;
end

%getting mean of data using totalofdata divided by numdata
meanofdata=totalofdata/numdata;
disp('The Mean of the Data is: ');
disp(meanofdata);

%min of data is first data point of sorted data
currmin=userdata(1);
%set current min to the first data point to start
n=0;
%set n back to 0 for the for loop
for n=2:numdata
    if userdata(n)<currmin
        currmin=userdata(n);
    end
    %if userdata at index n is less than the current min, set the current
    %min equal to that userdata point
end
minofdata=currmin;
disp('The Min of the Data is: ');
disp(minofdata);

%setting n back to 0 and currmax to the first data point
n=0;
currmax=userdata(1);
for n=2:numdata
    if userdata(n)>currmax
        currmax=userdata(n);
    end
end
%just like with min, every data point is checked, and this time if its
%greater than the last, it is set as the current max
maxofdata=currmax;
disp('The Max of the Data is: ');
disp(maxofdata);

%sorting the data now to find the variance
sorteddata=sort(userdata);
%if there is an even number of data points:
if mod(numdata,2)==0
    point1=numdata/2;
    point2=(numdata/2)+1;
    %median is the average of the halfway point and the 1 after that in an
    %even number of data points
    medofdata=(sorteddata(point1)+sorteddata(point2))/2;
else
    %the point is halfway through the data for odd num of variables
    point=ceil(numdata/2);
    %median is the data point at halfway in the sorted data for odd num of
    %variables
    medofdata=sorteddata(point);
end
disp('The Median of the Data is: ');
disp(medofdata);


