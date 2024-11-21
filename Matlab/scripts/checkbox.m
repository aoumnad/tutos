% Exemple contrôle Checkbox
function checkbox()
    global pan1 chb1 chb2 chb3 chb4
    close all
    fh = figure('Units', 'Normalized', 'Position',[0.6 0.6 0.1 0.3],'MenuBar','none');
    fond = get(fh,'color');
    set(fh, 'defaultUicontrolUnits','normalized');
    pan1 = uipanel(fh, 'Title','Choix', 'position',[0.02 0.02 0.9 0.6],'back',fond);
    chb1 = uicontrol(pan1,'style', 'Checkbox','position', [0.1 0.8 0.6 0.1],...
        'String', 'Bananes', 'back',fond);
    chb2 = uicontrol(pan1,'style', 'Checkbox','position', [0.1 0.55 0.6 0.1],...
        'String', 'Pommes', 'back',fond);
    chb3 = uicontrol(pan1,'style', 'Checkbox','position', [0.1 0.3 0.6 0.1],...
        'String', 'Oranges', 'back',fond);
    chb4 = uicontrol(pan1,'style', 'Checkbox','position', [0.1 0.05 0.6 0.1],...
        'String', 'abricot', 'back',fond);
    b1 = uicontrol(fh, 'style', 'push', 'pos',[0.1 0.82 0.8 0.15],...
        'str', 'Test 1', 'call', @test1);
    b2 = uicontrol(fh, 'style', 'push', 'pos',[0.1 0.65 0.8 0.15],...
        'str', 'Test 2', 'call', @test2);
end

function test1(obj,event)
    global pan1
    hh = get(pan1,'children') %retourne un tableau d'identificateurs
    disp(' ');
    for i = 1:length(hh)
        s = get(hh(i),'string');
        v = get(hh(i),'value');
            if v
                disp(s);
            end
    end
end

function test2(obj,event)
    global chb1 chb2 chb3 chb4
    disp(' ');
    if get(chb1,'value')
       disp(get(chb1,'string'));
    end
    if get(chb2,'value')
       disp(get(chb2,'string'));
    end
    if get(chb3,'value')
       disp(get(chb3,'string'));
    end
    if get(chb4,'value')
       disp(get(chb4,'string'));
    end
end
