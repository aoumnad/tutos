function checkbox_structure()
% Passage de paramètres sous formes de structure

close all
fh = figure('Units', 'Normalized', 'Position',[0.6 0.6 0.2 0.3],...
    'MenuBar','none','NumberTitle','off', 'name','Checkbox - structure');
fond = get(fh,'color');
set(fh,'DefaultUicontrolUnits','Normalized')
pan1 = uipanel(fh, 'Title','Choix', 'position',[0.02 0.02 0.9 0.6],'back',fond);
S.chb1 = uicontrol(pan1,'style', 'Checkbox','position',...
    [0.1 0.8 0.6 0.1],'String', '  Bananes', 'back',fond);
S.chb2 = uicontrol(pan1,'style', 'Checkbox','position',...
    [0.1 0.55 0.6 0.1],'String', '  Pommes', 'back',fond);
S.chb3 = uicontrol(pan1,'style', 'Checkbox','position',...
    [0.1 0.3 0.6 0.1],'String', '  Oranges', 'back',fond);
S.chb4 = uicontrol(pan1,'style', 'Checkbox','position',...
    [0.1 0.05 0.6 0.1],'String', '  Abricot', 'back',fond);
S.eh = uicontrol(fh, 'style', 'Text', 'pos',[0.1 0.82 0.8 0.1]);
b2 = uicontrol(fh, 'style', 'push', 'pos',[0.1 0.65 0.8 0.15],...
    'str', 'Vérifier', 'call', {@test2,S});
end

function test2(obj,event,S)
         a='';
        if get(S.chb1,'value')
           a = strcat(a,get(S.chb1,'string'));
        end
        if get(S.chb2,'value')
           a = strcat(a,get(S.chb2,'string'));
        end
        if get(S.chb3,'value')
           a = strcat(a,get(S.chb3,'string'));
        end
        if get(S.chb4,'value')
           a = strcat(a,get(S.chb4,'string'));
        end
        set(S.eh,'str',a);
end
