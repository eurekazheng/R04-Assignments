function var2=plottrendline(x,y,xnew,ynew,plotchoice,plottitle)
    % Function created by Kevin Pietz on 2.10.2018
    % Purpose to plot data points with trendline
    
    figure
    plot(x,y,plotchoice,xnew,ynew,'k-')
    title(plottitle)
end