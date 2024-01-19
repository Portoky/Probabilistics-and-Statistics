clear all;
clc;

X = [7, 7, 4, 5, 9, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7, 12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5 ,12, 6, 10, 7];
alpha = input("significance level: ");
sigma = 5;
quantile = norminv(alpha)
[H, P, CI, ZVAL] = ztest(X, 8.5, sigma, alpha, -1)

if H == 1
    fprintf("Standard not met!!\n");
else 
    fprintf("Standard is met!\n");
end
if P > alpha
    fprintf("Standard is met!!\n");
else
    fprintf("Standard not met!!\n");
end

%check if inside region smaller than P value