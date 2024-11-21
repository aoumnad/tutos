function serial_rx_timer()
    rx = [];
    fh = figure('Units', 'Normalized', 'Position',[0.44 0.6 0.15 0.3],...
        'MenuBar','none', 'NumberTitle', 'off','name', 'Déconnecté');
    set(fh, 'DefaultUicontrolUnits',  'normalized') ;
    h = 0.12;  % hauteur des boutons
    w = 0.6;   % largeur des boutons
    x = 0.2;
    y = 0.05;
    g = h + 0.05;
    poph = uicontrol(fh, 'style','popup','position',[x y+4*g w h],...
        'back', 'c', 'fore', 'r','call',@pop);
    avcp = getAvailableComPort;
    set(poph, 'string', avcp);
    volt = uicontrol(fh, 'style', 'edit', 'pos',[x y+g w h]);
    nadc = uicontrol(fh, 'style', 'edit', 'pos',[x y+2*g w h]);
    exit = uicontrol(fh, 'style', 'push', 'pos',[x y w h], 'str', 'EXIT', 'call', @quitter);
    set(fh,'CloseRequestFcn',@quitter); 

    function pop(obj,event)
        s = get(obj,'string');
        i = get(obj, 'value');
        com = s{i};
        id = instrfind('port',com);  
        delete(id);
        clear id;
        rx = serial(com);
        set(rx, 'TimerPeriod',0.5);
        set(rx, 'Timerfcn', @lire)
        fopen(rx);
        set(fh, 'name', com);
    end

    function lire(rx, event)
        a = get(rx,'BytesAvailable');
        if a > 1
            rb = fread(rx, 2);
            ri = typecast(uint8(rb),'uint16');
            set(nadc,'string', ri);
            v = single(ri) * 5 / 1024;
            vs = num2str(v,'%4.2f');
            set(volt, 'string', vs);
        end   
    end

    function quitter(obj,event)
        delete(gcf);
        try
            if rx.status =='open'
                 fclose(rx); 
            end
            delete(rx); 
            clear rx;
        catch me
            disp(me.message)
        end
    end

end
