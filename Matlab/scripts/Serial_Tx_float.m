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

ti = 345.6789;
fwrite(tx,ti,'single');
rb = fread(rx, 4)
ri = typecast(uint8(rb),'single')

%=== fermer le port et supprimer l'objet serial
fclose(tx);
delete(tx);
clear tx;

fclose(rx);
delete(rx);
clear rx;
