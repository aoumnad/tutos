% Exemple contrôle Checkbox
function checkbox_hndl()


close all
S.fh = figure('Units', 'Normalized', 'Position',[0.6 0.6 0.2 0.3],...
    'MenuBar','none','NumberTitle','off', 'name','Checkbox - structure');
fond = get(S.fh,'color');
set(S.fh,'DefaultUicontrolUnits','Normalized')
S.pan1 = uipanel(S.fh, 'Title','Choix', 'position',[0.02 0.02 0.9 0.6],'back',fond);
S.chb1 = uicontrol(S.pan1,'style', 'Checkbox','position', [0.1 0.8 0.6 0.1],'String', 'Bananes', 'back',fond);
S.chb2 = uicontrol(S.pan1,'style', 'Checkbox','position', [0.1 0.55 0.6 0.1],'String', 'Pommes', 'back',fond);
S.chb3 = uicontrol(S.pan1,'style', 'Checkbox','position', [0.1 0.3 0.6 0.1],'String', 'Oranges', 'back',fond);
S.chb4 = uicontrol(S.pan1,'style', 'Checkbox','position', [0.1 0.05 0.6 0.1],'String', 'abricot', 'back',fond);
% S.b1 = uicontrol(S.fh, 'style', 'push', 'pos',[0.1 0.82 0.8 0.15], 'str', 'Test 1', 'call', @test1);
S.b2 = uicontrol(S.fh, 'style', 'push', 'pos',[0.1 0.65 0.8 0.15], 'str', 'Test 2', 'call', {@test2,S});

end

% function test1(obj,event)
%     global pan1
%     hh = get(pan1,'children') %retourne un tableau d'identificateurs
%     disp(' ');
%     for i = 1:length(hh)
%         s = get(hh(i),'string');
%         v = get(hh(i),'value');
%             if v
%                 disp(s);
%             end
%     end
% end

function test2(obj,event,S)
    
    disp(' ');
    if get(S.chb1,'value')
       disp(get(S.chb1,'string'));
    end
    if get(S.chb2,'value')
       disp(get(S.chb2,'string'));
    end
    if get(S.chb3,'value')
       disp(get(S.chb3,'string'));
    end
    if get(S.chb4,'value')
       disp(get(S.chb4,'string'));
    end

end
