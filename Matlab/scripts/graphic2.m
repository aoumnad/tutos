x = -pi:pi/100:pi;
y1 = sin(1.5*x);
y2 = 0.4*cos(10*x);
y3 = y1 + y2;
close all;
plot(x,y1,':r',x,y2,'--m');
hold on;
plot(x,y3,'b','linewidth',2);
axis([-pi pi -1.5 1.5]);
grid;

t = -pi:pi/50:pi;
s1 = sin(5*t);
s2 = 1 + 0.8*sin(t);
s3 = s1 .* s2;
pf1 = get(gcf,'position');
figure('position',[pf1(1)+100 pf1(2)-100 pf1(3) pf1(4)]);
plot(t,s3,':ro','linewidth',2,'MarkerEdgeColor','b',...
		'MarkerFaceColor','y','MarkerSize',10);
hold on;
plot(t,s2,'--k',t,-s2,'--k');
axis([-pi pi -2 2]);
set(gca,'xtick',-pi:pi/4:pi);
set(gca,'xticklabels',...
    ['  -p ';'-3p/4';' p/2 ';'-p/4 ';'  0  ';' p/4 ';' p/2 ';' 3p/4';'  p  ']);
set(gca,'fontname','symbol');
grid;