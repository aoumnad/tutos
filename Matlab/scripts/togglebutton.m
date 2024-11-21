function togglebutton()
    fh = figure('MenuBar','None', 'units','normalized','Posit', [0.5 0.5 0.3 0.2]);
    ed = uicontrol(fh, 'style', 'Edit','units','normalized','Posit', [0.1 0.2 0.8 0.2]);
    tb = uicontrol(fh, 'style', 'ToggleButton','units','normalized', 'string', 'ON / OF',...
        'Posit', [0.4 0.5 0.2 0.2], 'callback', @toggle);

    function toggle(obj, event)
       if get(obj,'value')
           set(ed, 'string', 'Le bouton est enfoncé');
       else
           set(ed, 'string', 'Le bouton est relâché');
       end           
    end

end
