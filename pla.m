function [ w, iters ] = pla( X, Y, w0 )
%PlA Summary of this function goes here
%   Detailed explanation goes here

%adding x0 = 1 to the X
X0 = ones([size(X,1) 1]);
X = [X0 X];

iters = 0;

%check for misclassified points and update weight vector
for i = 1:size(X,1)     
    Y_pred = sign(X(i, :) * w0); %calculate the predicted y 
    if(Y_pred ~= Y(i))  %check if the predicted output is equal to the real output
        
        w0 = w0 + (X(i,:) * Y(i)).';    %if not update the weight accordingly
        iters = iters+1;
    end
end
w = w0;

end

