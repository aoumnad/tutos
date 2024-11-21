function checkbox_nested()
% Illustration de l'utilisation d'une fonction imriquée
% Une fonction imbriquée peut accéder et modifier les variables
% définies dans la fonction parent

close all
fh = figure('Units', 'Normalized', 'Position',[0.6 0.6 0.25 0.3],...
    'MenuBar','none','NumberTitle','off','name','Checkbox - Nested function');
fond = get(fh,'color');
set(fh,'DefaultUicontrolUnits', 'Normalized');
pan1 = uipanel(fh, 'Title','Choix', 'position',[0.02 0.02 0.9 0.6],'back',fond);
chb1 = uicontrol(pan1,'style', 'Checkbox',...
    'position', [0.1 0.8 0.6 0.1],'String', '  Bananes');
chb2 = uicontrol(pan1,'style', 'Checkbox',...
    'position', [0.1 0.55 0.6 0.1],'String', '  Pommes', 'back',fond);
chb3 = uicontrol(pan1,'style', 'Checkbox',...
    'position', [0.1 0.3 0.6 0.1],'String', '  Oranges', 'back',fond);
chb4 = uicontrol(pan1,'style', 'Checkbox',...
    'position', [0.1 0.05 0.6 0.1],'String', '  Abricot', 'back',fond);
b2 = uicontrol(fh, 'style', 'PushButton',...
    'pos',[0.1 0.65 0.8 0.15], 'str', 'Voir', 'call', @voir);
eh = uicontrol(fh, 'style', 'Text', 'pos',[0.1 0.82 0.8 0.1]);

    function voir(obj,event)
         a='';
        if get(chb1,'value')
           a = strcat(a,get(chb1,'string'));
        end
        if get(chb2,'value')
           a = strcat(a,get(chb2,'string'));
        end
        if get(chb3,'value')
           a = strcat(a,get(chb3,'string'));
        end
        if get(chb4,'value')
           a = strcat(a,get(chb4,'string'));
        end
        set(eh,'str',a);
    end
end
