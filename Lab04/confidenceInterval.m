M = [9, 7, 7, 4, 5, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7, 12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5 ,12, 6, 10, 7];
length(M);

sigma = 5;

oneminusalpha = input("Confidence level = ");
alpha = 1 - oneminusalpha;
m = mean(M);
theta_lower = m - sigma / sqrt(length(M)) * norminv(1- alpha / 2, 0, 1)
theta_upper = m - sigma / sqrt(length(M)) * norminv(alpha / 2, 0, 1)

%b) homework