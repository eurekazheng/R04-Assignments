function maxoffunf(funf)
notfunf=@(x)-funf(x);

xmin=input('Enter the left side of the range in which you want to find the maximum value: ');
xmax=input('Enter the right side of the range in which you want to find the maximum value: ');

if xmin>xmax
    tempxmin=xmax;
    xmax=xmin;
    xmin=tempxmin;
end

maximumx=fminbnd(notfunf,xmin,xmax);
maximumy=funf(maximumx);
disp(['The location of your maximum is ',num2str(maximumx),',',num2str(maximumy)]);
end