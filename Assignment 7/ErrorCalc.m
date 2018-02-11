%created by Evan White on 2/11/2018 to calculate errors of fit lines
function [maxabs, maxrel, minabs, minrel, xmaxa, xmaxr, xmina, xminr]=ErrorCalc(x,y,fity)

%setting up the error variables beforehand
numdata=length(x);
abserror=zeros(1,numdata);
relerror=zeros(1,numdata);
maxabs=0;
maxrel=0;
minabs=1e100;
minrel=1e100;


%calculating the errors and recording the maxes in 1 for loop
for n=1:numdata
    abserror(n)=abs(y(n)-fity(n));
    if y(n)>0
        relerror(n)=abserror(n)/y(n);
    end
    if abserror(n)>maxabs
        maxabs=abserror(n);
        xmaxa=x(n);
    end
    if abserror(n)<minabs
        minabs=abserror(n);
        xmina=x(n);
    end
    if relerror(n)>maxrel
        maxrel=relerror(n);
        xmaxr=x(n);
    end
    if relerror(n)<minrel
        minrel=relerror(n);
        xminr=x(n);
    end
end

disp(['The max absolute error is ',num2str(maxabs),' at x = ',num2str(xmaxa)]);
disp(['The max relative error is ',num2str(maxrel),' at x = ',num2str(xmaxr)]);
disp(['The min absolute error is ',num2str(minabs),' at x = ',num2str(xmina)]);
disp(['The min relative error is ',num2str(minrel),' at x = ',num2str(xminr)]);


end