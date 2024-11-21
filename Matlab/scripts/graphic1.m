sz=get(0,'screensize');
L=sz(3);
H=sz(4);
close all;
fig1=figure('position',[10 H/2  0.45*L  0.4*H],'color',[0.5 0.5 0]);
ax1 = axes('parent',fig1,'position',[0.5 0.55 0.45 0.35],...
    'color','y','xcolor','w','ycolor','m','nextplot','add');
title('tracé 1','color','w');
fig2=figure('position',[L/2   H/2   0.45*L   0.45*H],'color','m');
set(fig2,'numbertitle','off','menubar','none','name','GRAPHIQUE  2');
ax2=axes('parent',fig2,'position',[0.1 0.57 0.45 0.3],'color','c','nextplot','add');
title('tracé 2');
ax3 = axes('parent',fig2,'position',[0.1   0.1   0.8   0.3],'nextplot','add');
title('tracé 3');

x=0:0.1:6;
y1=sin(x);
y2=1.5*sin(2*x);
l1=plot(x,y1);  % sera ajouté à l'axe courant  ( = ax3)
l2=plot(x,y2,'r'); % sera ajouté à l'axe courant  ( = ax3)
l3 = plot(x,y2,'Parent',ax1,'LineWidth',2); %sera ajouté à l'axe ax1
l4 = plot(x,y2,'r','Parent',ax2);   %sera ajouté à l'axe ax2
