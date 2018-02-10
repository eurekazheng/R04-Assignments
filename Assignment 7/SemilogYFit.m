%Created by Evan White to output x and y values for a semilog best fit
function [xnew,ynew,coeffs,title]=SemilogYFit(x,y)

[xnew,y2]=ZeroNegativeFilter(x,y);

yhat=log(y2);
coeffs=polyfit(xnew,yhat,1);
ynew=polyval(coeffs,xnew);
title=('Semilog Y Fit');
end