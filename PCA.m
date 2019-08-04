function [Z, U_reduced] = PCA(X, R, k)
%PCA principal component analysis to reduce data dimensionality 
%   [Z, U_reduced] = PCA(X, retain) returns Z matrix which is the final data after 
%   applying pca with variance retained bigger or equal to R
[m, n] = size(X);

sigma = (X*X')/m; % compute covariance matrix
[U, S, ~] = svd(sigma); % compute eigenvectors of covariance matrix

% choose optimal number of principal components
if ~exist('k', 'var') || isempty(k)
    S_total = sum(sum(S));
    for i = 1:n
        variance = sum(sum(X(:, 1:i))) / S_total;  
        if(variance >= R)
            k = i;
            break;
        end
    end
end

U_reduced = U(:, 1:k); % take the first k columns of the matrix
Z = X' * U_reduced; % project data points

end

