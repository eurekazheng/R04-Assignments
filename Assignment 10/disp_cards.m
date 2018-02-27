function disp_cards(cards, subj, mode)
    disp([subj, ' now have the following cards: ']);
    for i = 1:length(cards)
        if mode == 't'
            disp(get_card_string(cards(i)));
        else
        end
    end
end