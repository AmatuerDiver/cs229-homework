function [X,y,theta_true] = load_data

  X = load('x.dat');
  y = load('y.dat');
  theta_true = load('theta.dat');
  theta = zeros(size(theta_true));

  for (i = 0:0)
    i
    lambda = 10^i;
    theta = l1ls(X,y, lambda);
    diff = norm(theta - theta_true)
  end
end