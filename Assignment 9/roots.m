function roots(funf)
again='y';
while again=='y'
    xguess=input('Type an estimate for the x-location of the root you want to find: ');
    xroot=fzero(funf,xguess);
    disp(['A zero is at location ',num2str(xroot)]);
    again=menu('Would you like to run again?','y','n');
end
end