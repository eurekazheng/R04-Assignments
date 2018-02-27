% Created by Eureka Zheng
% Return string name of the integer value

function name = get_card_string(value)
    value = value - 1;
    number = {'Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', ...
        'Nine', 'Ten', 'Jack', 'Queen', 'King'};
    suits = {' hearts', ' diamonds', ' spades', ' clubs'};
    % Get number by modulus
    num = number{mod(value, 13) + 1};
    % Get suit by division
    suit = suits{fix(value / 13) + 1};
    name = strcat(num, ' of', suit);
end