%Created by Evan White
%Created on 2/7/2018
%Purpose: Visualize Projectile Motion given user inputted velocity

clear;
clc;

v=input('Please Input a Velocity: ');
while v<=0
    v=input('Error! Please Input a Positive Velocity: ');
end

g=9.81;
figure;
mtime=(2*v)/g;
axis([0 (v*mtime)/2 0 v*(mtime/2)-((1/2)*g*(mtime/2)^2)]);
xlabel('Range');
ylabel('Height');
title('Projectile Motion at Various Angles');
hold on;
tic
for theta=0:5:90
    v_x=v*cosd(theta);
    v_yi=v*sind(theta);
    ftime=2*v_yi/g;
    for t=0:ftime/100:ftime
        x=v_x*t;
        y=v_yi*t-g*t^2*(1/2);
        plot(x,y,'.');
        pause(.00125);
    end
    pause(1);
end
toc