% You are free to use, change, or redistribute this code in any way you
% want for non-commercial purposes. However, it is appreciated if you 
% maintain the name of the original author.
%
% (C) Luis Gonzalo Sanchez Giraldo, 2014

clear all
close all
clc

% Modify this path to the actual location of your data folder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_path = './data';  %% Your path to data goes here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath(data_path);


% run these blocks 10 times for k fold
% generate sampled train and provide remaining unsample test data

%% IRIS dataset
load irisData
load irisdata_gram.mat
N = size(X,1);
X = bsxfun(@minus, X, mean(X,1));
stdX = std(X);
X = bsxfun(@rdivide, X, stdX);
X(:,stdX == 0) = 0;

sampleAndClassify;

save results_irisData acc;
clear all
clc



%% Ionosphere dataset
load ionosphereData
load ionospheredata_gram.mat
N = size(X,1);
X = bsxfun(@minus, X, mean(X,1));
stdX = std(X);
X = bsxfun(@rdivide, X, stdX);
X(:,stdX == 0) = 0;

sampleAndClassify;

save results_ionosphereData acc;
clear all
clc



%% Balance Scale dataset
load balanceData
load balancedata_gram.mat
N = size(X,1);
X = bsxfun(@minus, X, mean(X,1));
stdX = std(X);
X = bsxfun(@rdivide, X, stdX);
X(:,stdX == 0) = 0;

sampleAndClassify;

save results_balanceData acc;
clear all
clc



%% Wine Data
load wineData;
load winedata_gram.mat
N = size(X,1);
X = bsxfun(@minus, X, mean(X,1));
stdX = std(X);
X = bsxfun(@rdivide, X, stdX);
X(:,stdX == 0) = 0;

sampleAndClassify;

save results_wineData acc;
clear all
clc

%% Generate Plots
tables_UCI;






