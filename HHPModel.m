function ds = HHPModel(~, initialConditions, r1, K1, r2, K2, d, conversionRate1, conversionRate2, holling)

    H1 = initialConditions(1);
    H2 = initialConditions(2);
    P = initialConditions(3);
    dH1 = r1*H1.*(1-H1/K1)-holling(H1).*P;
    dH2 = r2*H2.*(1-H2/K2)-holling(H2).*P;
    dP = conversionRate1.*holling(H1).*P + conversionRate2.*holling(H2).*P -d*P;
    ds = [dH1;dH2;dP];
end