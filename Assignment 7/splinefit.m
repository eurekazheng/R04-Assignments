function [xnew,ynew,coeffs,yest]=splinefit(x,y)
    % Function created by Kevin Pietz on 2.10.2018
    % Purpose is to find new variables for spline

    coeffs=spline(x,y);
    xnew=linspace(min(x),max(x),300);
    ynew=ppval(coeffs,xnew);
    yest=ppval(coeffs,x);
    
end
