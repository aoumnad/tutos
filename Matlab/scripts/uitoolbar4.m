function uitoolbar4()
    % Les fonctions callback sont imbriquées dans la fonction principale pour
    % partager leurs variables avec elle
    %close all;
    fh = figure('menubar','none','units','normalized','position', [0.5 0.5 0.25 0.1]);
    ed = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [0.1 0.2 0.8 0.4]);
    uitoolbar(fh);
    ico_button('images/play.ico','Play', @play);
    ico_button('images/pause.ico', 'Pause', @pause);
    ico_button('images/stop.ico', 'Stop', @stop);
    ico_button('images/nexttrack.ico', 'Suivant', @next);
    ico_button('images/previoustrack.ico', 'Précédent', @previous);
    ico_button('images/music.ico', 'Musique', @musique);
   
    function play(o, e)
        set(ed, 'string', 'Vous avez cliqué sur le bouton PLAY')   
    end

    function pause(o, e)
        set(ed, 'string', 'Vous avez cliqué sur le bouton PAUSE')   
    end

    function stop(o, e)
        set(ed, 'string', 'Vous avez cliqué sur le bouton STOP')   
    end

    function next(o, e)
        set(ed, 'string', 'Vous avez cliqué sur le bouton SUIVANT')   
    end

    function previous(o, e)
        set(ed, 'string', 'Vous avez cliqué sur le bouton PRECEDENT')   
    end

    function musique(o, e)
        set(ed, 'string', 'Vous avez cliqué sur le bouton MUSIQUE')   
    end

end

function ico_button(imfile, ttip, call)
    [idx, map, alpha] = imread(imfile);
    im = ind2rgb(idx, map);  % indéxé vers RGB
    
    % sans transparence
    uipushtool('CData',im,'TooltipString',ttip, 'ClickedCallback', call);
    
    %avec transparence
    alpha = alpha(:,:,[1 1 1]); %cat(3,alpha,alpha,alpha)
    bgcol = get(0,'factoryUicontrolBackgroundColor');
    im(alpha == 1) = bgcol(1);
    uipushtool('CData',im,'TooltipString',ttip, 'ClickedCallback', call);
end

