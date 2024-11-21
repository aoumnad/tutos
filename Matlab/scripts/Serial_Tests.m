clear all;
txp ='COM4';
id = instrfind('port',txp);  
delete(id);
clear id;
tx = serial(txp);
fopen(tx);

rxp ='COM5';
id = instrfind('port',rxp);  
delete(id);
clear id;
rx = serial(rxp);
fopen(rx);

fwrite(tx,[65  195  167  195  169   66],'uint8');
inp = uint8(fread(rx, 6))'
s = native2unicode(inp, 'utf-8')
whos
%transmettre une chaine
%fwrite(sp, 'ABéçD?µ');

%=== fermer le port et supprimer l'objet serial
fclose(tx);
delete(tx);
clear tx;

fclose(rx);
delete(rx);
clear rx;
