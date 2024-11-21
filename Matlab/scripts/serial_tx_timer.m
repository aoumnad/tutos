function serial_tx_timer()
    tx = [];
    fh = figure('Units', 'Normalized', 'Position',[0.6 0.6 0.15 0.3],...
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
    stst = uicontrol(fh, 'style', 'push', 'pos',[x y+g w h],...
        'str', 'Stop ', 'call', @start_stop);
    visu = uicontrol(fh, 'style', 'Edit', 'pos',[x y+2*g w h]);
    exit = uicontrol(fh, 'style', 'push', 'pos',[x y w h], 'str', 'EXIT', 'call', @quitter);
    set(fh,'CloseRequestFcn',@quitter); 

    function pop(obj,event)
        s = get(obj,'string');
        i = get(obj, 'value');
        com = s{i};
        id = instrfind('port',com);  
        delete(id);
        clear id;
        tx = serial(com);
        set(tx, 'TimerPeriod',1);
        set(tx, 'Timerfcn', @transmit)
        fopen(tx);
        set(fh, 'name', com);
    end

    function transmit(tx, event)
        m = uint16(fix(rand * 1023));
        set(visu,'string',m);
        fwrite(tx, m, 'uint16');
    end

    function start_stop(obj,event)
        if get(stst,'string') == 'Stop '
            set(tx, 'Timerfcn', '')
            set(stst, 'string','Start')
        else
            set(tx, 'Timerfcn', @transmit)
            set(stst, 'string','Stop ')
        end
    end

    function quitter(obj,event)
        delete(gcf);
        try
            if tx.status =='open'
                 fclose(tx); 
            end
            delete(tx); 
            clear tx;
        catch me
            disp(me.message)
        end
    end

end
