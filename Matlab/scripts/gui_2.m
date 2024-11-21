function gui_2()
global t1

fh = figure('Position',[400 300 350 150],'Menubar','None');
b1 = uicontrol(fh,'style','pushbutton','Posit',[30 10 60 30],'String','Button 1','callback',@fonc1);
b2 = uicontrol(fh,'style','pushbutton','Posit',[50 50 60 30],'String','Button 2');
b3 = uicontrol(fh,'style','pushbutton','Posit',[10 80 60 30],'String','Button 3');
align([b1,b2,b3],'center','Distribute')
t1 = uicontrol(fh,'style','Text','Posit',[100 10 200 100]);
end

function fonc1(obj,event)
global t1
set(t1,'string',[get(t1,'string') 'Bonjour']);
end
