clear all;
clc;

X = [7, 7, 4, 5, 9, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7, 12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5 ,12, 6, 10, 7];
alpha = input("significance level: ");
sigma = 5;
quantile = norminv(alpha)
