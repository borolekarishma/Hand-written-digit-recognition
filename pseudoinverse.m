function [ w ] = pseudoinverse( X, Y )
%pseudoinverse Summary of this function goes here
%   Detailed explanation goes here

%append x0=1 to the input matrix
X0 = ones([size(X,1) 1]);
X = [X0 X];

X_inv = inv(X.' * X) * X.'; % calculate the pseudoinverse of X
w = X_inv * Y.';    %Update Y to minimize the in-sample error

end

