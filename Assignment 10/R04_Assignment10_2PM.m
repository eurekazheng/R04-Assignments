%R04 Assignment 10
clear;
clc;
close all;

again=1;
won=0;
lost=0;
while again==1
    gamechoice=menu('Pick a game:','Heads or Tails','Roll-A-Dice','Beat the Dealer','Rock-Paper-Scissors','Blackjack','Craps','Quit');
    
    switch gamechoice
        case 1
            coinflip;
        case 2
            [wontemp,losttemp]=rolladice;
            won=won+wontemp;
            lost=lost+losttemp;
        case 3
            [wontemp,losttemp]=beatthedealer;
            won=won+wontemp;
            lost=lost+losttemp;
        case 4
            [wontemp,losttemp]=rps;
            won=won+wontemp;
            lost=lost+losttemp;
        case 5
            [wontemp,losttemp]=blackjack;
            won=won+wontemp;
            lost=lost+losttemp;
        case 6
             [wontemp,losttemp]=craps_game;
             won=won+wontemp;
            lost=lost+losttemp;
        case 7
            again=2;
            
    end
end
close all;
disp(['You won ',num2str(won),' time(s) and lost ',num2str(lost),' time(s).']);
disp('Thanks for Playing!');