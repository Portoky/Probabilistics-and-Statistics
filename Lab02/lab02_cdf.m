clf 
clc
n = input("number of trials n = ")
p = input("prob of succes p = ")
%k - "number of successes"
k = 0 : n

% pdf('bino', k, n, p)
px = binopdf(k, n, p)


x = 0:0.01:n;
fx = binocdf(x, n, p);

plot(k, px, '*')
hold on
plot(x, fx)
title("CDF PDF")
legend('PDF', 'CDF')
hold off