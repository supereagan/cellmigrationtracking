%Created by Reagan Kennedy
%The following script was written to graph the averages in x displacement
%of the 1D cell line experiment but in 4 equal columns to see different
%effects of mechanical cues on different groups of cells. It works the same
%as the total average for the 1D experiment but in the 4 loop there are now
%4 different categories and vectors.
xaxis = (0:((400/60)/79):(400/60)); %this creates a vector that spans the time intervals
%that is the same number of values compared to the xvalues vectors which
%are the plotted lines. the 400 is the amount of total minutes used (79+1
%(first frame is zero) frames * 5 minutes in this case) and the /60 is 
%used to convert this value
%to hours. The /79 is used to make the middle value the right interval to
%span 80 iterations


%These xvalues represent vectors that will be plotted and become lines
%themselves. They are initialized using the "zeros" command to create
%vectors full of zeros that will later be filled. They must be the same
%length as the xaxis in order to be plotted! 
xvalues_1 = zeros(1,80);
xvalues_2 = zeros(1,80);
xvalues_3 = zeros(1,80);
xvalues_4 = zeros(1,80);
xvalues_4 = zeros(1,80);

%The first displacement value is zero, the next 79 represent the
%displacement values calculated by PIVlab
xvalues_1(1) = 0;
xvalues_2(1) = 0;
xvalues_3(1) = 0;
xvalues_4(1) = 0;


%This for loop sort through the data that you have and assigns values to
%the xvalues vectors that will be plotted (in this case, x displacement)
for i = 1:86 %iterates through number of data values
    xvalues_1(i+1)= xvalues_1(i) + 0.55*((mean(uData(1,1:16,i)) + mean(uData(2,1:16,i))...
        + mean(uData(3,1:16,i)) + mean(uData(4,1:16,i)))/4);
    %assigns next space in the vector with the previous plus the average of
    %the pixel-micron conversion (.55) and the average of uData indeces (x
    %displacement values) with the format uData(row, column, frame). These
    %are all averaged and this is repeated for every xvalue "line" that
    %will be plotted. 
    xvalues_2(i+1)= xvalues_2(i) + 0.55*((mean(uData(1,17:32,i)) + mean(uData(2,17:32,i))...
        + mean(uData(3,17:32,i)) + mean(uData(4,17:32,i)))/4);
    xvalues_3(i+1)= xvalues_3(i) + 0.55*((mean(uData(1,33:48,i)) + mean(uData(2,33:48,i))...
        + mean(uData(3,33:48,i)) + mean(uData(4,33:48,i)))/4);
    xvalues_4(i+1)= xvalues_4(i) + 0.55*((mean(uData(1,49:64,i)) + mean(uData(2,49:64,i))...
        + mean(uData(3,17:32,i)) + mean(uData(4,49:64,i)))/4);
end

%these are all graphing commands that don't need to be changed unless you
%are adding a new xvalue, in that case just copy and paste a new one
clf
a = 0;
plot (xaxis, xvalues_1, 'LineWidth', 2)
hold on
plot (xaxis, xvalues_2, 'LineWidth', 2)
plot (xaxis, xvalues_3, 'LineWidth', 2)
plot (xaxis, xvalues_4, 'LineWidth', 2)


%These are just labels, you can change accordingly
xlabel("Time(h)", 'fontweight', 'bold', 'fontsize', 16)
ylabel("Cell Displacement in um", 'fontweight', 'bold', 'fontsize', 16)

%These are the ranges of the x and y axis, you likely will need to change
%them if you are using longer intervals. the xlim you can do by dividing
%total minutes/60 and for the ylim graph it first and guesstimate what y
%range will encapsulate most of your values
xlim([0,(430/60)])
ylim([-75,30])
set(gca, 'linewidth', 2)
title('Cell Pulling Experiment 2', 'fontsize',16)

set(gca,'fontweight','bold')