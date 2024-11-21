function uitoolbar5()
    % Les fonctions callback sont imbriqu�es dans la fonction principale pour
    % partager leurs variables avec elle
    %close all;
    fh = figure('menubar','none','units','normalized','position', [0.5 0.3 0.25 0.3]);
    x = 0.1;
    y = 0.05;
    w = 0.8;
    h = 0.1;
    g = h +0.05;
    ed1 = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [x y w h]);
    ed2 = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [x y+g w h]);
    ed3 = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [x y+2*g w h]);
    ed4 = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [x y+3*g w h]);
    ed5 = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [x y+4*g w h]);
    uitoolbar(fh);
    ico_button('images/play.ico','Play', @playon, @playoff);
    ico_button('images/pause.ico', 'Pause', @pauseon, @pauseoff);
    ico_button('images/stop.ico', 'Stop', @stopon, @stopoff);
    ico_button('images/nexttrack.ico', 'Suivant', @nexton, @nextoff);
    ico_button('images/previoustrack.ico', 'Pr�c�dent', @previouson, @previousoff);
    S = {'rlach�' 'Enfonc�'};
    
    function playon(obj, event)
        set(ed5, 'string', 'Le bouton PLAY est ON')  
    end
    function playoff(obj, event)
        set(ed5, 'string', 'Le bouton PLAY est OFF')  
    end

    function pauseon(obj, event)
        set(ed4, 'string', 'Le bouton PAUSE est ON')  
    end
    function pauseoff(obj, event)
        set(ed4, 'string', 'Le bouton PAUSE est OFF')  
    end

    function stopon(obj, event)
        set(ed3, 'string', 'Le bouton STOP est ON')  
    end
    function stopoff(obj, event)
        set(ed3, 'string', 'Le bouton STOP est OFF')  
    end

    function nexton(obj, event)
        set(ed2, 'string', 'Le bouton NEXT est ON')  
    end
    function nextoff(obj, event)
        set(ed2, 'string', 'Le bouton NEXT est OFF')  
    end

    function previouson(obj, event)
        set(ed1, 'string', 'Le bouton PR�CEDENT est ON')  
    end
    function previousoff(obj, event)
        set(ed1, 'string', 'Le bouton PR�CEDENT est OFF')  
    end

end

function ph = ico_button(imfile, ttip, oncall, offcall)
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
    uitoggletool('CData',im,'TooltipString',ttip, 'OnCallback', oncall, 'OffCallback', offcall);
    
end