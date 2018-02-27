%user rolls 2 dice, if the sum is 7 or 11, the user wins, else if the sum
%is 2,3 or 12, the user loses, else the user keeps rolling the dice
%after the user rolls the dice, if the sum is the same as the the original
%sum, the user wins, else if the user sum is 7 or 11, the user loses, else
%the user keeps rolling the dice

function [won,lost]=craps_game()
close all;
clc;

disp('The Rules of Craps are: ');
disp('1) The User rolls 2 dices, and wins if the sum is 7 or 11');
disp('2) If the user rolls 2, 3, or 12 on the first round they lose  ');
disp('3) On the 2nd or later roles, if the sum is the same as the original sum the user wins  ');
disp('4) If the sum is 7 or 11 on subsequent rolls, the user loses ');

%shuffle random number
rng('shuffle');

%loads images

dice{1}=imread('face1.jpg');
dice{2}=imread('face2.jpg');
dice{3}=imread('face3.jpg');
dice{4}=imread('face4.jpg');
dice{5}=imread('face5.jpg');
dice{6}=imread('face6.jpg');

again=1;
won=0;
lost=0;



while again==1
    
    choice=menu('What do you want to do?','Roll dice');
    
    switch choice
        case 1
            roll=randi(6,2,6);
            for i=1:6 %for loop that shows dice rolling
                subplot(2,2,1);
                imshow(dice{roll(1,i)});
                subplot(2,2,2);
                imshow(dice{roll(2,i)})
                pause(.05);
            end
            
            sum_dice=sum(roll(:,6));
            
            
            if sum_dice==7 || sum_dice==11
                result=1; %user won
                won=won+1;
                subplot(2,2,3)
                axis off;
                text(.5,.4,'You Won');
            elseif sum_dice==2 || sum_dice==3 || sum_dice==12
                result=2; %user lost
                lost=lost+1;
                subplot(2,2,3)
                axis off;
                text(.5,.4,'You Lost');
            else
                result=3; %user keeps playing
                subplot(2,2,3)
                axis off;
                text(.5,.5,['To win you must get a sum of ',num2str(sum_dice)]);
            end
            
    end
    
    
    
    while result==3
        
        choice2=menu('Click here to roll again','Roll dice'); %functions as a button to roll the dice
        
        switch choice2
            case 1
                subplot(2,2,3)
                axis off;
                text(.5,.5,['To win you must get a sum of ',num2str(sum_dice)]);
                roll_2=randi(6,2,6);
                for i=1:6 %for loop that shows dice rolling
                    subplot(2,2,1);
                    imshow(dice{roll_2(1,i)});
                    subplot(2,2,2);
                    imshow(dice{roll_2(2,i)})
                    pause(.05);
                    
                end
                
                sum_dice2=sum(roll_2(:,6)); %sums the result of the dice
                
                if sum_dice2==sum_dice
                    result=1; %user wins
                    won=won+1;
                    subplot(2,2,3)
                    axis off;
                    text(.5,.4,'You Won');
                elseif sum_dice2==7 || sum_dice==11
                    result=2; %user loses
                    lost=lost+1;
                    subplot(2,2,3)
                    axis off;
                    text(.5,.4,'You Lost');
                else
                    result=3; %user keeps rolling
                end
        end
    end
    
    %keeps track of how many times the user has won
    disp(['You have won a total of ',num2str(won),' times']);
    %keeps track of how many times the user has lost
    disp(['You have lost a total of ',num2str(lost),' times']);
    
    again=menu('Do you want to keep playing','Yes','No');
end