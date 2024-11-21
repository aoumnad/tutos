function listbox()
    global lbh th
    close all
    fh = figure('Position',[400 100 250 200],'MenuBar','none','Name','ListBox','NumberTitle','off');
    ss = {'Janvier', 'Fevrier', 'mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Ocobre', 'Novembre', 'Decembre'};
    lbh = uicontrol(fh,'Style','listbox','String',ss,'Position',[30 80 130 100],'callb',@voir);
    th =  uicontrol(fh,'Style','Text','Position',[30 50 200 20],'foreg','r');
    b2 = uicontrol(fh,'style','push','Posit',[30 10 80 30],'str','quitter','call',@quitter);
end

function quitter(obj,event)
    disp('by-by')
    delete(gcf)
end

function voir(obj,event)
    global lbh th
    i = get(lbh,'value');
    s = get(lbh,'str');
    set(th,'str',['Elément séléctionné -->  ' s{i}]);
end