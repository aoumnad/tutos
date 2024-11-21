function serial_steper()
close all
fh = figure('Units', 'Normalized', 'Position',[0.6 0.6 0.2 0.3],...
    'MenuBar','none', 'NumberTitle', 'off','name', 'Déconnecté');
set(fh,'CloseRequestFcn',@quitter); % si o essaye de fermer la fenetre, la fonction quitter est invoquée
set(fh, 'DefaultUicontrolUnits',  'normalized') ;
h = 0.12;  % hauteur des boutons
w = 0.4;   % largeur des boutons
x = 0.05;
y = 0.05;
g = h + 0.05;
exit = uicontrol(fh, 'style', 'push', 'pos',[x y w h], 'str', 'EXIT', 'call', @quitter);
free = uicontrol(fh, 'style', 'push', 'pos',[x y+g w h], 'str', 'Free', 'enable','off','call', @free);
steps = uicontrol(fh, 'style', 'Edit', 'pos',[x y+4*g w h], 'str', 100);
gauche = uicontrol(fh, 'style', 'push', 'pos',[x y+2*g w h], 'str', 'Gauche', 'enable','off', 'call', {@gauche steps});
droite = uicontrol(fh, 'style', 'push', 'pos',[x y+3*g w h], 'str', 'Droite', 'enable','off', 'call', {@droite steps});
label = uicontrol(fh, 'style', 'Text', 'pos',[x y+5*g-0.05 w h/2],...
    'str', 'Nombre de pas', 'backg',get(fh,'color'));
conso = uicontrol(fh, 'style', 'Text', 'pos',[0.5 y w*1.2 5*h], 'horiz', 'left');
poph = uicontrol(fh, 'style','popup','position',[0.5 y+4*g w h],...
    'back', 'c', 'fore', 'r','call',{@pop, free, gauche, droite, conso});
avcp = getAvailableComPort;
set(poph, 'string', avcp);

end

function quitter(obj,event)
global sp;
if ~isempty(sp)
    if isvalid(sp)
        if strcmp(sp.status,'open')
             fclose(sp); 
        end
    delete(sp); 
    clear sp;
    end
end
delete(gcf);
disp('By')
end

function gauche(obj,event, steps, sp)
global sp;
N = str2num(get(steps,'string'));
fwrite(sp,['G' 1 N],'uint8');
end

function droite(obj,event, steps)
global sp;
N = str2num(get(steps,'string'));
fwrite(sp,['D' 1 N],'uint8');
end

function free(obj,event)
global sp;
fwrite(sp,'F');
end

function sp = pop(obj,event, free, gauche, droite, conso)
global sp;
s = get(obj,'string');
i = get(obj, 'value');
com = s{i};
id = instrfind('port',com);  
delete(id);
clear id;
sp = serial(com);
sp.BytesAvailableFcnMode = 'byte';
sp.BytesAvailableFcnCoun =1;
sp.BytesAvailableFcn = {@LirePort conso};
fopen(sp);

set(gcf, 'name', com);
set(free,'enable', 'on');
set(gauche,'enable', 'on');
set(droite,'enable', 'on');
end

function LirePort(sp,event, conso)
       in = fread(sp,1);  % in est un nombre
       inc = char(in);    % inc est un caractère
       ins = {inc};       % ins = matrice de cellules contenant le caractère inc
       S = get(conso,'string'); % {contenu actuel de la console d'affichage}
       if isempty(S)
           S = ins;   % la console était vide
       elseif in == 13     % 13 = CR = '\r' ne provoque pas de retour à la ligne dans la fenetre Text
           S = [S; {''}];  % alors on colle une ligne vide à la fin de la matrice de cellules
       else
           t = size(S); % [l  c]  
           n = t(1);  % = l = indice dérrnière ligne
           S(n) = strcat(S(n),ins);
       end
       set(conso,'string',S);

end

