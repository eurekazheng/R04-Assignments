function b = bet_amount(fund)
    disp(['Your current fund is ', num2str(fund)]);
    bet = fund + 1;
    while bet > fund
        bet = input('How much do you want to bet for this game: ');
        if bet > fund
            disp('Balance not enough!');
        end
    end
    b = bet;
end