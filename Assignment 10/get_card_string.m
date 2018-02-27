% Created by Eureka Zheng
% Return string name of the integer value

function name = get_card_string(value)
    value = value - 1;
    number = char('Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', ...
        'Nine', 'Ten', 'Jack', 'Queen', 'King');
    suits = char('hearts', 'diamonds', 'spades', 'clubs');
    num = strtrim(number(mod(value, 13) + 1, :));
    suit = strtrim(suits(fix(value / 13) + 1, :));
    name = [num, ' of ', suit];
end