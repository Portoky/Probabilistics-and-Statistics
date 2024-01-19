clear all
clc
clf

n = input("number of trials = ");
p = -1;

while p <= 0 || p >= 1
    p = input("prob of success = ");
end

S = input("number of simulations = ");

U = rand(n, S);
M = U < p;
X = sum(M)

U_X = unique(X);
n_X = hist(X, length(U_X))

rel_freq = n_X / S;

[U_X; rel_freq; binopdf(U_X, n, p);]
