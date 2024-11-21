function uitoolbar2()
    % Les fonctions callback sont imbriquées dans la fonction principale pour
    % partager leurs variables avec elle
    %close all;
    fh = figure('menubar','none','units','normalized','position', [0.5 0.5 0.25 0.1]);
    ed = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [0.1 0.2 0.8 0.4]);
    uitoolbar(fh);
    png_button('images/play.png','Play', @play);
    png_button('images/pause.png', 'Pause', @pause);
    png_button('images/stop.png', 'Stop', @stop);
    png_button('images/nexttrack.png', 'Suivant', @next);
    png_button('images/previoustrack.png', 'Précédent', @previous);
    png_button('images/music.png', 'Musique', @musique);
   
    function play(o, e)
        set(ed, 'string', 'Vous avez ciqué sur le bouton PLAY')   
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

function png_button(imfile, ttip, call)
    % récupérer la couleur de fond des objets matlab
    bgcol = get(0,'factoryUicontrolBackgroundColor');
    % lire le fichier image et affecter la couleur de fond aux zones
    % transparentes
    im = imread(imfile,'png','BackgroundColor',bgcol);
    % si la taille de l'image est supérieure à 16x16, la redimensionner
    l = size(im);
    if l(1) > 16 || l(2) > 16
        im = imresize(im, [16 16]);
    end
    % rajouter l'image à la barre d'outil courante.
    uipushtool('CData',im,'TooltipString',ttip, 'ClickedCallback', call);
end
