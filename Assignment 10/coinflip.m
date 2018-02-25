function coinflip()
clear all;
clc;
tails=imread('images/quarter tails.jpg');
heads=imread('images/quarter heads.jpg');

choice=menu('Would you like to flip a coin?','flip','quit');
while choice==1
    
    num=rand(1);
    
    for i=1:8
        imshow(tails);
        pause(.005);
        imshow(heads);
        pause(.005);
        
        if i==8
            for m=1:5
                imshow(tails);
                pause(.05);
                imshow(heads);
                pause(.05);
            end
        end
    end
    
    
    if num>.5
        imshow(tails);
    else
        imshow(heads);
    end
    
    choice=menu('Would you like to flip again?','flip','quit');
end
end

