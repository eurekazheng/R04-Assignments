function mfileplot(uinput)

xmin=input('Choose your min x value: ');
xmax=input('Choose your max x value: ');

while xmax<xmin
    xmax=input('Error! Choose a max x value greater than your min x: ','s');
end

x=linspace(xmin,xmax,1000);

for n=1:1000
    y(n)=uinput(x(n));
end

plot(x,y,'k-');
hold on;
plot(x,zeros(1,length(x)));
xlabel('X axis');
ylabel('Y axis');
title('Your Function');

end

