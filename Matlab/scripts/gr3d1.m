x = [0 1 2 2 2 2 2 2 2 2 1 0];
y = [0 0 0 0 1 2 2 1 0 0 0 0];
z = [0 0 0 1 1 1 2 2 2 3 3 3];
close all;
plot3(x,y,z,'-s','linewidth',2);
axis ij
grid;
xlabel('axe des X');
ylabel('axe des Y');
zlabel('axe des Z');
