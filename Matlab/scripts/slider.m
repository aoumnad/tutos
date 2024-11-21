function slider()
    close all;
    fh = figure('Position',[600 250 400 350],...
        'MenuBar','none','NumberTitle','off');
    sh2 = uicontrol(fh,'Style','slider','back','g',...
           'Max',100,'Min',0,'Value',25,...
           'SliderStep',[0.05 0.1],...
           'Position',[350 25 20 300],...
           'Callback',@slider2);

    sh1 = uicontrol(fh,'Style','slider','back','c',...
           'Max',100,'Min',0,'Value',50,...
           'SliderStep',[0.05 0.1],...
           'Position',[30 25 300 20],...
           'Callback',@slider1);

    eth2 = uicontrol(fh,'Style','edit',...
           'String',num2str(get(sh1,'Value')),...
           'Position',[30 175 240 20],...
           'Callback',@edit2);

    eth1 = uicontrol(fh,'Style','edit',...
           'String',num2str(get(sh2,'Value')),...
           'Position',[30 140 240 20],...
           'Callback',@edit1);

    sth = uicontrol(fh,'Style','text','String',...
           'Entrez une valeur comprise entre 0 et 100 ou bougez les sliders',...
           'Position',[30 215 240 40]);


    function slider1(obj,event)
        val = get(obj,'Value');
        set(eth1,'String',round(val));
    end

    function slider2(obj,event)
        val = get(obj,'Value');
        set(eth2,'String',round(val));
    end

    function edit1(obj, event)
        val = str2double(get(obj,'String'));
        mi = get(sh1,'Min');
        ma = get(sh1,'Max');
        val = max(val, mi);
        val = min(val, ma);
        set(sh1,'Value',val);
    end

    function edit2(obj, event)
        val = str2double(get(obj,'String'));
        mi = get(sh1,'Min');
        ma = get(sh1,'Max');
        val = max(val, mi);
        val = min(val, ma);
        set(sh2,'Value',val);
    end


end