    clear all;
clc;
clf;

p = 0;
while p > 0.95 || p < 0.05
    p = input("probability ([0.05, 0.95]) p = ");
end

for n = 1:100
    mu = n * p;
    sigm = sqrt(n*p*(1-p));
    k = 0 : n;
    p1 = binopdf(k, n, p);
    plot(k, p1);
    hold on
    p2 = normpdf(k, mu, sigm);
    plot(k, p2);
    legend('Bino Pdf', 'Norm Pdf');
    title("n = " + n);
    hold off
    pause(0.1)
end


p = 0;
while p > 0.05 || p == 0
    p = input("probability ([0.01 0.05]) p = ");
end

for n = 30:300
    lambda = n * p;
    k = 0 : n;
    p1 = binopdf(k, n, p);
    plot(k, p1, LineStyle="-.");
    hold on;
    p2 = poisspdf(k, lambda);
    legend("Bino", "Poiss");
    plot(k, p2);
    hold off;
    title("n = " + n);
    pause(0.1);
end

