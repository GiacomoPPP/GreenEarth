function HHPPlot = PlotHHPModel(r1, K1, r2, K2, conversionRate1, conversionRate2, d, hollingType1, hollingType2, initialConditions, maxTime) 

    HHPModelFunction = @(t,y) HHPModel(t, y, r1, K1, r2, K2, d, conversionRate1, conversionRate2, hollingType1, hollingType2);
    
    [T,Y] = ode23(HHPModelFunction, [0, maxTime], initialConditions);
    
    HHPPlot = plot(T, Y);
    
    set(HHPPlot(1), 'Color', '#971899', 'LineWidth', 2.5);
    set(HHPPlot(2), 'Color', '#61b310', 'LineWidth', 2.5);
    set(HHPPlot(3), 'Color', 'red', 'LineWidth', 2.5);
    
    legend('H1','H2','P'); grid on;
 
end