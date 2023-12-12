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

%% HHP Model, holling type 3
r1 = 2;
K1 = 200;
r2 = 4;
K2 = 1000;
a = 2.3;
b = 2;
conversionRate1 = 0.15;
conversionRate2 = 0.7;
d = 1.9;
theta = 5;
nu = 100;
maxTime = 300;

hollingType = @(x) HollingTypeThree(x, a, theta, nu);

initialConditions = [1, 500, 10];

HHPModelFunction = @(t,y) HHPModel(theta, y, r1, K1, r2, K2, d, conversionRate1, conversionRate2, hollingType);

[T,Y] = ode23(HHPModelFunction, [0, maxTime], initialConditions);

HHPPlot = plot(T, Y);

set(HHPPlot(1), 'Color', '#971899', 'LineWidth', 2.5);
set(HHPPlot(2), 'Color', '#61b310', 'LineWidth', 2.5);
set(HHPPlot(3), 'Color', 'red', 'LineWidth', 2.5);

legend('H1','H2','P'); grid on;
