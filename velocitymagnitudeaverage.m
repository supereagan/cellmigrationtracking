sumvelocities = 0;
for i = 1:86
    sumvelocities = sumvelocities + mean(velocity_magnitude{i,1},'all');
end
sumvelocities/86