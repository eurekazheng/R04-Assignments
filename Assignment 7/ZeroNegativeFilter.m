%created by Evan white on 2/10/2018 to filter data for log fits
function [x2,y2]=ZeroNegativeFilter(x,y)
numdata=length(x);
m=1;
for n=1:numdata
    if y(n)>0
        y2(m)=y(n);
        x2(m)=x(n);
        m=m+1;
    end
end
end