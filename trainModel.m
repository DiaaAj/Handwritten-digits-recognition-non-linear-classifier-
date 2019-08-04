function [theta] = trainModel(X, y, lambda, num_labels)
%TRAINMODEL Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(X);
initial_theta = zeros(n+1, 1);
theta = zeros(num_labels, n+1);

options = optimset('GradObj', 'on', 'MaxIter', 600, 'display', 'iter');
for i = 1:num_labels
    theta(i, :) = ... 
               fminunc(@(t)computeCost(X, (y == i), t, lambda), ...
                                              initial_theta, options);
                                          
    cost = computeCost(X, y, theta(i, :)', num_labels);                                 
    fprintf('\nIteration %d of %d\t\tcost = %f\n', i, num_labels, cost);
                                      
end

