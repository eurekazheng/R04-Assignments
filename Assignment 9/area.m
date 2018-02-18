function area(funf)
    % Prompt users for range of numerical integration
    xmin = input('Enter the start x-value of integration: ');
    xmax = input('Enter the end x-value of integration: ');
    % Switch xmin & xmax if reversed
    if xmin > xmax
        tempxmin = xmax;
        xmax = xmin;
        xmin = tempxmin;
    end
    % Prompt users for type of numerical integration
    niType = menu('Select type of numerical integration', 'trapz', 'quadl');
    % Calculations
    switch niType
        case 1
            % Prompt users for step of trapezoidal integration
            step = input('Enter the step of numerical integration: ');
            range = xmin:step:xmax;
            area = trapz(range, funf(range));
        case 2
            area = quadl(funf, xmin, xmax);
    end
    % Result display
    disp(strcat(['The area under the curve between ', num2str(xmin), ' and ', ...
        num2str(xmax), ' is ', num2str(area)]));
end

