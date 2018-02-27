function coinflip()
close all;
tails=imread('images/tails.jpg');
heads=imread('images/heads.jpg');

choice=menu('Flip a Coin?','Flip a Coin.','quit');
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
    
    choice=menu('Flip a Coin?','Flip a Coin.','quit');
end
close all;
end

