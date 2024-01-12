function ds = ConversionRate(~, initialConditions, r, K, d, conversionRate, holling)
    % Initial conditions
    X = initialConditions(1);
    Y = initialConditions(2);
    % Equations
    dX = r*X.*(1-X/K)-holling(X).*Y;
    dY = conversionRate.*holling(X).*Y-d*Y;
    ds = [dX;dY];
end