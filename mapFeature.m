function newX = mapFeature(X, degree)

[m, n] = size(X);     
max_degree  = degree;     % order of polynomial

stacked = zeros(0, n); %this will collect all the coefficients...    
for d = 1:max_degree          % for degree 1 polynomial to degree 'order'
    stacked = [stacked; mg_sums(n, d)];
end

newX = real(exp(log(X) * stacked'));


end