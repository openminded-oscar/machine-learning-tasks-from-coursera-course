function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

m = length(y); % number of training examples

mainPart = 1/m*sum(((-y)')*log(sigmoid(X*theta))-((1-y)')*(log(1-sigmoid(X*theta))));
lambdaCorrection = (lambda/(2*m))*(sum(theta(2:end).^2));
J = mainPart + lambdaCorrection;

grad = (1/m*(sigmoid(X*theta)-y)'*X)';
grad(2:end) = grad(2:end) + lambda/m*theta(2:end);
end
