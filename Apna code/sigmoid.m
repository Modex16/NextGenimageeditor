function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).
for i = 1:length(z(:,1))
    for j = 1:length(z(1,:))
        g(i,j) = 1/(1+exp(-z(i,j)));
    end
end    
end
