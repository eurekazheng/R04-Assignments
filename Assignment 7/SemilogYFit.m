%Created by Evan White to output x and y values for a semilog best fit
function [xnew,ynew,coeffs,y2]=SemilogYFit(x,y)

[xnew,y2]=ZeroNegativeFilter(x,y);

yhat=log(y2);
coeffs=polyfit(xnew,yhat,1);
ynew=polyval(coeffs,xnew);

end