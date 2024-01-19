clear all;
clf;
clc;

standard = [46,37,39,48,47,44,35,31,44,37];
new = [35,33,31,35,34,30,27,32,31,31];
n1 = length(standard);
n2 = length(new);
s1_2 = var(standard);
s2_2 = var(new);
m1 = mean(standard);
m2 = mean(new);
alpha = 0.05;

fquantilel1 = finv(alpha / 2, n1-1, n2-1)
fquantilel2 = finv(1-alpha / 2, n1-1, n2-1)

%we want to check if var1 =/= var2 so if var1/var2 =/= 1 we do a a two tailed test
%where hypothesis is var1 / var2 == 1 so we do a ttest
fprintf("If the value H == 1 this means we reject H0 so we reject the hypothesis that the variances do not differ./n If H == 0 we do not reject hypothesis.\n");
[H, P, CI, STATS] = vartest2(standard, new, alpha, 0)

if H == 1 && (STATS.fstat < fquantilel1 || STATS.fstat > fquantilel2) % or if the statistical test result is inside rejection region
    fprintf("We reject H0 so the population variances differ \n");
    
    oneminusalpha = 0.95;
    alpha = 1 - oneminusalpha;
    c = (s1_2 / n1) / (s1_2 / n1 + s2_2 / n2);
    onepern = (c.^2 / (n1-1)) + (power((1-c), 2) / (n2-1));
    n = 1 / onepern;
    theta_lower2 = m1-m2-tinv(1-alpha / 2, n) * sqrt(s1_2/n1 + s2_2/n2); %....
    theta_upper2 = m1-m2+tinv(1-alpha/2, n) * sqrt(s1_2/n1 + s2_2/n2);
    
    fprintf("The %2.0f%% confidence interval for the difference of the average assembling time is: %5.3f , %5.3f \n", oneminusalpha * 100, theta_lower2, theta_upper2);

else
    fprintf("We wont reject H0 so the population variances does not differ \n");
    oneminusalpha = 0.95;
    alpha = 1 - oneminusalpha;

    s_p2 = ( (n1 - 1) * s1_2 + (n2 - 1) *s2_2 ) / (n1 + n2 - 2);

    theta_lower = m1-m2 - tinv(1-alpha, n1+n2-2) * sqrt(s_p2) * sqrt(1/n1 + 1/n2);
    theta_upper = m1-m2 + t(1 - alpha/2) * sqrt(s_p2) * sqrt(1/n1 + 1/n2);

    fprintf("The %2.0f%% confidence interval for the difference of the average assembling time is: %5.3f , %5.3f \n", oneminusalpha * 100, theta_lower2, theta_upper2);
end

