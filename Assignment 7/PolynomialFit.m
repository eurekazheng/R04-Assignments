%Created by Evan White on 2/10/18 to output polynomial x and y values, the
%coefficients, and a title for graphing

function [xnew,ynew,coeffs,title]=PolynomialFit(x,y)

maxdegree=size(x)-1;
degree=input('Please choose a degree for your polynomial: ');
while degree>=maxdegree
    degree=input('Error! Please choose a smaller degree for your polynomial: ');
end

xnew=linspace(min(x),max(x),300);
coeffs=polyfit(x,y,degree);
ynew=polyval(coeffs,xnew);

if degree==1
    suffix='st';
elseif degree==2
    suffix='nd';
elseif degree==3
    suffix='rd';
else
    suffix='th';
end

title=[num2str(degree),suffix,' Degree Polynomial Fit'];

end