function handles_nested()
    % Utilisation des fonctions imbriqu�se pour partager les donn�es avec la
    % fonction principale
    close all
    fh = figure('Units', 'Normalized', 'Position',[0.6 0.6 0.15 0.15], 'MenuBar', 'none');
    set(fh, 'DefaultUicontrolUnits',  'normalized') ;
    e1 = uicontrol(fh, 'style', 'EDIT', 'Posit',[0.5 0.7 0.3 0.2], 'str', 22);
    e2 = uicontrol(fh, 'style', 'Edit', 'Posit',[0.5 0.4 0.3 0.2], 'str', '44');
    e3 = uicontrol(fh, 'style', 'EDIT', 'Posit',[0.5 0.1 0.3 0.2]);
    b1 = uicontrol(fh, 'style', 'pushbutton', 'position',[0.1 0.4 0.3 0.2],...
        'str', 'Alpha', 'call', @alphaa);
    b2 = uicontrol(fh, 'style', 'pushbutton', 'position',[0.1 0.1 0.3 0.2],...
        'str', 'Num', 'call', @numm);

    function numm(obj,event)
        n1 = str2num(get(e1, 'string'));
        n2 = str2num(get(e2, 'string'));
        set(e3, 'string',n1+n2);
    end

    function alphaa(obj,event)
        s1 = get(e1, 'string');
        s2 = get(e2, 'string');
        set(e3, 'string',[s1 s2]);
    end

end
