function plottrendline(x,y,xnew,ynew,plotchoice,r2)
    % Function created by Kevin Pietz on 2.10.2018
    % Purpose to plot data points with trendline
    
    figure
    plot(x,y,plotchoice,xnew,ynew,'k-')
    gtext(['The R^{',num2str(2),'}',' is: ',num2str(r2)]);
end