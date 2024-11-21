mon_port='COM4';
%vérifier s'il n'y a pas déjà un objet serial utilisant notre port
id = instrfind('port',mon_port);  
delete(id);
clear id;

%==== créer l'objet serial
sp = serial(mon_port);

%===  Ouvrir le port
fopen(sp);

%=== Ecrire dans le port
fwrite(sp,['B' 4 0 0 0 150],'uint8');


%=== fermer le port et supprimer l'objet serial
fclose(sp);
delete(sp);
clear sp;

