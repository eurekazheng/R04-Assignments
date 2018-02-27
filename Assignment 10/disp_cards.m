function disp_cards(cards, subj, mode)
    disp([subj, ' now have the following cards: ']);
    for card = 1:length(cards)
        if mode == 't'
            disp(get_card_value(card));
        else
        end
    end
end