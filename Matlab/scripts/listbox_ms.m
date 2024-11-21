function listbox_ms()
    global lbh th1 th2
    close all
    fh = figure('Position',[400 100 250 300],'MenuBar','none','Name','ListBox',...
        'NumberTitle','off');
    set(fh,'DefaultUicontrolHorizontalAlignment','left');
    ss = {'Janvier', 'Fevrier', 'mars', 'Avril', 'Mai', 'Juin', 'Juillet',...
        'Aout', 'Septembre', 'Ocobre', 'Novembre', 'Decembre'};
    lbh = uicontrol(fh,'Style','listbox','Position',[130 185 100 105],...
        'String',ss,'Min',0,'Max',2,'Value',[]);
    th0 =  uicontrol(fh,'Style','Text','Position',[20 185 100 100]);
    set(th0,'str',...
        'utiliser CTRL+souris pour séléctionner plusieurs éléments puis cliquer sur Voir')
    th1 =  uicontrol(fh,'Style','Text','Position',[20 80 100 100],'foreg','r');
    th2 =  uicontrol(fh,'Style','Text','Position',[130 80 100 100],'foreg','b');
    b2 = uicontrol(fh,'style','push','Posit',[20 45 80 30],'str','Voir',...
        'call',{@voir, lbh, th1, th2});
    b3 = uicontrol(fh,'style','push','Posit',[20 10 80 30],...
        'str','quitter','call',@quitter);
end

function quitter(obj,event)
    disp('by-by')
    delete(gcf)
end

function voir(obj,event, lbh, th1, th2)
    i = get(lbh,'value');
    s = get(lbh,'str');
    set(th1,'str',s(i));
    % on peut aussi accédér aux éléments séléctionnées un par un
    set(th2,'str','')
    for j = i
        set(th2,'str',[get(th2,'str'); s(j)]);
    end
end