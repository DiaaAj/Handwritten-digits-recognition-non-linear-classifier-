function [X_norm] = featureNormalization(X, sigma)
%FEATURENORMALIZATION applies feature normalization on passed dataset
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1.

if ~exist('sigma', 'var') || isempty(sigma)
    sigma = std(X);
end

X_norm = X./sigma;
    



end

