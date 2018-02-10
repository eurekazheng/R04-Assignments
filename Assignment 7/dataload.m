function [x,y]=dataload()
    % Function created by Kevin Pietz on 2.10.2018
    % Purpose: prompt user for data file, load data, create x's and y's

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
    
    %getting the x and y values from the inputted data
    if rows>cols
        x=userdata(:,1);
        y=userdata(:,2);
    elseif cols>rows
        x=userdata(1,:);
        y=userdata(2,:);
    end
end