%Created by Reagan Kennedy
%The following script was written to graph the averages in x displacement
%of the 1D cell line experiment but in 4 equal columns to see different
%effects of mechanical cues on different groups of cells. It works the same
%as the total average for the 1D experiment but in the 4 loop there are now
%4 different categories and vectors.
xaxis = (0:((430/60)/86):(430/60));

xvalues_1 = zeros(1,87);
xvalues_2 = zeros(1,87);
xvalues_3 = zeros(1,87);
xvalues_4 = zeros(1,87);

xvalues_1(1) = 0;
xvalues_2(1) = 0;
xvalues_3(1) = 0;
xvalues_4(1) = 0;


for i = 1:86
    xvalues_1(i+1)= xvalues_1(i) + 0.55*((mean(uData(1,1:16,i)) + mean(uData(2,1:16,i))...
        + mean(uData(3,1:16,i)) + mean(uData(4,1:16,i)))/4);
    xvalues_2(i+1)= xvalues_2(i) + 0.55*((mean(uData(1,17:32,i)) + mean(uData(2,17:32,i))...
        + mean(uData(3,17:32,i)) + mean(uData(4,17:32,i)))/4);
    xvalues_3(i+1)= xvalues_3(i) + 0.55*((mean(uData(1,33:48,i)) + mean(uData(2,33:48,i))...
        + mean(uData(3,33:48,i)) + mean(uData(4,33:48,i)))/4);
    xvalues_4(i+1)= xvalues_4(i) + 0.55*((mean(uData(1,49:64,i)) + mean(uData(2,49:64,i))...
        + mean(uData(3,17:32,i)) + mean(uData(4,49:64,i)))/4);
end

clf
a = 0;
plot (xaxis, xvalues_1, 'LineWidth', 2)
hold on
plot (xaxis, xvalues_2, 'LineWidth', 2)
plot (xaxis, xvalues_3, 'LineWidth', 2)
plot (xaxis, xvalues_4, 'LineWidth', 2)

xlabel("Time(h)", 'fontweight', 'bold', 'fontsize', 16)
ylabel("Cell Displacement in um", 'fontweight', 'bold', 'fontsize', 16)
%legend('26.79um','62.50um','98.21um','133.93um','169.69um','205.36um','241.07um')
%xline(0,'--')
xlim([0,(430/60)])
set(gca, 'linewidth', 2)
title('Movement in x', 'fontsize',16)
%yticks([0])
%yticklabels({'27', '63', '98', '134', '170', '205', '241'})
set(gca,'fontweight','bold')