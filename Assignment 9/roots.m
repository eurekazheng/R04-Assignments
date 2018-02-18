function roots(funf)
again=1;
while again==1
    xguess=input('Type an estimate for the x-location of the root you want to find: ');
    xroot=fzero(funf,xguess);
    disp(['A zero is at location ',num2str(xroot)]);
    again=menu('Would you like to find a root again?','yes','no');
end
end