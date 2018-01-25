function y = lwlr(X_train, y_train, x, tau)

%%% YOUR CODE HERE
	%%constants 
	epsilon = 1e-5;
	ITER_MAX = 20;
	lambda = 0.0001;

	m = size(X_train, 1);
	n = size(X_train, 2);

	theta = zeros(n, 1);

	%compute weights
	w = exp(-sum((X_train - repmat(x',m,1)).^2, 2)/(2*tau));
  g = ones(n,1); 

	while (norm(g)>epsilon)
		h = 1./(1+exp(-X_train*theta));
		g = X_train'*(w.*(y_train - h)) - lambda.*theta;
		D = diag(-w.*h.*(1-h));
		H = X_train'*D*X_train - lambda*eye(n);
		theta = theta -  H \ g;
	end

	y = x'*theta > 0;


end 
