function value = get_card_value(num)
    num = mod(num - 1, 13);
    if (num >= 10)
        value = 10;
    else
        value = num + 1;
    end
end