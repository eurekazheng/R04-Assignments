%Evan White, Eureka Zheng, Kevin Pietz
%Engineering 0012 T,Th 2:00-4:00
%Instructor: Mandala
%Created on 1/24/2018, Edited on 1/27/2018
%Assignment 3
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
%numbins: the number of bins
%binbounds: an array with all the bounds for the bins
%currentcheck: the number currently being check in the bin count calc
%bincounts: an arry with all the counts for each bin
%xlab: variable for x label
%ylab: variable for y label
%placetext: variable for use in gtext

clear;
clc;
again='y';

while again=='y'
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
        
        numbins=input('Please Enter the Number of Bins: ');
        while isnumeric(numbins)==0||numbins<1
            numbins=input('Error! Please Enter the Number of Bins: ');
        end
        
        
        %getting mean of data using totalofdata divided by numdata
        meanofdata=totalofdata/numdata;
        disp('The Mean of the Data is: ');
        disp(meanofdata);
        
        %min of data is first data point of sorted data
        currmin=userdata(1);
        %set current min to the first data point to start
        
        for n=2:numdata
            if userdata(n)<currmin
                currmin=userdata(n);
            end
            %if userdata at index n is less than the current min, set the current
            %min equal to that userdata point
        end
        minofdata=currmin;
        
        
        %setting n back to 0 and currmax to the first data point
        
        currmax=userdata(1);
        for n=2:numdata
            if userdata(n)>currmax
                currmax=userdata(n);
            end
        end
        %just like with min, every data point is checked, and this time if its
        %greater than the last, it is set as the current max
        maxofdata=currmax;
        
        
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
        
        
        if x==1
            figure %so a new figure is made every time the user restarts
            subplot(2,1,x)
            hist(sorteddata,numbins);
            title('Using the HIST Command');
            xlab=input('Please type your x label: ','s');
            xlabel(xlab);
            ylab=input('Please type your y label: ','s');
            ylabel(ylab);
            placetext=input('Please type your text to be placed on graph: ','s');
            gtext(placetext);
        else
            range=sorteddata(numdata)-sorteddata(1);
            delta=range/numbins;
            %both the number of bounds and the counts in the bins have the
            %same size
            binbounds=zeros(1,numbins+1);
            bincounts=zeros(1,numbins);
            %left bound is the minimum data point
            binbounds(1)=minofdata;
            %the second bin bound is the first plus the delta, and so on
            for n=2:numbins+1
                binbounds(n)=binbounds(n-1)+delta;
            end
            
            for n=1:numdata
                currentcheck=sorteddata(n); %check every number from 1 to number of datapoints
                for m=numbins:-1:1
                    if currentcheck>=binbounds(m+1) %if current num being check is greater or equal to binbounds at m, add a bincount at m
                        bincounts(m)=bincounts(m)+1;
                        break;
                    end
                end
            end
            subplot(2,1,x)
            bar(binbounds(1:numbins),bincounts);
            title('Using the bar Command');
            xlab=input('Please type your x label: ','s');
            xlabel(xlab);
            ylab=input('Please type your y label: ','s');
            ylabel(ylab);
            placetext=input('Please type your text to be placed on graph: ','s');
            gtext(placetext);
        end
        
    end
    again=input('Would you like to run again? (y/n)  ','s');
    %the if, else if, else for errors on inputing the users choice
    if again=='y'
        
    elseif again=='n'
        disp('Goodbye!');
    else
        again=input('Error! Would you like to run again? (y/n)  ','s');
    end
end