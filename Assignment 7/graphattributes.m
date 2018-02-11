function graphattributes()
    % Function created by Kevin Pietz on 2.11.2018
    % Purpose to allow user to enter title, grid lines, and labels
    
    % Title
    titleprompt=input('Please enter the title for the graph: ','s');
    title(titleprompt)
    
    % Grid Lines
    gridlines=menu('Would you like to have grid lines?','yes','no');
    switch gridlines
        case 1
            grid on
        case 2
            disp('That''s fine too, I guess');
        otherwise
    end
    
    % X-Y Labels
    xlab=input('Label the x-axis: ','s');
    ylab=input('Label the y-axis: ','s');
    xlabel(xlab);
    ylabel(ylab);
end