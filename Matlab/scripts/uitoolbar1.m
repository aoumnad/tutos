function uitoolbar1()
    close all;
    fh = figure('menubar','none','units','normalized','position', [0.5 0.5 0.25 0.1]);
    ed = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [0.1 0.2 0.8 0.4]);
    uitb = uitoolbar(fh);
    im = imread('images/play16.png');
    uipushtool(uitb, 'CData',im,'TooltipString','Play', 'clickedcallback', @play);
    im = imread('images/pause16.png');
    uipushtool(uitb, 'CData',im,'TooltipString','Pause', 'clickedcallback', @pause);
    im = imread('images/stop16.png');
    uipushtool(uitb, 'CData',im,'TooltipString','Stop', 'clickedcallback', @stop);
    
    function play(o, e)
        set(ed, 'string', 'Vous avez cliqué sur le bouton PLAY')    
    end

    function pause(o, e)
        set(ed, 'string', 'Vous avez cliqué sur le bouton PAUSE')    
    end

    function stop(o, e)
        set(ed, 'string', 'Vous avez cliqué sur le bouton STOP')    
    end

end

