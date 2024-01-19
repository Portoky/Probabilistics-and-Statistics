clear all;
clf;
clc;

n = 3;
p = 0.5;
k = 0:n;
px = binopdf(k, n, p)

b1= binocdf(k, n, p)
m = [k;px; b1]

c1 = binopdf(0,n,p)
c2 = binocdf(3, n, p) - binopdf(1, n, p) 
    % it is 1

d1 = binocdf(2, n, p)
d2 = binocdf(2, n, p) - binopdf(2, n, p)

e1 = 1 - (binocdf(1, n, p) - binopdf(1, n, p))
e2 = 1 - binocdf(1, n, p) 