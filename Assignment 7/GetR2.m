%created by Evan White on 2/10/2018 to get rsquared values
function [rsquared]=GetR2(y,ynew)

sse=0;
sst=0;
numdata=length(y);
for n=1:numdata
    sse=sse+(y(n)-ynew(n))^2;
end
for n=1:numdata
    sst=sst+(y(n)-mean(y))^2;
end

rsquared=1-sse/sst;

end