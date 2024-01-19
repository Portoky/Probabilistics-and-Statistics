clear all;
clc;

X = [7, 7, 4, 5, 9, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7, 12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5 ,12, 6, 10, 7];
N = length(X);
alpha = input("significance level: ");
quantile = tinv(1 - alpha, N - 1)

[H, P, CI, Stats] = ttest(X, 5.5, alpha, 1)
if Stats.tstat > quantile 
    fprintf("Since the result of the statistical test is inside of the rejection region we reject H0 so the file stored exceed 5.5");
else
    fprintf("Since the result of the statistical test is outside of the rejection region we wont reject H0 so the file stored do not exceed 5.5");
end