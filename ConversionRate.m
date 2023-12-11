function ds = ConversionRate(~, initialConditions, r, K, d, conversionRate, holling)

    X = initialConditions(1);
    Y = initialConditions(2);
    dX = r*X.*(1-X/K)-holling(X).*Y;
    dY = conversionRate.*holling(X).*Y-d*Y;
    ds = [dX;dY];
end