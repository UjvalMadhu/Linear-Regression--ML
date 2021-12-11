function [theta, J_history] = gD_Calc(X, Y, theta, alpha, num_iters)
%gD_Calc Performs gradient descent to learn theta
%   theta = gD_Calc(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(Y); % number of training examples
n = size(X,2);
J_history = zeros(num_iters, 1);
theta_history = zeros(num_iters,1);
hyp_history = zeros(num_iters,1);
hyp = 0;

   % ====================== Gradient Descent ======================

for iter = 1:num_iters
    
    % Save the cost J in every iteration    
    [J_history(iter), hyp] = costFunction(X, Y, theta);
    % Updating the values of theta
    for i = 1:n,
      delta  = (hyp-Y).*X(:,i);
      beta = alpha*(sum(delta)/m);
      theta(i) = theta(i)- beta;
    end
    theta_history(iter) = theta(1);
    hyp_history(iter) = hyp(1);

end

J_history
theta_history
hyp_history
   % ============================================================
end
