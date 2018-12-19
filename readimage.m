
clc
clear
close all
%% Loading Spools
spool_folder = 'Spool_U_No_BG/COLOR/'; %  
spool_names = dir(fullfile(spool_folder, '*.png'));  
spool_count = numel(spool_names);    
%% Loading Maskes
mask_folder = 'Spool_U_No_BG/MASK/'; %  
mask_names = dir(fullfile(mask_folder, '*.jpg'));  
mask_count = numel(mask_names);

%% Loading Background
bg_folder = 'D:\Work\workspace\Spuols Classifier\Backgrounds\'; %  
bg_names = dir(fullfile(bg_folder, '*.jpg'));  
bg_count = numel(bg_names);


 %% Ouput Directory for saving files
 out_folder='D:\Work\workspace\Matlab\Spools\SPOOL_U_OUTPUT\';
 
 for n = 1:spool_count
    spool_name= fullfile(spool_folder, spool_names(n).name);         
%     spool = imread(full_name);
    [spool, map, alpha] = imread(spool_name);
    mask_name= fullfile(mask_folder, mask_names(n).name);         
    mask = imread(mask_name);
%     temp = ;
    bg_name = fullfile(bg_folder, bg_names(randi([1 bg_count])).name);
    bg = imread(bg_name);
    output = bgchange(bg,spool,alpha);
%     figure, imshow(output)
    imwrite(output, fullfile(out_folder, ['SPOOL_U_', num2str(n), '.png']));
    
    
%     figure (n)                          
%     imshow(our_images)                  
 end
 
