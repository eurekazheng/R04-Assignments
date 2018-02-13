function addequation(coeffs,plottype)
    % Function created by Kevin Pietz on 2.10.2018
    % Purpose to add equation to graph
    
    if plottype==1
        eqn=strcat(['y =',' ',num2str(coeffs(1)),'x +',' ',num2str(coeffs(2))]);
        gtext(eqn)
    elseif plottype==4
        eqn=strcat(['y =',' ',num2str(coeffs(1)),'e^{','-',num2str(coeffs(2)),'x','}']);
        gtext(eqn)
    elseif plottype==5
        eqn=strcat(['y =',' ',num2str(coeffs(1)),'x^{',num2str(coeffs(2)),'}']);
        gtext(eqn)
    end
    
    
end