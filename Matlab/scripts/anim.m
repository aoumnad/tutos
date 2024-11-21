function anim()
    close all;
    fh = figure('menu','none','Units','Normal', 'pos', [0.25 0.25 0.5 0.5]);
    ax = axes('Units','Normal', 'pos', [0.25 0.05 0.73 0.9]);
    %axis([0 10 0 10]);
    b = 0.05;
    g = 0.04;
    w = 0.15;
    h = 0.1;
    gp = h + 0.05;
    set(fh, 'defaultUicontrolUnits','normal');
    ext = uicontrol(fh, 'style','pushbutton', 'string', 'EXIT','pos',[g b w h], 'callback',@extcall);
    stp = uicontrol(fh, 'style','pushbutton', 'string', 'STOP','pos',[g b+gp w h], 'callback',@stpcall);
    strt = uicontrol(fh, 'style','pushbutton', 'string', 'START','pos',[g b+2*gp w h], 'callback',@strtcall);
    tt = 0;
    tmr = timer('ExecutionMode', 'fixedRate', 'TimerFcn',@tmrcall, 'Period', 0.5, 'TasksToExecute',100);
    start(tmr);
    function tmrcall(obj, event)
        t = 0 : 0.1 : 6.3;
        x = sin(t);
        y = sin(2*t);
        plot(x,y,':');
        axis([-1.2 1.2 -1.2 1.2]); hold on;
        tt = tt + 0.1;
        x = sin(tt);
        y = sin(2*tt);
        m = plot(ax, x, y, 'o');hold off;
        set(m,'Markersize',10, 'MarkerFaceColor','g');
    end

    function strtcall(obj, event)
        s = get(tmr,'running')
        if strcmp(s, 'off')
            start(tmr);
        end
    end
    function stpcall(obj, event)
        s = get(tmr,'running');
        if strcmp(s, 'on')
            stop(tmr);
        end
    end

    function extcall(obj,event)
        delete(fh);
        delete(tmr);
        clear tmr;
    end
        
end
