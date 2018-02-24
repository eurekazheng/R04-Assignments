%Rock Paper Scissors game for assignment 10
%Created by Evan White

function rps

close all

%displaying rules
disp('The Rules/Steps of Rock Paper Scissors are: ');
disp('1) Rock beat Scissors, Scissors beat Paper, Paper beats Rock ');
disp('2) If you pick the same thing as the bot, you tie ');
disp('3) First to reach specified number of wins, wins overall ');

%shuffling rng, setting inital variables
rng('shuffle');
again=1;
botwins=0;
playerwins=0;

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
        
        %getting the bot's choice
        botchoice=randi(3);
        switch botchoice
            case 1
                botimage=imread('images/rock.jpg');
            case 2
                botimage=imread('images/paper.jpg');
            case 3
                botimage=imread('images/scissors.jpg');
        end
        subplot(2,2,2);
        imshow(botimage);
        axis off;
        text(0,0,'Bot''''s Choice: ');
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
        tied='n';
        for n=1:3
            %if both have a 1 at that n value in their arrays, they tied
            if userarray(n)-botarray(n)==0&&userarray(n)~=0
                subplot(2,2,4);
                axis off;
                text(.5,.5,'You Tied');
                tied='y';
            end
        end
        
        %checking for winners by checking if the user has something that
        %beats the bot, and making sure the user did actually choose that
        if userarray(1)-botarray(3)==0&&userarray(1)~=0
            subplot(2,2,4);
            axis off;
            text(.5,.5,'You Won');
            playerwins=playerwins+1;
            
        elseif userarray(2)-botarray(1)==0&&userarray(2)~=0
            subplot(2,2,4);
            axis off;
            text(.5,.5,'You Won');
            playerwins=playerwins+1;
        elseif userarray(3)-botarray(2)==0&&userarray(3)~=0
            subplot(2,2,4);
            axis off;
            text(.5,.5,'You Won');
            playerwins=playerwins+1;
            %if player and bot didnt tie and player didnt win, they tied
        elseif tied~='y'
            subplot(2,2,4);
            axis off;
            text(.5,.5,'You Lost');
            botwins=botwins+1;
        end
        subplot(2,2,3);
        axis off;
        %counting number of wins
        text(.2,.6,['Required # of wins: ',num2str(numwins)]);
        text(.2,.5,['Your wins: ',num2str(playerwins)]);
        text(.2,.4,['Bot wins: ',num2str(botwins)]);
        
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
    
    again=menu('Do you want to keep going?','Yes','No');
end

end