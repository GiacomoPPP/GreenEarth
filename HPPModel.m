function ds = HPPModel(~, y, r,K, d1, d2, conversionRate1, holling1, holling2)
    H = y(1);
    P1 = y(2);
    P2 = y(3);
    dH = r*H.*(1-H/K)-holling1(H).*P1 - holling2(H).*P2;
    dP1 = conversionRate1.*holling1(H).*P1 - d1*P1;
    dP2 = conversionRate1.*holling2(H).*P2 - d2*P2;
    ds = [dH;dP1;dP2];
end