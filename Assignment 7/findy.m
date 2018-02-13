function findy(x,y)
    % Function created by Kevin Pietz and Eureka Zheng on 2.11.2018
    % Purpose to find y values for corresponding x values
    
    again='y';
    while again=='y'
    x_est=input('Enter the x value for the y value you want to find: ');
    
    interptype=menu('Choose the interpolation type: ','linear','polynomial','spline','inperpolation(linear)','interpolation(cubic)','interpolation(spline)');
    
    switch interptype
        case 1   % Linear find
            [u,v,coeffs]=linearfit(x,y);
            y_est=coeffs(1)*x_est+coeffs(2);
            
        case 2   % Polynomial find
            [u,v,coeffs]=PolynomialFit(x,y);
            eqn=0;
            degree=length(coeffs)-1;
            for n=1:degree
             eqn=(coeffs(degree+1-n)).*x_est.^(n)+eqn;
            end
            eqn=eqn+coeffs(degree+1);
            y_est=eqn;
            
        case 3   % Spline find
            coeffs=spline(x,y);
            y_est=ppval(coeffs,x_est);
            
        case 4   % interp(lin) find
            y_est=interp1(x,y,x_est);
        case 5   % interp(cubic) find
            y_est=interp1(x,y,x_est,'pchip');
        case 6   % interp(spline) find
            y_est=interp1(x,y,x_est,'spline');
    end
    
    disp(['The x value, ',num2str(x_est),', corresponds to the y value, ',num2str(y_est)]);
    again = CheckAgain('Do you want to find another y value? (y/n): ');
    end
end