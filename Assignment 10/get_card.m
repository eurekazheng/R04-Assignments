% Created by Eureka Zheng
% Card dealing function, return a random integer value from 1 to 52

function value = get_card()
    value = randperm(52, 1);
end

