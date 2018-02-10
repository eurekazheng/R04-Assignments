function var1=plotdatapt(x,y,plotchoice)
    % Function created by Kevin Pietz on 2.10.2018 
    % Purpose: show data in different plot types 
    figure
    
    % regular plot
    subplot(3,1,1)
    plot(x,y,plotchoice)
    title('Regular Plot')
    xlabel('X')
    ylabel('Y')
    
    % semi-log
    subplot(3,1,2)
    plot(x,log(y),plotchoice)
    title('Semi-Log Plot')
    xlabel('X')
    ylabel('LOG(Y)')
    
    % log-log
    subplot(3,1,3)
    plot(log(x),log(y),plotchoice)
    title('Log-Log Plot')
    xlabel('LOG(X)')
    ylabel('LOG(Y)')
end