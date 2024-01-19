clear all
clc

p = -1;

while p <= 0 || p >= 1
    p = input("prob of success = ");
end

S = input("number of simulations = ");

X = zeros(1,S); %vector of length s zeros everywhere

for i=1:S
    %i-th simulation
    cnt = 0;
    U = rand; % <=> rand(1)
    while U>=p
        cnt = cnt + 1;
        U = rand;
    end
    X(i) = cnt;
end

U_X = unique(X)
n_X = hist(X, length(U_X))

rel_freq = n_X / S;

[U_X; rel_freq; geopdf(U_X, p);]

clf;
plot(U_X, rel_freq, "x");
hold on;
plot(0:max(U_X),geopdf(0:max(U_X), p),"o");
hold off;
title("Geometric simulatior");
legend("freq", "geopdf");
