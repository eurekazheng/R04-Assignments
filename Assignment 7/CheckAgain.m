%created by Evan White on 2/11/2018 to check if user wants to use a new
%dataset

function [again]=CheckAgain(msg)

again=input(msg,'s');
while strcmpi(again,'y')==0&&strcmpi(again,'n')==0&&strcmpi(again,'yes')==0&&strcmpi(again,'no')==0
    again=input(['Error! ', msg],'s');
end
if strcmpi(again,'y')==1
elseif strcmpi(again,'yes')==1
    again='y';
elseif strcmpi(again,'n')==1
    disp('Goodbye!');
elseif strcmpi(again,'no')==1
    again='n';
    disp('Goodbye!');
end

end