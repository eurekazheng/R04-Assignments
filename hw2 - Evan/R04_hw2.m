% Created by Evan White on 1/19/2018 for Assignment 2 of ENGR0012. Last edited on 1/19/2018.
% This script will solve a set of linear equations using data input by the
% user 
clear;
clc;
disp('This Script will solve a set of linear equations using data input by the user');

userchoice='y';
while userchoice=='y'
    %while user choice is y, keep running this script
    userdata=input('Please enter the name of the data file: ','s');
    while exist(userdata,'file')==0
    %checking if the file exists, if it doesn't it asks for a rentry
        userdata=input('Error! Please reenter the filename: ','s');
    end
    userdata=load(userdata);
    %load the file that is associated with the name entered previously
    [rows, cols]=size(userdata);
    %getting the size of the data that was input
    if cols>rows
    %if the data is in rows meaning more columns than rows, run this
        equations=userdata(:,1:cols-1);
        if det(equations)==0
            %checking if the determinant is correct
            disp('Error! Wrong Dimensions.');
        end
        %getting the equations
        solutions=userdata(:,cols);
        %getting their solutions
        output=equations\solutions;
        %getting the x values
        disp(output);  
    else
        % if the data is organized the other way, run this
        equations=userdata(1:rows-1,:);
        if det(equations)==0
            disp('Error! Wrong Dimensions.');
        end
        solutions=userdata(rows,:);
        %transposing the data
        equations=transpose(equations);
        %same for equations
        solutions=transpose(solutions);
        output=equations\solutions;
        disp(output);
    end  
    userchoice=input('Would you like to run again? (y/n)  ','s');
    %the if, else if, else for errors on inputing the users choice
    if userchoice=='y'
    
    elseif userchoice=='n'
       disp('Goodbye!'); 
    else
        userchoice=input('Error! Would you like to run again? (y/n)  ','s');
    end
end
