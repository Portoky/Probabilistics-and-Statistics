clear all
clc

p = -1;

while p <= 0 || p >= 1
    p = input("prob of success = ");
end
n = input("number of success you want to achieve = ");

S = input("number of simulations = ");

X = zeros(1,S); %vector of length s zeros everywheree


for i=1:S
    %i-th simulation
    cnt = 0;
    successcnt = 0;
    while successcnt < n
        U = rand; % <=> rand(1)
        while U>=p
            cnt = cnt + 1;
            U = rand;
        end
        successcnt = successcnt + 1;
    end
    X(i) = cnt;
end
X
U_X = unique(X)
n_X = hist(X, length(U_X))
rel_freq = n_X / S

[U_X; rel_freq;nbinpdf(U_X,n,p)]

clf;
plot(U_X, rel_freq, "x");
hold on;
plot(0:max(U_X),nbinpdf(0:max(U_X), n, p),"o");
hold off;
title("Negative Binomial simulator");
legend("freq", "nbinpdf");
