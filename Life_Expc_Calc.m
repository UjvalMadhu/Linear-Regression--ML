%% Machine Learning Exercise
% Prediction of Life expectancy of a country by taking into account its
% population density(Person/sq.km), exponential pollution index and GDP per capita


%% ================ Part 1: Data Initialization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('D1.txt')
X = data(:,2:4);
Y = data(:,5);
m = length(Y);



%=================== Part 2: Feature Normalization ================

fprintf('Normalizing features ....\n')

[X1,mn,stdDiv] = featureNorm(X);

% Adding ones in the first column as theta0 = 1 for all examples

X1 = [ones(m,1) X1]



%==================== Part 3: Gradient Descent =====================

fprintf('Running gradient descent ...\n');

% Choosing the learning rate (alpha) and number of itertaions (num_iters)
alpha = 0.01;
num_iters = 500;

% Initialise Theta and Run Gradient Descent 
theta = zeros(size(X1,2), 1);
[theta, J_history] = gD_Calc(X1, Y, theta, alpha, num_iters);
theta;
J_history;

%===================== Part 4: Normal Equation ======================
% The normal equation method is another method of solving the Linear regression
% This method is quite simple and does not require loop convergence.

theta2 = normalEqn(X,Y);


%========================= Part 5: Predicting ==============================

%We predict the life expectancy for Italy, having features:
% Population density (Person per Km2) = 206
% GDP per Capita = $31,676
% Pollution Exp Scale = 91.5
% The predicted average life expectancy must be close to 83.71 years

% Normalising the variables:
X_Italy = [206,31676,91.5];
for i = 1:length(X_Italy),
  X_Italy(1,i) = (X_Italy(1,i)-mn(1,i))/stdDiv(1,i);
endfor
X_Italy = [1,X_Italy];
predict1 = X_Italy*theta;
fprintf(['Predicted average life expectancy of Italy ' ...
        '(using gradient descent):\n %f\n'], predict1);
        
predict2 = [206,31676,91.5]*theta2;
fprintf(['Predicted average life expectancy of Italy ' ...
        '(using Normal Equation):\n %f\n'], predict2);

%We predict the life expectancy for Italy, having features:
% Population density (Person per Km2) = 347
% GDP per Capita = $40,113.06
% Pollution Exp Scale = 62.92
% The predicted average life expectancy must be close to 84.79 years

% Normalising the variables:
X_Japan = [347,40113,62.92];
for i = 1:length(X_Japan),
  X_Japan(1,i) = (X_Japan(1,i)-mn(1,i))/stdDiv(1,i);
endfor
X_Japan = [1,X_Japan];
predict3 = X_Japan*theta;
fprintf(['Predicted average life expectancy of Japan ' ...
        '(using gradient descent):\n %f\n'], predict3);

predict4 = [347,40113,62.92]*theta2;
fprintf(['Predicted average life expectancy of Japan ' ...
        '(using Normal Equation):\n %f\n'], predict4);

        
%===========================================================================

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');



