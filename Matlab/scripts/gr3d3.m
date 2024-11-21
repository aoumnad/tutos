t = 0:pi/50:10*pi;
plot3(sin(t),cos(t),t,'linewidth',2)
grid on
axis square
xlabel('sin(t)');
ylabel('cos(t)');
zlabel('t');
