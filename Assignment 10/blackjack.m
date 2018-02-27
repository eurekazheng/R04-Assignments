% Blackjack Game for Group R04 Assignment 10
% Created by Eureka Zheng

function [w, l]=blackjack()

close all;
won = 0;
lost = 0;

% Randomization seed
rand('state', sum(100 * clock));
% Ask for initial fund
fund = input('How much money do you want to begin with: ');
% Ask for display preference
mode = input('Do you want to display as text or as images(t/i): ', 's');
for i = 1:52
    images{i} = imread(['images/', num2str(i), '.jpg']);
end
% Main game loop
again = 'y';
while again == 'y'
   bet = bet_amount(fund);
   %% Initial cards dealing
   dealer_cards = [get_card(), get_card()];
   show = get_card_string(dealer_cards(1));
   disp(['The dealer has the ', show, ' showing.']);
   player_cards = [get_card(), get_card()];
   disp_cards(player_cards, 'You', mode, images);
   player_total = add_cards(player_cards);
   disp(['Your current total is ', num2str(player_total)]);
   stood = 1;
   %% Player loop
   while true
       r = input('Do you want to hit or stand?(h/s): ', 's');
       if (r == 'h')
           new_card = get_card();
           player_cards = [player_cards, new_card];
           player_total = add_cards(player_cards);
           disp_cards(player_cards, 'You', mode, images);
           disp(['Your current total is ', num2str(player_total)]);
           if player_total > 21
               disp('You went bust, you lose.');
               fund = fund - bet;
               stood = 0;
               lost = lost + 1;
               break;
           end
       else
           break;
       end
   end
   %% If player stood pat, show dealer's cards and total
   if stood
       disp_cards(dealer_cards, 'Dealer', mode, images);
       dealer_total = add_cards(dealer_cards);
       disp(['Dealer current total is ', num2str(dealer_total)]);
   end
   %% Dealer's loop
   while stood
       if dealer_total < 16
           new_card = get_card();
           dealer_cards = [dealer_cards, new_card];
           dealer_total = add_cards(dealer_cards);
           disp_cards(dealer_cards, 'Dealer', mode, images);
           disp(['Dealer current total is ', num2str(dealer_total)]);  
           if dealer_total > 21
               disp('The dealer went bust, you win!');
               fund = fund + bet;
               won = won + 1;
               stood = 0;
               break;
           end        
       else
           break;
       end
   end
   %% If no one busts, compare total
   if stood
       if dealer_total > player_total
           disp('You lose.');
           fund = fund - bet;
           lost = lost + 1;
       elseif dealer_total < player_total
           disp('You win!');
           fund = fund + bet;
           won = won + 1;
       else
           disp('This hand is a draw');
       end
   end
   again = input('Do you want to play again?(y/n): ', 's');
end
w = won;
l = lost;
