x = 0:10;
y = 0:3;
[yy, xx] = meshgrid(y, x);
z=zeros(11,4);
z(:,1) = [0 1 0 1 0 1 0 1 0 1 0];  % 1�re colonne = courbe 1
z(:,2) = [0 0 1 1 1 0 0 1 1 0 0];  % 2�me colonne = courbe 2
z(:,3) = [0 1 1 0 0 0 1 1 0 1 1];  % 3�me colonne = courbe 3
z(:,4) = [0 0 1 1 2 2 1 1 0 0 1];  % 4�me colonne = courbe 4
close all;
plot3(xx, yy, z, 'LineWidth',2);grid;
