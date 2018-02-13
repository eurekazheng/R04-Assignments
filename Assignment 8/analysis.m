%this one gets mean and standard deviation
function [m,sd,mr,sdr]=analysis(userdata)

m=mean(mean(userdata));

row=input('Which Row of your Data do you want to analyze: ');
s=size(userdata);
a=userdata(1,:);
for n=1:s
    a=[a,userdata(n,:)];
end
sd=std(a);
while row>s(1)
    row=input('Error! Which Row of your Data do you want to analyze: ');
end
userdatarow=userdata(row,:);
mr=mean(userdatarow);
sdr=std(userdatarow);

end
