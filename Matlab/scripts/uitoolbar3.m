function uitoolbar3()
    % Les fonctions callback sont imbriqu�es dans la fonction principale pour
    % partager leurs variables avec elle
    %close all;
    fh = figure('menubar','none','units','normalized','position', [0.5 0.5 0.25 0.1]);
    ed = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [0.1 0.2 0.8 0.4]);
    uitoolbar(fh);
    ico_button('images/play.ico','Play', @play);
    ico_button('images/pause.ico', 'Pause', @pause);
    ico_button('images/stop.ico', 'Stop', @stop);
    ico_button('images/nexttrack.ico', 'Suivant', @next);
    ico_button('images/previoustrack.ico', 'Pr�c�dent', @previous);
    ico_button('images/music.ico', 'Musique', @musique);
  
    function play(o, e)
        set(ed, 'string', 'Vous avez cliqu� sur le bouton PLAY')  
    end

    function pause(o, e)
        set(ed, 'string', 'Vous avez cliqu� sur le bouton PAUSE')  
    end

    function stop(o, e)
        set(ed, 'string', 'Vous avez cliqu� sur le bouton STOP')  
    end

    function next(o, e)
        set(ed, 'string', 'Vous avez cliqu� sur le bouton SUIVANT')  
    end

    function previous(o, e)
        set(ed, 'string', 'Vous avez cliqu� sur le bouton PRECEDENT')  
    end

    function musique(o, e)
        set(ed, 'string', 'Vous avez cliqu� sur le bouton MUSIQUE')  
    end

end

function ico_button(imfile, ttip, call)
    % lire le fichier, on obtient une image index�e
    % idx: matrice des indices, pal : palette de couleurs, trans=matrice de
    % transparence: trans=1 => pixel transparent (couleur de fond)
    [idx, pal, tran] = imread(imfile);

    % ajouter la couleur de fond en queue de palette. Dans le cas d'une
    % image 256 couleurs, son indice sera 256, il faut donc changer le type
    % de la patrices des indices de uint8 � uint16
    bgcol = get(0,'factoryUicontrolBackgroundColor');
    pal = [pal; bgcol];
    idx = uint16(idx); %pour recevoir des valeur > 255 (derni�re ligne de pal)

    %remplacer les indices (transparent) de idx par l'indice de la derni�re ligne de pal
    %les indices sont incr�mnet�s au moment de l'acc�s � la palette.(0 --> 1�re ligne)
    idx(tran == 1) = length(pal)-1;

    %transformer l'image index�e en image RGB
    im = ind2rgb(idx, pal);

    % rajouter l'image obtenue � la barre d'outil courante
    uipushtool('CData',im,'TooltipString',ttip, 'ClickedCallback', call);
    uitoggletool('CData',im,'TooltipString',ttip, 'ClickedCallback', call);
end