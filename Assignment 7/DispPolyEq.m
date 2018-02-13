%created by Evan White on 2/11/2018 to display polynomial equation in
%command window

function DispPolyEq(coeffs)

degree=length(coeffs)-1;

outputtext=' ';
for n=1:degree
    outputtext=strcat(num2str(coeffs(degree+1-n)),'x^',num2str(n),' + ',outputtext);
end
outputtext=strcat('y = ',outputtext,num2str(coeffs(degree+1)));
disp(['The Equation is: ',outputtext]);


    
end