function [botwins, playerwins] = rps_compare(playerwins, botwins, userarray, botarray)
        tied='n';
        for n=1:3
            %if both have a 1 at that n value in their arrays, they tied
            if userarray(n)-botarray(n)==0&&userarray(n)~=0
                subplot(2,2,4);
                axis off;
                text(.5,.5,'You Tied');
                tied='y';
            end
        end
        
        %checking for winners by checking if the user has something that
        %beats the bot, and making sure the user did actually choose that
        if userarray(1)-botarray(3)==0&&userarray(1)~=0
            subplot(2,2,4);
            axis off;
            text(.5,.5,'You Won');
            playerwins=playerwins+1;
            
        elseif userarray(2)-botarray(1)==0&&userarray(2)~=0
            subplot(2,2,4);
            axis off;
            text(.5,.5,'You Won');
            playerwins=playerwins+1;
        elseif userarray(3)-botarray(2)==0&&userarray(3)~=0
            subplot(2,2,4);
            axis off;
            text(.5,.5,'You Won');
            playerwins=playerwins+1;
            %if player and bot didnt tie and player didnt win, they tied
        elseif tied~='y'
            subplot(2,2,4);
            axis off;
            text(.5,.5,'You Lost');
            botwins=botwins+1;
        end
end