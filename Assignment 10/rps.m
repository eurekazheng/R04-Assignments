%rock paper scissors game function created by Evan White on 2/22/2018 for
%Assignment 10

function rps

close all

disp('The Rules/Steps of Rock Paper Scissors are: ');
disp('1) Rock beat Scissors, Scissors beat Paper, Paper beats Rock ');
disp('2) If you pick the same thing as the bot, you tie ');
disp('3) First to reach specified number of wins, wins overall ');


rng('shuffle');
again=1;
botwins=0;
playerwins=0;

while again==1
    numwins=input('How many wins to win overall: ');
    while numwins<1
        numwins=input('Error! Choose a positive number of wins: ');
    end
    
    while botwins<numwins&&playerwins<numwins
        disp('3');
        pause(1);
        disp('2');
        pause(1);
        disp('1');
        pause(1);
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
        text(0,0,'Your Choice: ');
        
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
        text(0,0,'Bot''''s Choice: ');
        userarray=zeros(1,3);
        botarray=zeros(1,3);
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
            if userarray(n)-botarray(n)==0&&userarray(n)~=0
                subplot(2,2,4);
                text(.5,.5,'You Tied');
                tied='y';
            end
        end
        
        if userarray(1)-botarray(3)==0&&userarray(1)~=0
            subplot(2,2,4);
            text(.5,.5,'You Won');
            playerwins=playerwins+1;
            
        elseif userarray(2)-botarray(1)==0&&userarray(2)~=0
            subplot(2,2,4);
            text(.5,.5,'You Won');
            playerwins=playerwins+1;
        elseif userarray(3)-botarray(2)==0&&userarray(3)~=0
            subplot(2,2,4);
            text(.5,.5,'You Won');
            playerwins=playerwins+1;
        elseif tied~='y'
            subplot(2,2,4);
            text(.5,.5,'You Lost');
            botwins=botwins+1;
        end
        subplot(2,2,3);
        text(.5,.5,['Your wins: ',num2str(playerwins)]);
        text(.5,.3,['Bot wins: ',num2str(botwins)]);
        pause(1);
        clc;
    end
    if playerwins>botwins
        disp('You Won Overall!');
    else
        disp('The Bot Won. You''''ll get them next time');
    end
    again=menu('Do you want to keep going?','Yes','No');
end

end