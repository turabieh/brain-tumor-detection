clc;
clear all;
close all;
global imdsTrain imdsValidation;
global hist Ypred_Train Yvalid_Train Ypred_Test Yvalid_Test;

rng(0); % control random values generation
set(0,'defaultTextInterpreter','latex');             %trying to set the default
extraInputs = {'interpreter','latex','fontsize',11}; % name, value pairs
%%
%====================================================
% creating images dataset with associated labels from folder names
imds = imageDatastore(fullfile('data'),'IncludeSubfolders',true,...
     'FileExtensions','.jpg','LabelSource','foldernames');
%%
%====================================================
% Count number of images per label and save the number of classes
labelCount = countEachLabel(imds)
numClasses = height(labelCount)
%%
%====================================================
% create training and validation set by splitting imds
% it is inactive till fill all data points
%====================================================
numTrainFiles = 0.70;
[imdsTrain, imdsValidation] =splitEachLabel(imds,numTrainFiles,'randomize');
%====================================================
%% We save the original data to avoid lost after augmentation
%====================================================
%%
imdsTrain_Train=imdsTrain;
imdsValidation_Validation=imdsValidation;
%%
%====================================================
% You must specify the size of the images in the input layer of the network. 
% Check the size of the first image in digitData. Each image is 
% 64x64x3 pixels.
%====================================================
%%
img       = readimage(imds,1);
inputSize = size(img);
%====================================================
%% Specify Training and Validation Sets
% Divide the data into training and validation data sets, so that each category 
% in the training set contains 750 images, and the validation set contains the 
% remaining images from each label. |splitEachLabel| splits the datastore |digitData| 
% into two new datastores, |trainDigitData| and |valDigitData|.
%%
%====================================================
numTrainFiles = 0.70;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');
%====================================================
%% Define Network Architecture
% Define the convolutional neural network architecture.
%====================================================
    layers = [ 
    imageInputLayer(inputSize,'Name','input')
    
    convolution2dLayer(3,8,'Padding','same','Name','Conv_1')
    batchNormalizationLayer('Name','BN_1')
    reluLayer('Name','relu_1')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPoll_1')
    
    convolution2dLayer(3,16,'Padding','same','Name','Conv_2')
    batchNormalizationLayer('Name','BN_2')
    reluLayer('Name','relu_2')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPoll_2')
    
    convolution2dLayer(3,32,'Padding','same','Name','Conv_3')
    batchNormalizationLayer('Name','BN_3')
    reluLayer('Name','relu_3')
    
    fullyConnectedLayer(numClasses,'Name','Fully')
    softmaxLayer('Name','SoftMax')
    classificationLayer('Name', 'classoutput')];

lgraph = layerGraph(layers);
plot(lgraph);
%====================================================
%%
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',10, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',1, ...
    'Verbose',false, ...
    'Plots','training-progress');
%====================================================
% network training gives back the network and training histor
%====================================================
[net1, hist] = trainNetwork(imdsTrain, layers, options);
%====================================================
CNNClassifyResults(net1);
%====================================================
%====================================================
%====================================================
%====================================================
%====================================================
