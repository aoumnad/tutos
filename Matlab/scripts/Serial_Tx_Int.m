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

ti = 888666444;
%tb = typecast(uint32(222222222),'uint8');
fwrite(tx,ti,'uint32');
rb = fread(rx, 4)
ri = typecast(uint8(rb),'uint32')

%=== fermer le port et supprimer l'objet serial
fclose(tx);
delete(tx);
clear tx;

fclose(rx);
delete(rx);
clear rx;
