%% Handwritten digits recognition
% description here

% initialization
clear; close all; clc;

[X_train, y_train, X_cv, y_cv, X_test, y_test] = loadDataset();

num_labels = 10;

X_train = featureNormalization(X_train, 255.0);
X_cv = featureNormalization(X_cv, 255.0);
X_test = featureNormalization(X_test, 255.0);

X_view = X_test;
[X_train, U] = PCA(X_train', 0, 50); 
X_cv = X_cv*U;
X_test = X_test*U;

X_train = mapFeature(X_train, 2);
X_cv = mapFeature(X_cv, 2); 
X_test = mapFeature(X_test, 2);


%% optimizing lambda value and training the model

%[lambda, cost] = computeLambda(X_train, y_train, X_cv, y_cv, num_labels);
%fprintf('\nOptimal lambda value = %f\tcost = %f\n', lambda, cost);
%save('lambda', 'lambda'); save('cost', 'cost');
%load('lambda'); %optimal value 

%lambda = 40.0;
%theta = trainModel([X_train; X_cv], [y_train; y_cv], lambda, num_labels);
%save('theta', 'theta');

%% Test the model and accuracy
load('model_data\theta.mat');
pred = predict(theta,[zeros(size(X_test, 1), 1) X_test]);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y_test)) * 100);

for i = 1:size(X_test, 1)
    p = predict(theta, [0 X_test(i, :)]);
  
    displayData(X_view(i, :));
    fprintf('\npredicted value = %d\tright value = %d\n', p, y_test(i));
    
    s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
end