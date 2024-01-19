clear all;
clf;
clc;
title("Different plots")
subplot(3,1,1)
x = 0:0.1:3;
y1 = power(x, 5) / 10;
plot(x, y1, "red", LineWidth=5, LineStyle="--")
legend("first")
hold on;
subplot(3,1,2)
y2 = x.*sin(x);
plot(x, y2, "blue", LineWidth=2, LineStyle=":")
legend("second")
y3 = cos(x);
subplot(3,1,3)
plot(x, y3, "yellow", LineWidth=3, LineStyle="-.")
legend("third")
