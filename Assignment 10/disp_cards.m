function disp_cards(cards, subj, mode, images)
    if mode == 't'
        disp([subj, ' now have the following cards: ']);
        for i = 1:length(cards)
            disp(get_card_string(cards(i)));
        end
    else
        disp([subj, ' cards are updated in the figure']);
        hold on;
        for i = 1:length(cards)
            subplot(1, length(cards), i);
            axis off;
            imshow(images{cards(i)});
        end
        title([subj, ' cards: '], 'FontSize', 15);
        hold off;
    end
end