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

st = 'ça va merci';
bt = unicode2native(st,'utf-8')
fwrite(tx, bt, 'uint8');

br = uint8(fread(rx, length(bt)))';
sr = native2unicode(br,'utf-8')

fclose(tx);
delete(tx);
clear tx;

fclose(rx);
delete(rx);
clear rx;
