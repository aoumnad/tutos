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

st = 'Comment ça va ?';
fwrite(tx, st, 'uint8');
inp = uint8(fread(rx, length(st)))';
sr = char(inp)

fclose(tx);
delete(tx);
clear tx;

fclose(rx);
delete(rx);
clear rx;
