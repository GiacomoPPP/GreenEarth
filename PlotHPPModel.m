function HPPPlot = PlotHPPModel(r, K, conversionRate, d1, d2, hollingType1, hollingType2, initialConditions, maxTime) 

    HPPModelFunction = @(t,y) HPPModel(t, y, r, K, d1, d2, conversionRate, hollingType1, hollingType2);
    
    [T,Y] = ode23(HPPModelFunction, [0, maxTime], initialConditions);
    
    HPPPlot = plot(T, Y);
    
    set(HPPPlot(1), 'Color', '#971899', 'LineWidth', 2.5);
    set(HPPPlot(2), 'Color', '#61b310', 'LineWidth', 2.5);
    set(HPPPlot(3), 'Color', 'red', 'LineWidth', 2.5);
    
    legend('H','P1','P2'); grid on;
 
end