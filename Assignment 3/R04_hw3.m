%used for loops for many things because assignment requires manual
%calculation of most data outputs

%Still Need:
%the histogram with both sets of data on it
%might not need to display min and max, just calculate them

%Evan White, Eureka Zheng, Kevin Pietz
%Created on 1/24/2018
%Last Edited on 1/25/2018
%Assignment 3 of ENGR0012
%Purpose: Statistical Analysis of User inputed data files

%Explanation of Variables:
%x: used for running through the data file twice via a for loop
%xsuffix: used for displaying "1st" or "2nd" for datafile selection
%outputtext: used for combining text and variables into 1 to be displayed
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
%totaldiff: used to sum point-mean total for variance calculation
%varofdata: the variance of the data
%standdev: the standard deviation of the data

clear;
clc;
x=1;

for x=1:2
    %for loop for running script for both data sets
    
    
    if x==1
        xsuffix='1st';
    else
        xsuffix='2nd';
    end
    
    %userdata will be the variable for whatever data is input
    outputtext=['Please enter the name of your ',xsuffix,' datafile: '];
    %the text has the 1st or second from xsuffix to make more userfriendly
    userdata=input(outputtext,'s');
    
    
    %making sure it actually exists, if not, they have to reenter the name
    while exist(userdata,'file')==0
        outputtext=['Error! Please reenter the name of your ',xsuffix,' datafile: '];
        userdata=input(outputtext,'s');
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
    
    %finding the variance and displaying it
    n=0;
    totaldiff=0;
    for n=1:numdata
        %totaldiff is current total + sorted(n)-mean squared
        totaldiff=totaldiff+((sorteddata(n)-meanofdata)^2);
    end
    %numdata-1 is to remain consistent with the variance equation
    varofdata=totaldiff/(numdata-1);
    disp('The Variance of the Data is: ');
    disp(varofdata);
    
    %standard deviation is square root of variance
    standdev=sqrt(varofdata);
    disp('The Standard Deviation of the Data is: ');
    disp(standdev);
    
end


