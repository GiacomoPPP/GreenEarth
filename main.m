clc;
clear;

%% Rosenweiz-Mc Arthur model
r = 3;
K = 1000;
a = 5;
b = 2;
conversionRate = 0.25;
d = 1.2;
maxTime = 700;

initialConditions = [10,1];

hollingType = @(x) HollingTypeTwo(x, a, b);

conversionRateFunction = @(t,y) ConversionRate(t, y, r, K, d, conversionRate, hollingType);

options = odeset('Mass',conversionRateFunction,'RelTol',1e-4,'AbsTol',1e-6);

[T,Y] = ode23(conversionRateFunction, [0, maxTime], initialConditions);

plot(T, Y);

%% Gause type 3 TODO
r = 3;
K = 1000;
a1 = 5;
b1 = 2;
c1 = 0.25;
d = 1.2;
theta = 5;
maxTime = 1000;

