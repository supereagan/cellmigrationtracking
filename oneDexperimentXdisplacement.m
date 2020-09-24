%This script is used for the graphing of the average x displacement for the
%single line cell shearing experiment.
xaxis = (0:((430/60)/86):(430/60)); %initializes x axis with proper scale
xvalues_1 = zeros(1,87);
xvalues_1(1) = 0;

for i = 1:86 %this for loop averages the displacement vectors in its matrix
    xvalues_1(i+1)= xvalues_1(i) + 0.55*((mean(uData(1,:,i)) + mean(uData(2,:,i))...
        + mean(uData(3,:,i)) + mean(uData(4,:,i)))/4);
end

clf
a = 0;
plot (xaxis, xvalues_1, 'LineWidth', 2)
hold on
%plot specifications
xlabel("Time(h)", 'fontweight', 'bold', 'fontsize', 16)
ylabel("Cell Displacement in um", 'fontweight', 'bold', 'fontsize', 16)
xlim([0,(430/60)])
set(gca, 'linewidth', 2)
title('Movement in x', 'fontsize',16)
set(gca,'fontweight','bold')