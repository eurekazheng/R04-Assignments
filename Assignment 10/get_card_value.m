function value = get_card_value(num)
    num = mod(num - 1, 13);
    if num >= 10
        value = 10;
    elseif num == 0
        value = 11;
    else
        value = num + 1;
    end
end