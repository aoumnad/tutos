function elctro()
    close all;
    fh = figure('menubar', 'none','units','normalized','position',[0.2 0.3 0.6 0.5]);
    mm1 = uimenu(fh, 'Label', 'Filtres');
        uimenu(mm1,'Label','Passe bas 1er Ordre','Callback',@pb1);
        uimenu(mm1,'Label','Passe haut 1er Ordre','Callback',@ph1);
        uimenu(mm1,'Label','Passe bas 2ème Ordre','Callback',@pb2);
        uimenu(mm1,'Label','Passe haut 2ème Ordre','Callback',@ph2);
        uimenu(mm1,'Label','Passe bande accordé','Callback',@pbde);
    mm2 = uimenu(fh, 'Label', 'Oscillateurs');
        m21=uimenu(mm2,'Label','Pont de Wien','Callback',@wien);
        m22=uimenu(mm2,'Label','à déphasage','Callback',@phaseshift);
        m23=uimenu(mm2,'Label','Colpitt','Callback',@colpitt);
            mm4 = uimenu(m22,'Label','type A','Callback',@afaire);
            mm5 = uimenu(m22,'Label','type B','Callback',@afaire);
        
    ax1 = axes('position', [0.05 0.28 0.43 0.7]);
    ax2 = axes('position', [0.55 0.28 0.43 0.7]);
    ed = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [0.1 0.1 0.6 0.1] );
    f = logspace(2,6,200);
    fo = 10000;
    z = 0.5;
    function pb1(obj,event)
        h = 1 ./ (1 + j*f/fo);
        trace(h)
    end
    function ph1(obj,event)
        h = j * f/fo ./ (1 + j*f/fo);
        trace(h)
    end

    function pb2(obj,event)
        h = 1 ./ (1 + 2*z*j*f/fo - (f/fo).^2);
        trace(h)
    end

    function ph2(obj,event)
        h = - (f/fo).^2 ./ (1 + 2*z*j*f/fo - (f/fo).^2);
        trace(h)
    end

    function pbde(obj,event)
        h = j * f/fo ./ (1 + 2*z*j*f/fo - (f/fo).^2);
        trace(h)
    end

    function trace(h)
        H = abs(h);
        Hdb = 20 * log10(H);
        semilogx(ax1,f,Hdb);grid(ax1);
        p = angle(h) * 180 / pi;
        semilogx(ax2,f,p);grid(ax2);
        
    end
    function wien(obj,event)
        set(ed, 'string', 'Vous avez choisi Oscillateur à pont de wien')
    end
    function phaseshift(obj,event)
        set(ed, 'string', ['Vous avez choisi: Oscillateur '   get(obj,'Label')])
    end
    function colpitt(obj,event)
        set(ed, 'string', ['Vous avez choisi: Oscillateur '   get(obj,'Label')])
    end
    function afaire(obj,event)
        set(ed, 'string', ['Vous avez choisi: Oscillateur '  get(get(obj,'parent'),'Label') ' ' get(obj,'Label')])
    end

end

