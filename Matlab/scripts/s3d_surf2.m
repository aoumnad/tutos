
[X,Y,Z] = peaks(30);
close all;
surf(X,Y,Z)
axis([-3 3 -3 3 -10 5])
figure;
surf(X,Y,Z,'FaceColor','interp','FaceLighting','phong','EdgeColor','none');
axis tight
camlight left
