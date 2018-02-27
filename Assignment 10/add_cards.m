% Created by Eureka Zheng
% Return sum of cards

function t = add_cards(cards)
    total = 0;
    aces = 0;
    for i = 1:length(cards)
        total = total + get_card_value(cards(i));
        if get_card_value(cards(i)) == 11
            aces = aces + 1;
        end
    end
    if total > 21
        total = total - aces * 10;
    end
    t = total;
end