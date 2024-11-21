function main()
global rbg
close all
fh = figure('Units', 'Normalized', 'Position',[0.6 0.6 0.1 0.35],'MenuBar','none');
set(fh, 'DefaultUicontrolUnits',  'normalized') ;
fond = get(fh,'color');

rbg  = uibuttongroup('parent',fh, 'Title','unité', 'position',[0.02 0.02 0.95 0.4],'back',fond,'SelectionChangeFcn',@radio);
rb1 = uicontrol(rbg,'style', 'radiobutton','position', [0.1 0.1 0.8 0.2],'String', 'steps','back',fond);
rb2 = uicontrol(rbg,'style', 'radiobutton','position',[0.1 0.4 0.8 0.2],'String', 'degrés','back',fond);
rb3 = uicontrol(rbg,'style', 'radiobutton','position',[0.1 0.7 0.8 0.2],'String', 'tours','back',fond);
set(rbg, 'SelectedObject',rb2);
b1 = uicontrol(fh,'style','pushbutton','Posit',[0.1 0.8 0.8 0.1],'String','Voir','callback',@voir);
b1 = uicontrol(fh,'style','pushbutton','Posit',[0.1 0.6 0.8 0.1],'String','EXIT','callback',@quitter);

end

function radio(source,event)
% source = handle du control uibuttongroup
% event = événement qui s'est produit
actuel_hndl = get(source,'SelectedObject'); 
actuel_str = get(actuel_hndl,'string');
disp(['Elément séléctionné  --->  '  actuel_str])
old = get(event.OldValue,'String');
new = get(event.NewValue,'String');
disp(['Evénement:   ' old ' ---> ' new])

end

function voir(obj,event)
global rbg
actuel_hndl = get(rbg,'SelectedObject'); 
actuel_str = get(actuel_hndl,'string');
disp(['Elément séléctionné  --->  '  actuel_str])
end

function quitter(obj,event)
disp('by-by')
delete(gcf)
end

