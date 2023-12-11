clc;
clear;

%% Gause type model with conversion rate, holling type 2
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

[T,Y] = ode23(conversionRateFunction, [0, maxTime], initialConditions);

plot(T, Y);

%% Gause type model with conversion rate, holling type 3
r = 3;
K = 1000;
a = 5;
b = 2;
conversionRate = 0.25;
d = 1.2;
theta = 5;
nu = 100;
maxTime = 1000;

initialConditions = [10,1];

hollingType = @(x) HollingTypeThree(x, a, theta, nu);

conversionRateFunction = @(t,y) ConversionRate(t, y, r, K, d, conversionRate, hollingType);

[T,Y] = ode23(conversionRateFunction, [0, maxTime], initialConditions);

plot(T, Y);

