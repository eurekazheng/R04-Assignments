function botchoice = rps_generate_bot()      
    botchoice=randi(3);
    switch botchoice
        case 1
            botimage=imread('images/rock.jpg');
        case 2
            botimage=imread('images/paper.jpg');
        case 3
            botimage=imread('images/scissors.jpg');
    end
    subplot(2,2,2);
    imshow(botimage);
    axis off;
    text(0,0,'Bot''''s Choice: ');
end