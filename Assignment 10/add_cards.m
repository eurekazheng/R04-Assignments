function t = add_cards(cards)
    total = 0;
    aces = 0;
    for card = 1:length(cards)
        total = total + get_card_value(card);
        if get_card_value(card) == 1
            aces = aces + 1;
        end
    end
    if total > 21
        total = total - aces * 10;
    end
    t = total;
end