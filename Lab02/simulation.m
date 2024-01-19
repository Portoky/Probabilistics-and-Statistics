clear all;
clf;
clc;

n = 3;
p = 0.5;

s = input("Number of simulations s: ");

m = rand(3, s) < 0.5
hist(sum(m))