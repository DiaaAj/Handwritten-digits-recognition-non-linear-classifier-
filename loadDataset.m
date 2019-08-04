function [X_train, y_train, X_cv, y_cv, ...
                             X_test, y_test] = loadDataset()

%load mnist data
[X, y] = mnist_parse('mnist_dataset\train-images.idx3-ubyte', ...
                                'mnist_dataset\train-labels.idx1-ubyte');
                            
X = double(reshape(X, size(X,1)*size(X,2), []).');
y = double(y);
                            
[X_test, y_test] = mnist_parse('mnist_dataset\t10k-images.idx3-ubyte', ...
                                'mnist_dataset\t10k-labels.idx1-ubyte');

X_test = double(reshape(X_test, size(X_test,1)*size(X_test,2), []).');
y_test = double(y_test); 
[m, n] = size(X);

% visualize a sample test of the training data
displayRandSample(X);

%map 0 value to 10
y_test(y_test == 0) = 10; 
y(y == 0) = 10;

% last 20 percent of X for cross validation dataset and 80 percent ...
% for the training dataset 
X_train = X(1:ceil(m*0.8), :); y_train = y(1:ceil(m*0.8), :);
X_cv = X(floor(m*0.8:end), :); y_cv = y(floor(m*0.8:end), :);

end

