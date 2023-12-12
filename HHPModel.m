function ds = HHPModel(~, y, r1, K1, r2, K2, d, conversionRate1, conversionRate2, holling1, holling2)
    H1 = y(1);
    H2 = y(2);
    P = y(3);
    dH1 = r1*H1.*(1-H1/K1)-holling1(H1).*P;
    dH2 = r2*H2.*(1-H2/K2)-holling2(H2).*P;
    dP = conversionRate1.*holling1(H1).*P + conversionRate2.*holling2(H2).*P -d*P;
    ds = [dH1;dH2;dP];
end