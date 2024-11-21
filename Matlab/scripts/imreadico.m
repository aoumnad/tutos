% lire le fichier, on obtient une image ind�x�e
% idx=matrice des indices, pal=palette de couleurs, trans=matrice de
% transparence: trans=1 => pixel transparent (couleur de fond)
[idx, pal, tran] = imread('images/nexttrack.ico'); 

% ajouter la couleur de fond en queue de palette
bgcol = get(0,'factoryUicontrolBackgroundColor');
pal = [pal; bgcol];
idx = uint16(idx); %pour recevoir des valeur > 255 (derni�re ligne de pal) 

%remplacer les indices (transparent) de idx par l'indice de la derni�re ligne de pal 
idx(tran == 1) = length(pal);

%transformer l'image ind�x�e en image RGB
im = ind2rgb(idx, pal);

% rajouter l'image obtenue � la barre d'outil courante 
uipushtool('cdata',im);
