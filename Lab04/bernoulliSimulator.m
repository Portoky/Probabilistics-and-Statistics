clear all
clc

p = -1;
while p <= 0 || p >= 1
    p = input("prob of success = ");
end

S = input("number of simulations = ");

U = rand(1, S);
X = U < p;

U_X = unique(X);
n_X = hist(X, length(U_X));

rel_freq = n_X / S;

[U_X; rel_freq; binopdf(U_X, 1, p)]