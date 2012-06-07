% makes file for McIntosh's Batch PLS 
clear

% enter subjects to include in the PLS analysis
%subjArr=[16 18 20 23 31 35 43 52 56:58 61:62 64:69 71 72];

% settings!

prefix='odorscan';
brain_region=0.15;
%win_size
across_run=1; % 1 for merge data across all run, 0 for within

%open template for reading
fid = fopen('batch_demo_fmri_data1.txt');

% open outfile for writing
fidout = fopen('PLSfile.txt', 'w');

tline = fgets(fid);
while ischar(tline)
    disp(tline)
    
    if length(tline)>6 && strcmp(tline(1:6), 'prefix')
        fprintf(fidout, ['prefix		' prefix '\n']);
    elseif length(tline)>12 && strcmp(tline(1:12),'brain_region')
        fprintf(fidout, ['brain_region	' num2str(brain_region) '\n']);
        % elseif strcmp(tline(1:8), 'win_size')
    elseif length(tline)>10 && strcmp(tline(1:10), 'across_run')
        fprintf(fidout, ['across_run	' num2str(across_run) '\n']);
    else
        fprintf(fidout,[tline '\n']);
    end
    tline = fgets(fid);
    pause
end

fclose(fid);
fclose(fidout);