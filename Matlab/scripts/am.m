function m = am(fp,fm,im)
% m = am(fp,fm,im)
% fp : fréquence de la porteuse
% fm : fréquence du signal modulant
% im : indice de modulation
T=3/fm;
te=1/fp/10;
t=0:te:T-te;
m=(1+im*cos(2*pi*fm*t)) .* sin(2*pi*fp*t);
