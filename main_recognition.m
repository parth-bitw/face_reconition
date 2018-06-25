%You can customize and fix initial directory paths
prompt=('Enter train image directory');
dlg_title='Input for directory';
num_lines= 1;
def = {'Drive:\\directory_location'};

TrainDatabasePath = inputdlg(prompt,dlg_title,num_lines,def);

prompt=('Enter train image directory');
dlg_title='Input for directory';
num_lines= 1;
def = {'Drive:\\directory_location'};

TestDatabasePath = inputdlg(prompt,dlg_title,num_lines,def);

% calling required functions
T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
% requesting for input 
prompt=('Enter test image name /number:');
dlg_title='Input of PCA-Based Face Recognition System';
num_lines= 1;
def = {'1'};
TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
im = imread(TestImage);
% calling recognition funciton 
[OutputName] = Recognition(TestImage, m, A, Eigenfaces);
if(OutputName == 0)
 disp('face not found')
else
SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);
imshow(im)
title('Test Image');
figure,imshow(SelectedImage);
title('Equivalent Image');
end
