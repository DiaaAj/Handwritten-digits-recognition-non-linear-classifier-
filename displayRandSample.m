function displayRandSample(X, indices)

[m, n] = size(X);
if ~exist('indices', 'var') || isempty(indices)
    indices = randperm(m);
    
sel = X(indices(1:100), :);
displayData(sel);

end

