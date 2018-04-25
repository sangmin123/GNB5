
function dydt = odemodel(t, y, conc, param)
   
    EGFRtot = conc(1);
    KRAStot = conc(2);
    MEKtot = conc(3);
    ERKtot = conc(4);
    PI3Ktot = conc(5);
    AKTtot = conc(6);
    EGF = conc(7);
    CTX = conc(8);
    GNB5 = conc(9);
    
    EGFRa = y(1);
    KRASa = y(2);
    MEKa = y(3);
    ERKa = y(4);
    PI3Ka = y(5);
    AKTa = y(6);
    
    EGFRi = EGFRtot - EGFRa;
    KRASi = KRAStot - KRASa;
    MEKi = MEKtot - MEKa;
    ERKi = ERKtot - ERKa;
    PI3Ki = PI3Ktot - PI3Ka;
    AKTi = AKTtot - AKTa;
    
    k1 = param(1);
    Km1 = param(2);
    Ki1 = param(3);
    kd1 = param(4);
    
    k2a = param(5);
    k2b = param(6);
    Km2 = param(7);
    kd2 = param(8);
    
    k3a = param(9);
    k3b = param(10);
    Km3 = param(11);
    kd3 = param(12);
    
    k4 = param(13);
    Km4 = param(14);
    kd4 = param(15);
    
    k5a = param(16);
    k5b = param(17);
    k5c = param(18);
    Km5 = param(19);
    Ki5 = param(20);
    kd5 = param(21);
    
    k6 = param(22);
    Km6 = param(23);
    kd6 = param(24);
     
    dydt = zeros(6, 1);
    
    % EGFRa
    dydt(1) = k1*EGF*(EGFRi/Km1)/(1 + EGFRi/Km1 + CTX/Ki1) - kd1*EGFRa;
    
    % KRASa
    dydt(2) = (k2a*EGFRa + k2b*GNB5)*KRASi/(Km2 + KRASi) - kd2*KRASa;
    
    % MEKa
    dydt(3) = (k3a*EGFRa + k3b*KRASa)*MEKi/(Km3 + MEKi) - kd3*MEKa;
    
    % ERKa
    dydt(4) = k4*MEKa*ERKi/(Km4 + ERKi) - kd4*ERKa;
    
    % PI3Ka
    dydt(5) = (k5a*KRASa + k5b*GNB5)*PI3Ki/(Km5 + PI3Ki)*(1/(Ki5^3 + k5c*ERKa^3)) ...
              - kd5*PI3Ka;
    
    % AKTa
    dydt(6) = k6*PI3Ka*AKTi/(Km6 + AKTi) - kd6*AKTa;
    
  
end
