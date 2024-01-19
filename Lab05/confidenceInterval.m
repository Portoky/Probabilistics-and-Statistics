clear all;
clc;

X = [7, 7, 4, 5, 9, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7, 12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5 ,12, 6, 10, 7];
length(X);

sigma = 5;

oneminusalpha = input("Confidence level = ");%0.95
alpha = 1 - oneminusalpha;
n = length(X);
m = mean(X);
theta_lower = m - sigma / sqrt(n) * norminv(1 - alpha / 2);
theta_upper = m - sigma / sqrt(n) * norminv(alpha / 2);

fprintf("a) The %2.0f%% confidence interval for the mean is (%5.3f, %5.3f)\n", oneminusalpha*100, theta_lower, theta_upper);
%b) homework

theta_lower2 = m - std(X) / sqrt(n) * tinv(1 - alpha / 2, n - 1);
theta_upper2 = m - std(X) / sqrt(n) * tinv(alpha / 2, n - 1);
fprintf("b) The %2.0f%% confidence interval for the mean is (%5.3f, %5.3f)\n", oneminusalpha*100, theta_lower2, theta_upper2);

%c) 
s2 = var(X);
theta_lower3 = (n - 1) * s2 / chi2inv(1 - alpha / 2, n - 1);
theta_upper3 = (n - 1) * s2 / chi2inv( alpha / 2, n - 1);
fprintf("b) The %2.0f%% confidence interval for the populaton variance is (%5.3f, %5.3f)\n", oneminusalpha*100, theta_lower3, theta_upper3);





