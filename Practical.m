clear all;
clc;

bank = [3.1,2.9,3.8,3.3,2.7,3.0,2.8,2.5,2.6,2.0,3.2,2.4,2.3,3.1,2.1,3.4];
other = [6.9,6.4,4.7,4.3,5.1,6.3,5.9,5.4,5.3,5.2,5.1,5.9,5.8,4.9];
n1 = length(bank);
n2 = length(other);
m1 = mean(bank);
m2 = mean(other);
s1_2 = var(bank);
s2_2 = var(other);
sign_level = 0.05;

fprintf("For the a) we use the statistical test ftest- with the function varttest2.\n H0 is that (std1)^2/(std2)^2 = 1, aka the variances do NOT differ.\nThe alternative hyptohesis is that it is =/= 1 so the variances DO differ. \n So we do a two a two tailed test\n")

quantile1 = finv(sign_level / 2, n1-1, n2-1);
quantile2 = finv(1 - sign_level / 2, n1-1,n2-1);

[H, P, CI, STATS] = vartest2(bank, other, sign_level, 0);
if H == 1
    fprintf(" H == 1 => We reject the H0, therefore the variances differ\n");
    fprintf("the result of the P-value is: %3.5f. \nThis is smaller then the significance level. " + ...
        "Therefore from the P-Value test we also conclude the previous statement, we reject H0.\n", P);
    fprintf("The result of the statistical test is: %3.5f", STATS.fstat)
    fprintf("This is inside the rejection region (-inf, %3.5f) u (%3.5f, inf) so we reject H0\n", quantile1, quantile2);

    %b)
    fprintf("For the confidence interval we take into consideration that the variances differ!\n");
    oneminusalpha = 0.95;
    alpha = 1 - oneminusalpha;
    c = (s1_2 / n1) / (s1_2 / n1 + s2_2 / n2);
    onepern = (c.^2 / (n1-1)) + (power((1-c), 2) / (n2-1));
    n = 1 / onepern;
    theta_lower2 = m1-m2-tinv(1-alpha / 2, n) * sqrt(s1_2/n1 + s2_2/n2); %....
    theta_upper2 = m1-m2+tinv(1-alpha/2, n) * sqrt(s1_2/n1 + s2_2/n2);

    fprintf("The %2.0f%% confidence interval for the difference of the amount of paper thrown out by bank emoloyees and by other employees: %5.3f , %5.3f \n", oneminusalpha * 100, theta_lower2, theta_upper2);


else
    fprintf(" H == 0 => We do not reject H0, so the variances do not differ\n");
    fprintf("the result of the P-value is: %3.5f. \nThis is not smaller then the significance level. " + ...
        "Therefore from the P-Value test we also conclude the previous statement, we reject H0.\n", P);
    fprintf("The result of the statistical test is: %3.5f\n", STATS.fstat)
    fprintf("This is inside the rejection region (-inf, %3.5f) u (%3.5f, inf) so we dont reject H0", quantile1, quantile2);
    %b)
    fprintf("For the confidence interval we take into consideration that the variances do not differ!\n");
    oneminusalpha = 0.95;
    alpha = 1 - oneminusalpha;
    
    s_p2 = ( (n1 - 1) * s1_2 + (n2 - 1) *s2_2 ) / (n1 + n2 - 2);
    
    theta_lower = m1 - m2 - tinv(1 - alpha/2, n1 + n2 - 2) * sqrt(s_p2) * sqrt(1/n1 + 1/n2);
    theta_upper = m1 - m2 + tinv(1 - alpha/2, n1 + n2 - 2) * sqrt(s_p2) * sqrt(1/n1 + 1/n2);

    fprintf("The %2.0f%% confidence interval for the difference of the amount of paper thrown out by bank emoloyees and by other employees: %5.3f , %5.3f \n", oneminusalpha * 100, theta_lower, theta_upper);

end
