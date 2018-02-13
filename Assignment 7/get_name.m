function filename=get_name

filename=input('Please enter the name of your datafile: ','s');
while exist(filename,'file')==0
    filename=input('Error! Please enter the name of your datafile: ','s');
end

end