%Made by Reagan Kennedy
%This script takes experimental data exported from PIVlab and concatenated
%using combvinePIVfiles.m then graphs them to show displacement kymographs
%in the y axis. 7 total lines are created for the different layers in the
%shearing planks.
y1 = 26.79;
y2 = 62.50;
y3 = 98.21;
y4 = 133.93;
y5 = 169.69;
y6 = 205.36;
y7 = 241.07;
xaxis = (-1:0.0662251656:19);

yvalues_1 = zeros(1,303);
yvalues_2 = zeros(1,303);
yvalues_3 = zeros(1,303);
yvalues_4 = zeros(1,303);
yvalues_5 = zeros(1,303);
yvalues_6 = zeros(1,303);
yvalues_7 = zeros(1,303);
yvalues_1(1) = y1;
yvalues_2(1) = y2;
yvalues_3(1) = y3;
yvalues_4(1) = y4;
yvalues_5(1) = y5;
yvalues_6(1) = y6;
yvalues_7(1) = y7;

for i = 2:303
    yvalues_1(i)= yvalues_1(i-1) + 0.67*((mean(vData(1,:,i)) + mean(vData(2,:,i)))/2);
    yvalues_2(i)= yvalues_2(i-1) + 0.67*((mean(vData(3,:,i)) + mean(vData(4,:,i)))/2);
    yvalues_3(i)= yvalues_3(i-1) + 0.67*((mean(vData(5,:,i)) + mean(vData(6,:,i)))/2);
    yvalues_4(i)= yvalues_4(i-1) + 0.67*((mean(vData(7,:,i)) + mean(vData(8,:,i)))/2);
    yvalues_5(i)= yvalues_5(i-1) + 0.67*((mean(vData(9,:,i)) + mean(vData(10,:,i)))/2);
    yvalues_6(i)= yvalues_6(i-1) + 0.67*((mean(vData(11,:,i)) + mean(vData(12,:,i)))/2);
    yvalues_7(i)= yvalues_7(i-1) + 0.67*((mean(vData(13,:,i)) + mean(vData(14,:,i)))/2);
end
yvalues_1(14) = [];
yvalues_2(14) = [];
yvalues_3(14) = [];
yvalues_4(14) = [];
yvalues_5(14) = [];
yvalues_6(14) = [];
yvalues_7(14) = [];
clf
a = 0;
plot (xaxis, yvalues_1, 'LineWidth', 2)
hold on
plot (xaxis, yvalues_2, 'LineWidth', 2)
hold on
plot (xaxis, yvalues_3, 'LineWidth', 2)
hold on
plot (xaxis, yvalues_4, 'LineWidth', 2)
hold on
plot (xaxis, yvalues_5, 'LineWidth', 2)
hold on
plot (xaxis, yvalues_6, 'LineWidth', 2)
plot (xaxis, yvalues_7, 'LineWidth', 2)
xlabel("Time(h)", 'fontweight', 'bold', 'fontsize', 16)
ylabel("Cell Displacement in um (y)", 'fontweight', 'bold', 'fontsize', 16)
%legend('26.79um','62.50um','98.21um','133.93um','169.69um','205.36um','241.07um')
xline(0,'--')
xlim([-1,19])
set(gca, 'linewidth', 2)
title('Movement in y', 'fontsize',16)
yticks([26.79 62.50 98.21 133.93 169.69 205.36 241.07])
yticklabels({'27', '63', '98', '134', '170', '205', '241'})
set(gca,'fontweight','bold')