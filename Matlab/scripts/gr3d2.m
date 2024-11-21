t = 0:0.1:10;  % axe des x
to = 0:2:6;   
[tt, tto] = meshgrid(t,to);
dt = tt - tto + eps;   % le eps est ajouté juste pour éviter la division par 0
z = sin(pi*dt) ./ (dt);
close all,
plot3(tt', tto', abs(z') );
axis('ij');
grid;
xlabel('t');
ylabel('to');
zlabel('sinc(t-to)');