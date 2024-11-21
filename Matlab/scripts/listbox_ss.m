function listbox_ss()
    close all
    fh = figure('MenuBar','none','Position',[400 100 250 200],...
        'Name','ListBox','NumberTitle','off');
    th =  uicontrol(fh,'Style','Text','Position',[30 50 200 20],'foreg','r');
    b2 = uicontrol(fh,'style','push','Posit',[30 10 80 30],...
        'str','quitter','call',@quitter);
    ss = {'Janvier', 'Fevrier', 'mars', 'Avril', 'Mai', 'Juin', 'Juillet',...
        'Aout', 'Septembre', 'Ocobre', 'Novembre', 'Decembre'};
    lbh = uicontrol(fh,'Style','listbox','Position',[30 80 130 100],...
        'String',ss,'callb',{@voir, th});
end

function quitter(obj,event)
    disp('by-by')
    delete(gcf)
end

function voir(obj,event,th)
    i = get(obj,'value');
    s = get(obj,'string');
    set(th,'str',['Elément séléctionné -->  ' s{i}]);
end