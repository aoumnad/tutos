function gui_global()
global e1 t1 rb1 rb2 rb3 pan1 e2 e3 t2
close all

fh = figure('Units', 'Normalized', 'Position',[0.6 0.6 0.37 0.35],'MenuBar','none');

set(fh, 'DefaultUicontrolUnits',  'normalized') ;
fond = get(fh,'color');
rbg  = uibuttongroup('parent',fh, 'Title','unité', 'position',[0.02 0.55 0.25 0.4],'back',fond,'SelectionChangeFcn',@radio);
rb1 = uicontrol(rbg,'style', 'radiobutton','position', [0.1 0.1 0.8 0.2],'String', 'steps','back',fond);
rb2 = uicontrol(rbg,'style', 'radiobutton','position',[0.1 0.4 0.8 0.2],'String', 'degrés','back',fond);
rb3 = uicontrol(rbg,'style', 'radiobutton','position',[0.1 0.7 0.8 0.2],'String', 'tours','back',fond);
set(rbg, 'SelectedObject',rb2);

b1 = uicontrol(fh,'style','pushbutton','Posit',[0.02 0.02 0.2 0.1],'String','EXIT','callback',@quitter);
b2 = uicontrol(fh,'style','pushbutton','Posit',[0.02 0.14 0.2 0.1],'String','CLEAR', 'callback',@nettoyer);
b3 = uicontrol(fh,'style','pushbutton','Posit',[0.02 0.26 0.2 0.1],'String','Saluer','callback',@salu);

t1 = uicontrol(fh,'style','Text','Posit',[0.24 0.02 0.7 0.4],'HorizontalAlignment','left');
e1 = uicontrol(fh,'style','EDIT','Posit',[0.6 0.77 0.15 0.1],'Horiz','left','str', 'toi');
e2 = uicontrol(fh,'style','EDIT','Posit',[0.6 0.66 0.15 0.1],'Horiz','left','str', '22');
e3 = uicontrol(fh,'style','EDIT','Posit',[0.6 0.55 0.15 0.1],'Horiz','left','str', '44');
t2 = uicontrol(fh,'style','Text','Posit',[0.8 0.55 0.17 0.1],'Horiz','left');
l2 = uicontrol(fh,'style','Text','Posit',[0.56 0.68 0.04 0.05],'str','N2','back',fond);
l3 = uicontrol(fh,'style','Text','Posit',[0.56 0.57 0.04 0.05],'str','N3','back',fond);
l23 = uicontrol(fh,'style','Text','Posit',[0.85 0.66 0.08 0.05],'str','N2+N3','back',fond);

pan1 = uipanel(fh, 'Title','Choix', 'position',[0.3 0.55 0.25 0.4],'back',[0.8 0.8 0.8]);
chb1 = uicontrol(pan1,'style', 'Checkbox','position', [0.1 0.1 0.8 0.2],'String', 'Bananes', 'back',fond);
chb2 = uicontrol(pan1,'style', 'Checkbox','position', [0.1 0.4 0.8 0.2],'String', 'Pommes', 'back',fond);
chb2 = uicontrol(pan1,'style', 'Checkbox','position', [0.1 0.7 0.8 0.2],'String', 'Oranges', 'back',fond);

end

function radio(source,event)
% source = handle du control uibuttongroup
% event = événement qui s'est produit
actuel_hndl = get(source,'SelectedObject'); 
%cet élément est affecté dynamiquement au control à chaque exécution du
%programme
actuel_str = get(actuel_hndl,'string');
disp(['Elément séléctionné  --->  '  actuel_str])
old = get(event.OldValue,'String');
new = get(event.NewValue,'String');
disp(['Evénement:   ' old ' ---> ' new])

end

function quitter(obj,event)
disp('by')
delete(gcf)
end

function salu(obj,event)
global e1 t1 rb1 rb2 rb3 pan1 e1 e2 e3 t2
set(t1,'string',[get(t1,'string') 'Bonjour ' get(e1,'String') ' ']);
hh = get(pan1,'children');
ss = get(hh,'string');
vv = get(hh,'value');
disp([ss vv])

n2 = str2num(get(e2,'string'));
n3 = str2num(get(e3,'string'));
set(t2,'string',n2+n3)
end

function nettoyer(obj,event)
global t1
set(t1,'string','');
end
