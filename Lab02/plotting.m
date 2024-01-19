x = 0:0.01 : 2 * pi
y = sin(x)
x1 = 0:0.5:2*pi
y1 = cos(x1)
plot(x, y)
hold on
plot(x1, y1)
hold off
