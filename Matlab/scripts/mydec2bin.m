function b=mydec2bin(d)
    %b = mydec2bin(d)
    %d : scalaire ou vecteur
    %algorithme : division en échelle par 2
    d=d(:); %convertit le vecteur d en colonne
    b=[];
    while any(d)
        c=rem(d,2);
        d=fix(d/2);
        b=[c b];
    end
end