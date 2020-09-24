%Created by Reagan Kennedy
%This script combines 2 raw .mat files from PIVlab export (top and bottom
%plank) and concatenates them from cell to matrix form for easy use in
%graphing scripts. 
clear all; close all; clc;

nameMAT = input('What would you like to name the combined MAT file?','s');
disp('Where should this combined MAT file be saved?')
saveDir = uigetdir();
nExp = input('How many experiments are you combining?');
scrdir{nExp} = '';

for i = 1:nExp
    scrdir{i} = cellstr(uigetdir());
    cd(char(scrdir{i}));
    alist = dir(fullfile(char(scrdir{i}),'*.mat'));
    nFiles = length(alist);
    A1 = load(alist(1).name);
    A2 = load(alist(2).name);
    %A3 = load(alist(3).name);
    %A4 = load(alist(4).name);
    
    %uData(:,:,:,i) = cat(3,cat(1,cat(3,A2.u_filtered{:}),cat(3,A1.u_filtered{:})),...
        %cat(1,cat(3,A4.u_filtered{:}),cat(3,A3.u_filtered{:})));
    %vData(:,:,:,i) = cat(3,cat(1,cat(3,A2.v_filtered{:}),cat(3,A1.v_filtered{:})),...
        %cat(1,cat(3,A4.v_filtered{:}),cat(3,A3.v_filtered{:})));
        
        uData(:,:,:,i) = cat(3,cat(3,A1.u_filtered{:}));
        vData(:,:,:,i) = cat(3,cat(3,A1.v_filtered{:}));
        velocitymagnitudeData(:,:,:,i) = cat(3,cat(3,A1.velocity_magnitude{:}));
    
    %clear A1 A2 A3 A4;
end

firstShearFrame = size(A1.u_filtered,1)+1;

cd(saveDir);
save(nameMAT,'uData','vData','firstShearFrame');
disp(strcat('File saved to:', saveDir, '/', nameMAT))



