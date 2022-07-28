%% Test 1

 %Source folder
  srcFiles =dir('D:\Turabieh\MatlabToolboxs\Hamza\CNN\CNN_Brain\Tumor_dataset\yes\*.jpg');% the folder in which ur images exists
  
 %Destination folder
  destFiles = 'D:\Turabieh\MatlabToolboxs\Hamza\CNN\CNN_Brain\Tumor_dataset\yes1\';
  
  mkdir(destFiles);

for k = 1 : length(srcFiles) 
filename = strcat('D:\Turabieh\MatlabToolboxs\Hamza\CNN\CNN_Brain\Tumor_dataset\yes\',srcFiles(k).name);

%Image reading
I = imread(filename);

%image resizing
I = imresize(I,[64,64]);
% I = imresize(I,0.50);%

% Saving the image
imwrite(I,[destFiles,num2str(k),'.jpg']);

end 
  