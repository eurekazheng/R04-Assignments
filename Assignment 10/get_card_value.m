% Created by Eureka Zheng
% Return points of the integer value

function value = get_card_value(num)
    num = mod(num - 1, 13);
    % J, Q, K
    if num >= 10
        value = 10;
    % Ace
    elseif num == 0
        value = 11;
    % Others
    else
        value = num + 1;
    end
end