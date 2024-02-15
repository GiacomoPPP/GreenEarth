clc;
clear;

%% Gause type model with conversion rate, holling type 2
r = 3;
K = 1000;
a = 5;
b = 0.095;
conversionRate = 0.120;
d = 1.2;
maxTime = 500;

initialConditions = [10,1];

hollingType = @(x)HollingTypeTwo(x, a, b);

gauseHollingThreeFunction = @(t,y)Gause(t, y, r, K, d, conversionRate, hollingType);

[T,Y] = ode23(gauseHollingThreeFunction, [0, maxTime], initialConditions);

gauseHollingTwoPlot = plot(T, Y);

set(gauseHollingTwoPlot(1), 'Color', '#61b310', 'LineWidth', 2.5);
set(gauseHollingTwoPlot(2), 'Color', '#971899', 'LineWidth', 2.5);
%% HollingType 2 funcition plot

a = 5;
b = 0.095;

hollingTypeTwo = @(x) HollingTypeTwo(x, a, b);
hollingTypeTwoPlot = fplot(hollingTypeTwo, [0,100]);
h = yline(b.^-1, 'r-', 'LineWidth', 2);
ylim([0 11])
set(hollingTypeTwoPlot, 'LineWidth', 2.5);

%% HollingType 3 function plot
a = 2.3;
theta = 5;
nu = 220;
hollingTypeThree = @(x) HollingTypeThree(x, a, theta, nu);
hollingTypeThreePlot = fplot(hollingTypeThree, [-1,450]);
set(hollingTypeThreePlot, 'LineWidth', 2.5);
limit = a;
h = yline(limit, 'r-', 'LineWidth', 2);

%% Gause type model, holling type 3
r = 3;
K = 1000;
a = 5;
conversionRate = 0.25;
d = 1.2;
theta = 5;
nu = 220;
maxTime = 200;

initialConditions = [600,150];

hollingType = @(x) HollingTypeThree(x, a, theta, nu);

gauseHollingThreeFunction = @(t,y) Gause(t, y, r, K, d, conversionRate, hollingType);

[T,Y] = ode23(gauseHollingThreeFunction, [0, maxTime], initialConditions);

gauseHollingTwoPlot = plot(T, Y);

set(gauseHollingTwoPlot(1), 'Color', '#61b310', 'LineWidth', 2.5);
set(gauseHollingTwoPlot(2), 'Color', '#971899', 'LineWidth', 2.5);

%% HHP Model, holling type 3, limit cycle
r1 = 2;
K1 = 300;
r2 = 4;
K2 = 1000;
a1 = 2.4;
a2 = 2.4;
conversionRate1 = 0.15;
conversionRate2 = 0.8;
d = 1.7;
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

%% HHP Model, holling type 3, stable equilibrium

r1 = 2;
K1 = 500;
r2 = 4;
K2 = 500;
a1 = 2.4;
a2 = 2.4;
conversionRate1 = 0.15;
conversionRate2 = 0.8;
d = 1.7;
theta1 = 5;
theta2 = 5;
nu1 = 100;
nu2 = 100;
maxTime = 300;

hollingType1 = @(x) HollingTypeThree(x, a1, theta1, nu1);
hollingType2 = @(x) HollingTypeThree(x, a2, theta2, nu2);

initialConditions = [100, 500, 100];

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

%% HPP Model 

r = 4;
K = 1000;
a1 = 2.5;
a2 = 2.3;
conversionRate = 0.7;
d1 = 1.6;
d2 = 1.4;
theta = 5;
nu = 100;
maxTime = 500;

hollingType1 = @(x) HollingTypeThree(x, a1, theta, nu);
hollingType2 = @(x) HollingTypeThree(x, a2, theta, nu);


initialConditions = [500, 10, 10];

PlotHPPModel(r, K, conversionRate, d1, d2, hollingType1, hollingType2, initialConditions, maxTime);