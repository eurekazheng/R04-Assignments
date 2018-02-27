% Created by Eureka Zheng
% Display cards information with text or images
% @param cards: integer value array of the cards
% @param subj: cards owner for string concat
% @param mode: text or images
% @param images: images array

function disp_cards(cards, subj, mode, images)
    % Display text
    if mode == 't'
        disp([subj, ' now have the following cards: ']);
        for i = 1:length(cards)
            disp(get_card_string(cards(i)));
        end
    % Display images with subplot
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