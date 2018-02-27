%Rock Paper Scissors game for R04 assignment 10
%Created by Evan White
%Mandala TTh 14:00

function [won,lost]=rps

close all;

rps_disp_rules();

rand('state', sum(100 * clock));
again=1;
botwins=0;
playerwins=0;
won=0;
lost=0;

while again==1
    %getting the targetted number of wins to win over all and checking for
    %input errors
    numwins=input('How many wins to win overall: ');
    while numwins<1
        numwins=input('Error! Choose a positive number of wins: ');
    end
    
    
    while botwins<numwins&&playerwins<numwins
        disp('3'); %counting down
        pause(1);
        disp('2');
        pause(1);
        disp('1');
        pause(1);
        %getting user choice then showing it
        userchoice=menu('Shoot! ','Rock','Paper','Scissors');
        switch userchoice
            case 1
                userimage=imread('images/rock.jpg');
            case 2
                userimage=imread('images/paper.jpg');
            case 3
                userimage=imread('images/scissors.jpg');
        end
        figure;
        subplot(2,2,1);
        imshow(userimage);
        axis off;
        text(0,0,'Your Choice: ');
        botchoice = rps_generate_bot();
        userarray=zeros(1,3);
        botarray=zeros(1,3);
        %making an array to check for the winner, if their choice is at n,
        %array(n)=1
        for n=1:3
            if userchoice==n
                userarray(n)=1;
            end
            if botchoice==n
                botarray(n)=1;
            end
        end
        [botwins, playerwins] = rps_compare(playerwins, botwins, userarray, botarray);
        subplot(2,2,3);
        axis off;
        %counting number of wins
        text(.2,.6,['Required # of wins: ',num2str(numwins)]);
        text(.2,.5,['Your wins: ',num2str(playerwins)]);
        text(.2,.4,['Bot wins: ',num2str(botwins)]);
        
        won=won+playerwins;
        lost=lost+botwins;
        
        %displaying the overall winner when the required overall number of
        %wins to finish is reached
        if playerwins==numwins||botwins==numwins
            if playerwins>botwins
                text(.2,.2,'You Won Overall!');
            else
                text(.2,.2,'The Bot Won. You will get them next time!');
            end
        end
        
        
        
        pause(1);
        clc;
        
    end
    botwins=0;
    playerwins=0;
    again=menu('Do you want to keep going?','Yes','No');
end

end