function Serial_monitor()
    sp = serial('BIDON');
    lin = 1;
    col = 1;
    HF=400;
    WF=600;
    fh=figure('pos',[600 180 WF HF],'menubar','none',...
        'NumberTitle','off','CloseRequestFcn',@quitter);
    gap = 5;
    hpop = 30;
    wpop = 100;
    popy = HF-hpop-gap;
    avcp = getvalidports;
    %avcp = {'COM1','COM2','COM3','COM4','COM5','COM6','COM7','COM8','COM9','COM10',...
    %    'COM11','COM12','COM13','COM14','COM15','COM16','COM17','COM18','COM19'};
    COM_POP = uicontrol(fh, 'style','popup','position',[10 popy wpop hpop],...
        'back', 'c', 'fore', 'r','string',avcp,'call',@pop);

    he1=20;
    e1y = popy - he1 -gap;
    we1 = 370;
    e1 = uicontrol(fh, 'style', 'EDIT', 'Posit',[10 e1y we1 20],...
        'horizon','left','back',[0.8 1 0.8]);
    
    btx = uicontrol(fh, 'style', 'pushbutton', 'position',[10+we1+gap e1y 50 20],...
        'str', 'Tx', 'call', @transmit,'back',[0.8 0.8 0.4]);
    bCLR1 = uicontrol(fh, 'style', 'pushbutton', 'position',[10+we1+gap+70 e1y 50 20],...
        'str', 'CLEAR', 'call', @cleare1,'back',[0.8 0.8 0.4]);

    hlpmsg = {'Le champs de transmission permet de transmettre un mellange de texte et de nombres en décimal ou en Hexadécimal';...
        'Si on tape W 35 ABC ''123'' 37568 0x41A2 ''0x4253''';...
        'On transmet le caractère W, le nombre décimal 35, la chaine ABC,';...
        'la chaine 123, le nombre décimal 37568, le nombre hexadécimal 41A2,';...
        'et enfin la chaine 0x4253';...
        'Les nombres sont cassés en octets et transmis dans l''ordre Big Endian';'';...
        'Les caractères reçus sont affichés en hexadecimal dans la fenetre de gauche et en texte dans la fenetre de droite'};

    bhlp = uicontrol(fh, 'style', 'pushbutton', 'position',[10+wpop+10 popy+2*gap 50 20],...
        'str', 'Help', 'call', {@(hObject,callbackdata)msgbox(hlpmsg)},'back',[0.8 0.8 0.4]);
    
    hthex=300;
    thexy = e1y - hthex - gap;
    wthex = 430;
    thex = uicontrol(fh, 'style', 'TEXT', 'Posit',[10 thexy wthex hthex],...
        'horizon','left','fontname','Courier','foreg','r','fontsize',11);
    
    htchar=hthex;
    wtchar = WF-wthex-20;
    tchary = thexy;
    tchar = uicontrol(fh, 'style', 'TEXT', 'Posit',[10+wthex+gap tchary wtchar htchar],...
        'horizon','left','fontname','Courier','fontsize',11,'foreg','b');
    
    bCLR = uicontrol(fh, 'style', 'pushbutton', 'position',[100 5 50 20],...
        'str', 'CLEAR', 'call', @cleare,'back',[0.8 0.8 0.4]);

    bexit = uicontrol(fh, 'style', 'pushbutton', 'position',[10 5 40 20],...
        'str', 'EXIT', 'call', @quitter,'back',[0.8 0.8 0.4]);
    set(e1, 'string','Tapez ici les données à transmettre et cliquez sur le bouton Tx');
    set(thex, 'string','Les octets reçus sont affichés ici en Hexadécimal');
    set(tchar,'string','Les octets reçus sont affichés ici en format texte');
    set(fh, 'name', 'Aucun port Ouvert, Choisir un port dans la liste');
