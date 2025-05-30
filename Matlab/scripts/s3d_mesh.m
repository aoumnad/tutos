[x,y] = meshgrid(-5:0.2:5);
r = sqrt(x.^2 + y.^2) + eps;
z = sin(pi*r) ./ r;
close all;
mesh(x, y, z);
figure;
meshc(x, y, z);
figure;
meshz(x, y, z);
