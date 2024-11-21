function uimenu0()
    fh = figure('menubar', 'none','units','normalized','Posit', [0.3 0.3 0.4 0.2]);
    m1 = uimenu(fh, 'label' ,'Menu 1');
        m11 = uimenu(m1, 'label','Menu-1-A', 'Accelerator','A','callback',@menu1a);
        m12 = uimenu(m1, 'label','Menu-1-B', 'Accelerator','B','callback',@menu1b);
        m13 = uimenu(m1, 'label','Menu-1-C', 'Accelerator','C','callback',@menu1c);
        m14 = uimenu(m1, 'label','Menu-1-D', 'Accelerator','D','callback',@menu1d);
    m2 = uimenu(fh, 'label' ,'Menu 2');
        m21 = uimenu(m2, 'label','Menu-2-A', 'callback',@menu2a);
        m22 = uimenu(m2, 'label','Menu-2-B');
            uimenu(m22, 'label','Menu-2-B-V1', 'callback',@menu2b);
            uimenu(m22, 'label','Menu-2-B-V2', 'callback',@menu2b);
            uimenu(m22, 'label','Menu-2-B-V3', 'callback',@menu2b);
        m23 = uimenu(m2, 'label','Menu-2-C', 'callback',@menu2c);
        m24 = uimenu(m2, 'label','Menu-2-D', 'callback',@menu2d);
    ed = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [0.1 0.1 0.8 0.2] );

    function menu1a(obj,event)
        pere = get(obj, 'parent');
        set(ed,'string',['Vous avez sélectionné ' get(pere, 'Label') '--> ' get(obj,'label')])
    end
    function menu1b(obj,event)
        pere = get(obj, 'parent');
        set(ed,'string',['Vous avez sélectionné ' get(pere, 'Label') '--> ' get(obj,'label')])
    end
    function menu1c(obj,event)
        pere = get(obj, 'parent');
        set(ed,'string',['Vous avez sélectionné ' get(pere, 'Label') '--> ' get(obj,'label')])
    end
    function menu1d(obj,event)
        pere = get(obj, 'parent');
        set(ed,'string',['Vous avez sélectionné ' get(pere, 'Label') '--> ' get(obj,'label')])
    end
    function menu2a(obj,event)
        pere = get(obj, 'parent');
        set(ed,'string',['Vous avez sélectionné ' get(pere, 'Label') '--> ' get(obj,'label')])
    end
    function menu2b(obj,event)
        p = get(obj, 'parent');
        gp = get(p, 'parent');
        pl = get(p, 'Label');
        gpl = get(gp, 'Label');
        ol = get(obj, 'label');
        set(ed,'string',['Vous avez sélectionné ' , gpl, '--> ' pl '--> ' ol])
    end
    function menu2c(obj,event)
        pere = get(obj, 'parent');
        set(ed,'string',['Vous avez sélectionné ' get(pere, 'Label') '--> ' get(obj,'label')])
    end
    function menu2d(obj,event)
        pere = get(obj, 'parent');
        set(ed,'string',['Vous avez sélectionné ' get(pere, 'Label') '--> ' get(obj,'label')])
    end
end
