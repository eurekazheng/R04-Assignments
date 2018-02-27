%Beat The Dealer game for Assignment 10
%Created by Evan White
function [won,lost]=beatthedealer
clc;

%Displaying the rules
disp('The Rules/Steps of Beat the Dealer are: ');
disp('1) First you draw a card, then the bot will');
disp('2) Higher value card wins ');
disp('3) Ace is highest value ');
disp('4) Cards are shuffled each round ');

%shuffling the rng
rng('shuffle');

%loading all the card images
for n=1:52
    cards{n}=imread(['images/',num2str(n),'.jpg']);
end

%settings wins to 0
playerwins=0;
botwins=0;

%First menu for drawing a card
again=menu('Beat the Dealer','Draw a Card','Quit');

while again==1
    
    %generating card values from 1 to 13 using randi so it is possible to
    %tie
    cardvalues=randi(13,1,2);
    %player card is first number
    playercard=cardvalues(1);
    %botcard is second number
    botcard=cardvalues(2);
    
    %getting the suite of each participants card
    playersuite=randi(4);
    botsuite=randi(4);
    
    %making sure the player and bot dont have the same card
    while botsuite==playersuite&&botcard==playercard
        %if they do the bots card is regenerated
        botcard=randi(13);
        botsuite=randi(4);
    end
    
    %getting the image, each suite has 13 cards so i multiply the suite-1
    %(4 suites, but have to add the player card) times 13 then add their
    %card number
    playercardimg=cards{13*(playersuite-1)+playercard};
    botcardimg=cards{13*(botsuite-1)+botcard};
    
    figure;
    hold on;
    
    %showing the cards
    subplot(2,2,1);
    axis off;
    imshow(playercardimg);
    text(0,.3,'Your Card: ');
    
    subplot(2,2,2);
    axis off;
    imshow(botcardimg);
    text(0,.3,'Bots Card');
    
    %card with #1 is an ace, so i make it into 14 so it will win against a
    %king
    if playercard==1
        playercard=14;
    end
    if botcard==1
        botcard=14;
    end
    
    %checking who won, incrementing the # of wins, and displaying results
    subplot(2,2,4);
    axis off;
    if playercard>botcard
        text(.5,.5,'You Won!');
        playerwins=playerwins+1;
        
    elseif botcard>playercard
        text(.5,.5,'The Bot Won...');
        botwins=botwins+1;
        
    else
        text(.5,.5,'You Tied.');
    end
    text(.5,.3,['Your Wins: ',num2str(playerwins)]);
    text(.5,.2,['Bot Wins: ',num2str(botwins)]);
    
    again=menu('Beat the Dealer','Draw a Card','Quit');
    
end
close all;
won=playerwins;
lost=botwins;
end