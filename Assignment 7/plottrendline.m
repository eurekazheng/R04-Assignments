function plottrendline(x,y,xnew,ynew,plotchoice,r2,plottype,colort,yhat)
    % Function created by Kevin Pietz on 2.10.2018
    % Purpose to plot data points with trendline
    figure
    if plottype==1 || plottype==2 || plottype==3
        plot(x,y,plotchoice,xnew,ynew,colort)
    elseif plottype==4 
        plot(xnew,yhat,plotchoice,xnew,ynew,colort)
    elseif plottype==5
        plot(xnew,yhat,plotchoice,xnew,ynew,colort)
    end
    gtext(['The R^{',num2str(2),'}',' is: ',num2str(r2)]);
    
end