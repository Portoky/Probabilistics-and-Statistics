clear all;
clf;
clc;

premium = [22.4, 24.5,21.6,22.4,24.8,21.7,23.4,23.3,21.6,20.0];
regular = [17.7,19.6,12.1,15.4,14.0,14.8,19.6,14.8,12.6,12.2];
oneminusalpha = input("Confidence level = ");%0.95
alpha = 1 - oneminusalpha;

m1 = mean(premium);
m2 = mean(regular);
n1 = length(premium);
n2 = length(regular);
s1_2 = var(premium);
s2_2 = var(regular);

s_p2 = ( (n1 - 1) * s1_2 + (n2 - 1) *s2_2 ) / n1 + n2 - 2;

%a)
theta_lower = m1-m2-tinv(1-alpha / 2, n1+n2 - 2) * sqrt(s_p2) * sqrt(1/n1 + 1/n2); %....
theta_upper = m1-m2+tinv(1-alpha/2, n1+n2-2) * sqrt(s_p2) * sqrt(1/n1 + 1/n2);
fprintf("The %2.0f%% confidence interval for the difference of the means is: %5.3f , %5.3f \n", oneminusalpha * 100, theta_lower, theta_upper);

%for b) the third formula for c) the 4. formula
%b)
c = (s1_2 / n1) / (s1_2 / n1 + s2_2 / n2);
onepern = (c.^2 / (n1-1)) + (power((1-c), 2) / (n2-1));
n = 1 / onepern;
theta_lower2 = m1-m2-tinv(1-alpha / 2, n) * sqrt(s1_2/n1 + s2_2/n2); %....
theta_upper2 = m1-m2+tinv(1-alpha/2, n) * sqrt(s1_2/n1 + s2_2/n2);
fprintf("The %2.0f%% confidence interval for the difference of the means is: %5.3f , %5.3f \n", oneminusalpha * 100, theta_lower2, theta_upper2);

%c)
theta_upper3 = 1/finv(1 - alpha / 2, n1-1, n2-1) * s1_2 / s2_2;
theta_lower3 = 1 / finv(alpha / 2, n1-1,n2-1) * s1_2/s2_2;
fprintf("The %2.0f%% confidence interval for the ratio of variances: %5.3f , %5.3f \n", oneminusalpha * 100, theta_lower3, theta_upper3);
