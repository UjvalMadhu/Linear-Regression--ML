function [X_norm,mn,stdDiv] = featureNorm(X)
  %featureNorm(X) Normalizes the features in X 
  
  
  %====================== Initialising Variables ===================
  
  X_norm = zeros(size(X));                          % X_norm will hold the normalized values
  mn = zeros(1, size(X, 2));             % mn will hold the mean each set of examples
  stdDiv = zeros(1, size(X, 2));          % stdDiv will hold the standard deviation
  ftrs = size(X,2);                      % ftrs is the number of features
  egs = size(X,1);                      % egs is the number of training examples
  
  %====================== Calculating X_norm ========================
  % The mean() and std() functions calculate the mean and Standard Deviaton
  for i = 1:ftrs,
  mn(1,i) = mean(X(:,i));
  stdDiv(1,i) = std(X(:,i));
    for j = 1:egs,
      X_norm(j,i) = [X(j,i) - mn(1,i)]/stdDiv(1,i);     
    endfor
  endfor
 %===================================================================

endfunction
