function [opt_lambda, min_cost] = ... 
                    computeLambda(X_train, y_train, X_cv, y_cv, num_labels)
%COMPUTELAMBDA finds the value of the optimal lambda 
%lambda testing values 
lambda_values = [ ...
            %40, 43, 46, 50
            %14, 15, 16, 17, 18, 19, 20 
            %8, 8.4, 8.8, 9, 9.4, 9.8, 10, 10.4, 10.8, 11, 12 ...
            %13, 14
            %0.0, 0.01, 0.03, 0.06, 0.1, 0.3, 0.6, 1.0, 1.5, 2.0, 3 ...
            %3.5, 4, 5, 6, 8 ...
];               

min_cost = inf;
for i = 1:length(lambda_values)
    lambda = lambda_values(i);
    [theta] = trainModel(X_train, y_train, lambda, num_labels);
    cost = computeCost(X_cv, y_cv, theta', num_labels);
    cost = mean(cost);
    fprintf('\nmodel %d with lambda = %f\tcost=%f\n', i, lambda, cost);
    
    if(cost < min_cost)
        min_cost = cost;
        opt_lambda = lambda;
    end
    
end
                
end

