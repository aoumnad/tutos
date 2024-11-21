function timer_anim()
    close all;
    pause query
    fh = figure('menu','none','Units','Normal', 'pos', [0.25 0.25 0.5 0.5]);
    ax = axes('Units','Normal', 'pos', [0.25 0.05 0.73 0.9],'NextPlot','add');
    set(ax,'xtick',[], 'ytick', [])
    set(fh, 'defaultUicontrolUnits','normalized');
    ext = uicontrol(fh, 'style','pushbutton', 'string', 'EXIT',...
        'pos',[0.04 0.05 0.15 0.1], 'callback',@extcall);
    strtstp = uicontrol(fh, 'style','pushbutton', 'string', 'START / STOP',...
            'pos',[0.04 0.2 0.15 0.1], 'callback',@strtstpcb);
    vu = uicontrol(fh, 'style','Text', 'pos',[0.04 0.35 0.15 0.15], 'foreg', 'b');
    tmr = timerfindall; % chercher s'il y'a des timer qui trainent
    delete(tmr);
    tmr = timer('ExecutionMode', 'fixedRate', 'Period', 0.05,...
      'TasksToExecute',100, 'StartFcn', @strt, 'StopFcn', @stp, 'TimerFcn',@tmrcall);
    k = 4;
    p = pi/50;
    t = 0 : p : 2*pi;
    x = sin(t);
    y = sin(k*t);
    plot(x,y,':');
    m = plot(0, 0, 'o', 'Markersize',10, 'MarkerFaceColor','g','EraseMode','xor');
    axis([-1.2 1.2 -1.2 1.2]);
    t = 0;
    x = 0;
    y = 0;
    start(tmr);
  
    function strt(obj, event)
           tic;
           set(vu, 'string', {'' 'C''est parti ' 'pour un tour'})  
    end

    function stp(obj, event)
           tt = num2str(toc);
           ttt = ['en ' tt ' s'];
           set(vu, 'string', {'' 'C''est fait' ttt});
           [yy, ff]=wavread('c:\windows\media\notify');
           sound(yy,ff,16);
    end

    function tmrcall(obj, event)
        m = plot(x, y, 'o', 'Markersize',10, 'MarkerFaceColor','g','EraseMode','xor');
        t = t + p;
        x = sin(t);
        y = sin(k*t);
        m = plot(ax, x, y, 'o', 'Markersize',10, 'MarkerFaceColor','g','EraseMode','xor');
    end

    function strtstpcb(obj, event)
        s = get(tmr,'running');
        if strcmp(s, 'off')
            start(tmr);
        else
            stop(tmr);
        end
    end

    function extcall(obj,event)
        s = get(tmr,'running');
        if strcmp(s, 'on')
            stop(tmr);
        end
        delete(tmr);
        clear tmr;
        delete(fh);
    end
       
end 
