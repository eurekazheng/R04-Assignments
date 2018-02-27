% Roll A Dice Game for Assignment 10
%Created by Evan White

function [won,lost]=rolladice

close all;
clc;

disp('The Rules/Steps of Roll-A-Dice are: ');
disp('1) You pick number of dice ');
disp('2) You then estimate total value of your dice roll ');
disp('3) If you got your estimate right, you win! ');

%shuffle rng
rng('shuffle','twister');

dice=cell(1,6);
for n=1:6
    dice{n}=imread(['images/face',num2str(n),'.jpg']);
end

won=0;
lost=0;

again=1;
while again==1
    
    close all;
    numdice=menu('How many dice do you want?','One','Two','Three','Four','Five');
    
    usernum=input('Enter your estimate for the roll: ');
    
    figure;
    hold on;

    
    switch numdice
        case 1
            roll=randperm(6);
            subplot(2,1,1);
            hold on;
            for i=1:length(roll)
                imshow(dice{roll(i)});
                pause(.1)
            end
            imshow(dice{roll(6)});
            
            if usernum==roll(6)
                subplot(2,1,2);
                axis off;
                text(.5,.5,'You Won!');
                won=won+1;
            else
                subplot(2,1,2);
                axis off;
                text(.5,.5,'You Lost!');
                lost=lost+1;
            end
            
        case 2
            roll_1=randperm(6);
            subplot(2,2,1);
            for i=1:length(roll_1)
                imshow(dice{roll_1(i)});
                pause(.1)
            end
            imshow(dice{roll_1(6)});
            
            roll_2=randperm(6);
            subplot(2,2,2);
            for i=1:length(roll_2)
                imshow(dice{roll_2(i)});
                pause(.1)
            end
            imshow(dice{roll_2(6)});
            
            if usernum==(roll_1(6)+roll_2(6))
                subplot(2,2,4);
                axis off;
                text(.5,.5,'You Won!');
                won=won+1;
            else
                subplot(2,2,4);
                axis off;
                text(.5,.5,'You Lost!');
                lost=lost+1;
            end
            
            
        case 3
            roll_1=randperm(6);
            subplot(2,3,1);
            for i=1:length(roll_1)
                imshow(dice{roll_1(i)});
                pause(.1)
            end
            imshow(dice{roll_1(6)});
            
            roll_2=randperm(6);
            subplot(2,3,2);
            for i=1:length(roll_2)
                imshow(dice{roll_2(i)});
                pause(.1)
            end
            imshow(dice{roll_2(6)});
            
            roll_3=randperm(6);
            subplot(2,3,3);
            for i=1:length(roll_3)
                imshow(dice{roll_3(i)});
                pause(.1)
            end
            imshow(dice{roll_3(6)});
            
            if usernum==(roll_1(6)+roll_2(6)+roll_3(6))
                subplot(2,3,6);
                axis off;
                text(.5,.5,'You Won!');
                won=won+1;
            else
                subplot(2,3,6);
                axis off;
                text(.5,.5,'You Lost!');
                lost=lost+1;
            end
            
        case 4
            roll_1=randperm(6);
            subplot(2,4,1);
            for i=1:length(roll_1)
                imshow(dice{roll_1(i)});
                pause(.1)
            end
            imshow(dice{roll_1(6)});
            
            roll_2=randperm(6);
            subplot(2,4,2);
            for i=1:length(roll_2)
                imshow(dice{roll_2(i)});
                pause(.1)
            end
            imshow(dice{roll_2(6)});
            
            roll_3=randperm(6);
            subplot(2,4,3);
            for i=1:length(roll_3)
                imshow(dice{roll_3(i)});
                pause(.1)
            end
            imshow(dice{roll_3(6)});
            
            roll_4=randperm(6);
            subplot(2,4,4);
            for i=1:length(roll_4)
                imshow(dice{roll_4(i)});
                pause(.1)
            end
            imshow(dice{roll_4(6)});
            
            if usernum==(roll_1(6)+roll_2(6)+roll_3(6)+roll_4(6))
                subplot(2,4,8);
                axis off;
                text(.5,.5,'You Won!');
                won=won+1;
            else
                subplot(2,4,8);
                axis off;
                text(.5,.5,'You Lost!');
                lost=lost+1;
            end
            
        case 5
            roll_1=randperm(6);
            subplot(2,5,1);
            for i=1:length(roll_1)
                imshow(dice{roll_1(i)});
                pause(.1)
            end
            imshow(dice{roll_1(6)});
            
            roll_2=randperm(6);
            subplot(2,5,2);
            for i=1:length(roll_2)
                imshow(dice{roll_2(i)});
                pause(.1)
            end
            imshow(dice{roll_2(6)});
            
            roll_3=randperm(6);
            subplot(2,5,3);
            for i=1:length(roll_3)
                imshow(dice{roll_3(i)});
                pause(.1)
            end
            imshow(dice{roll_3(6)});
            
            roll_4=randperm(6);
            subplot(2,5,4);
            for i=1:length(roll_4)
                imshow(dice{roll_4(i)});
                pause(.1)
            end
            imshow(dice{roll_4(6)});
            
            roll_5=randperm(6);
            subplot(2,5,5);
            for i=1:length(roll_5)
                imshow(dice{roll_5(i)});
                pause(.1)
            end
            imshow(dice{roll_5(6)});
            
            totalofdice=roll_1(6)+roll_2(6)+roll_3(6)+roll_4(6)+roll_5(6);
            if usernum==(totalofdice)
                subplot(2,5,10);
                axis off;
                text(.5,.5,'You Won!');
                won=won+1;
            else
                subplot(2,5,10);
                axis off;
                text(.5,.5,'You Lost!');
                lost=lost+1;
            end
            
    end
    
    again=menu('Do you want to keep going?','Yes','No');
end
    close all;
end
