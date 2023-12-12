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

conversionRatePlot = plot(T, Y);

%% Gause type model with conversion rate, holling type 3
r = 3;
K = 1000;
a = 5;
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

%% HHP Model, holling type 3, two healthy plants
r1 = 2;
K1 = 300;
r2 = 4;
K2 = 1000;
a1 = 2.3;
a2 = 2.3;
conversionRate1 = 0.15;
conversionRate2 = 0.7;
d = 1.9;
theta1 = 5;
theta2 = 5;
nu1 = 100;
nu2 = 100;
maxTime = 300;

hollingType1 = @(x) HollingTypeThree(x, a1, theta1, nu1);
hollingType2 = @(x) HollingTypeThree(x, a2, theta2, nu2);

initialConditions = [1, 500, 100];

PlotHHPModel( ...
        r1, ...
        K1, ...
        r2, ...
        K2, ...
        conversionRate1, ...
        conversionRate2, ...
        d, ...
        hollingType1, ...
        hollingType2, ...
        initialConditions, ...
        maxTime ...
    );

%% HHP Model 

r1 = 2;
K1 = 300;
r2 = 4;
K2 = 1000;
a1 = 2.3;
a2 = 2.3;
conversionRate1 = 0.15;
conversionRate2 = 0.7;
d = 1.9;
theta1 = 5;
theta2 = 5;
nu1 = 100;
nu2 = 100;
maxTime = 300;

hollingType1 = @(x) HollingTypeThree(x, a1, theta1, nu1);
hollingType2 = @(x) HollingTypeThree(x, a2, theta2, nu2);

initialConditions = [1, 500, 100];

PlotHHPModel(r1, K1, r2, K2, conversionRate1, conversionRate2, d, hollingType1, hollingType2, initialConditions, maxTime);



