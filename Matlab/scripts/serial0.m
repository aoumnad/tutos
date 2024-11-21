mon_port='COM4';
%v�rifier s'il n'y a pas d�j� un objet serial utilisant notre port
id = instrfind('port',mon_port);  
delete(id);
clear id;

%==== cr�er l'objet serial
sp = serial(mon_port);

%===  Ouvrir le port
fopen(sp);

%=== Ecrire dans le port
fwrite(sp,['B' 4 0 0 0 150],'uint8');


%=== fermer le port et supprimer l'objet serial
fclose(sp);
delete(sp);
clear sp;

