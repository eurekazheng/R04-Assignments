function [xnew,ynew,coeffs,titlel]=linearfit(x,y)
    % function created by Kevin Pietz on 2.10.2018
    % Purpose: find a linear fit to data points, output new points
    
    coeffs=polyfit(x,y,1);
    
    xnew=x;
    
    ynew=polyval(coeffs,xnew);
    
   titlel='Linear Fit';
    
end