%============================================================================  
    function pop(obj,event)
        s = get(obj,'string');
        i = get(obj, 'value');
        com = s{i};
        if exist('sp','var')
            %disp(['un handle est affécté à ' sp.Port])
            if isvalid(sp)
            %disp([sp.Port '  Valide'])
                if strcmp(sp.status,'open')
                     %disp([sp.Port '  Ouvert'])
                     fclose(sp); 
                     %disp([sp.Port  '  Fermé']);
                else
                     %disp([sp.Port '  N''est pas Ouvert'])

                end
            disp(['>>>>>  Supression de  ' sp.Port])
            delete(sp); 
            clear sp;
            end
        end
        sp = serial(com);
        sp.timeout = 5;
        sp.BytesAvailableFcnMode = 'byte';
        sp.BytesAvailableFcnCoun =1;
        sp.BytesAvailableFcn = @lire;
        fopen(sp);
        if sp.BytesAvailable > 0
            bidon = fread(rx,rx.BytesAvailable);
        end
        set(fh, 'name', [com '  9600']);
        if sp.Status
            disp(['>>>>>  ' com ' Ouvert']);
            set(e1,'string','');
        else
            disp([com ' Fermé']);
        end            
    end

    function lire(rx, event)
        rb = fread(rx, 1);
        sh = get(thex,'string');
        sh = [sh sprintf('%.2X ',rb)];
        set(thex, 'string', sh);
        viewchar(rb);
    end

%============================================================================  
    function transmit(obj,event)
      if exist('sp','var') & isvalid(sp) & strcmp(sp.status,'open')
        s = get(e1,'string');
        while s 
            [a, s]=strtok(s); %a=premiere chaine,  s=reste de la chiaine
            n = str2num(a);
            if isempty(n)
                if (length(a) > 2) & (a(1:2) == '0x' | a(1:2) == '0X')
                    a = a(3:length(a));
                    n = hex2dec(a);
                    n = swapbytes(uint32(n)); % à l'origine  n est un double
                    B = typecast(n, 'uint8'); % casser n en bytes
                    ix = B == 0;
                    B(ix) = [];
                else
                    if a(1) == ''''
                        a = a(2:length(a)-1);
                    end
                    B = uint8(a);
                end
            else  
                n = swapbytes(uint32(n)); % à l'origine  n est un double
                B = typecast(n, 'uint8'); % casser n en bytes
                ix = B == 0;
                B(ix) = [];
            end   
            fwrite(sp,B);
        end
      else
          set(e1,'str','Aucun port COMM ouvert, Veuillez choisir un port');
      end
    end


%=============================================================
    function viewchar(c)
        sc = get(tchar,'string');
        if c == 13
            c = 182;
        end
        if c == 10
            c = 167;
        end
        sc(lin, col) = c;
        set(tchar, 'string', sc);
        col = col + 1;
        if col == 17
            col = 1;
            lin = lin + 1;
        end
    end
%======================================================================
    function cleare(obj, event)
        set(thex, 'string','');
        set(tchar, 'string','');
        lin = 1;
        col = 1;
    end

    function cleare1(obj, event)
        set(e1, 'string','');
    end

%======================================================================

    function quitter(obj,event)
        
        if exist('sp','var')
            if isvalid(sp)
                if strcmp(sp.status,'open')
                     fclose(sp); 
                     disp(['>>>>>  ' sp.Port  ' Fermé']);
                end
            delete(sp); 
            clear sp;
            end
        end
        delete(gcf);
        disp('By')
    end

    function valid_ports = getvalidports()
        % function lCOM_Port = getAvailableComPort()
        % Return a Cell Array of COM port names available on your computer
        
        try
            s=serial('IMPOSSIBLE_NAME_ON_PORT');fopen(s);
        catch
            lErrMsg = lasterr;
        end
        delete(s);
        %Start of the COM available port
        lIndex1 = findstr(lErrMsg,'COM');
        %End of COM available port
        lIndex2 = findstr(lErrMsg,'Use')-3;
        
        lComStr = lErrMsg(lIndex1:lIndex2);
        
        %Parse the resulting string
        lIndexDot = findstr(lComStr,',');
        
        % If no Port are available
        if isempty(lIndex1)
            valid_ports{1}='';
            return;
        end
        
        % If only one Port is available
        if isempty(lIndexDot)
            valid_ports{1}=lComStr;
            return;
        end
        
        valid_ports{1} = lComStr(1:lIndexDot(1)-1);
        
        for i=1:numel(lIndexDot)+1
            % First One
            if (i==1)
                valid_ports{1,1} = lComStr(1:lIndexDot(i)-1);
                % Last One
            elseif (i==numel(lIndexDot)+1)
                valid_ports{i,1} = lComStr(lIndexDot(i-1)+2:end);
                % Others
            else
                valid_ports{i,1} = lComStr(lIndexDot(i-1)+2:lIndexDot(i)-1);
            end
        end
    end
end
