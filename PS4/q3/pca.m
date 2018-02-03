function U = pca(X)

%%% YOUR CODE HERE
[U1, S1, V1] = svd(X*X');
U = V1;
 