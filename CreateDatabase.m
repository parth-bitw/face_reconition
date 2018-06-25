function T = CreateDatabase(TrainDatabasePath)
% creating 1D array from an 2d matrix 
TrainFiles = dir(TrainDatabasePath);
Train_Number = 0;
% traversing throughout the directory for finding total number of images
for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Number of all images in the training database
    end
end
T = [];
for i = 1 : Train_Number
    str = int2str(i);
    str = strcat('\',str,'.jpg');
    str = strcat(TrainDatabasePath,str);
%      reading from each face
    img = imread(str);
%     calculating row and column for eacuh image
    [irow icol] = size(img);
% Reshaping 2D images into 1D image vectors    
    temp = reshape(img',irow*icol,1);   
% 'T' grows after each turn                   
    T = [T temp]; 
end