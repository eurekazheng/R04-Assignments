%R04 Assignment 10
clear;
clc;
close all;

again=1;
while again==1
    gamechoice=menu('Pick a game:','Heads or Tails','Roll-A-Dice','Beat the dealer','Rock-Paper-Scissors','Blackjack','Craps','Quit');
    
    switch gamechoice
        case 1
        case 2
            rolladice;
        case 3
        case 4
        case 5
        case 6
        case 7
            again=2;
            
    end
end
close all;
disp('Thanks for Playing!');