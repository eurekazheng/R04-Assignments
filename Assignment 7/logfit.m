function [xnew,ylog,coeffs,titlel]=logfit(x,y)
    % Function created by Kevin Pietz on 2.10.2018
    % Purpose is to find new variables for log log

    x2=0;
    y2=0;
    xnew=0;
    ynew=0;
    m=1;
    
    %----get rid of zeros
    for n=1:length(x)
        if y(n)>0 && x(n)>0
            y2(m)=y(n);
            x2(m)=x(n);
            m=m+1;
        end
    end
    %----
    
    ynew=log(y2);
    xnew=log(x2);
    coeffs=polyfit(xnew,ynew,1);
    ylog=polyval(coeffs,xnew);
    
    titlel='Log Fit';
end