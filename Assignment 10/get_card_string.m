% Created by Eureka Zheng
% Return string name of the integer value

function name = get_card_string(value)
    value = value - 1;
    number = {'Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', ...
        'Nine', 'Ten', 'Jack', 'Queen', 'King'};
    suits = {' hearts', ' diamonds', ' spades', ' clubs'};
    num = number{mod(value, 13) + 1};
    suit = suits{fix(value / 13) + 1};
    name = strcat(num, ' of', suit);
end