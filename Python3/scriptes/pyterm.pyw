from tkinter import *
import serial
#from threading import Thread
#import re

def lecture():
    try:
        st = sp.read(sp.inWaiting())
        if st:
            if  rxeolvar.get() == '\r':    st = st.replace(b'\r', b'\n')
            edit.insert(END,st.decode('latin-1'),'bleu')
            edit.see(END)   # scrll auto quand arrive en fin de page
    except Exception as err:
        print(err)
    fp.after(100,lecture)
    
def Port_Setup():
    global sp
    try:    # vérifier si l'objet sp est défini
        if sp.isOpen():
            sp.close() # si oui le fermer
            edit.insert(INSERT, '--> '+sp.port+' Fermé\n')
    except:
        pass  

    try:
        sp = serial.Serial(portstr.get(), baudstr.get(), timeout=0)
        edit.insert(INSERT, '--> '+ sp.port+' Ouvert\n')
        lecture()  # lecture périodique
    except Exception as err:
        edit.insert(INSERT,"I/O error: {0}\n".format(err),'rouge')
        fp.title('Port fermé')
    else:
        fp.title(sp.portstr + '   ' + str(sp.baudrate))

    PortSetup.grab_release() # lacher le monopol
    PortSetup.withdraw()     # cacher la fenetre
    

def clavier(event):
    global sp
    c = event.char
    if c == '\r':
        c = txeolvar.get()
    try:
        sp.write(c.encode('Latin-1'))
    except:
        edit.insert(INSERT,'\nPort fermé, choisissez un port\n', 'rouge')
    if not echolocal.get():
        return "break"
      

def quitter():
    global sp
    try:
        sp
    except:
        pass
    else:
        if sp.isOpen():
            sp.close()
    #print('By')
    fp.destroy()

def  showsetup():
  PortSetup.deiconify()

def nettoyer():
  edit.delete('1.0',END)

def curseur(bidon):
    fp.after(10, lambda: edit.mark_set(INSERT, END))
    
      

#====== Création de la fenetre principale ============================
fp=Tk()
fp.geometry('+50+50')
fp.protocol("WM_DELETE_WINDOW", quitter)

cadre = Frame(fp, height = 200)
cadre.pack(padx=5, pady=5, fill = BOTH, expand=1)
Vscroll = Scrollbar(cadre)
edit = Text(cadre, width=50,height=20,yscrollcommand = Vscroll.set)
edit.bind("<KeyPress>", clavier)
edit.bind("<FocusIn>", curseur)
edit.tag_config('rouge', foreground ='red')
edit.tag_config('bleu', foreground ='blue')
edit.pack(side=LEFT, fill = BOTH, expand=1)
Vscroll.pack( side = LEFT, fill = Y)
Vscroll.config(command = edit.yview)
Clear_B = Button(fp, text='CLEAR', bg='olivedrab',bd=5,command = nettoyer )
Clear_B.pack(side = LEFT, padx = 10)
Exit_B = Button(fp, text="EXIT", bg='olivedrab',bd=5, command = quitter)
Exit_B.pack(side = LEFT, padx = 10)

#===== Création de la fenêtre de configuration du port ===============
PortSetup = Toplevel(fp)
PortSetup.geometry('+100+100')
PortSetup.transient(fp)
PortSetup.grab_set()
PortSetup.focus_set()
F1 = Frame(PortSetup)
F2 = Frame(PortSetup)
F1.pack(padx = 10, pady = 10)
F2.pack(padx = 10, pady = 10)
portstr = StringVar()
baudstr = StringVar()
portmenu = OptionMenu(F1, portstr, 'COM1','COM2','COM3','COM4','COM5','COM6','COM7','COM8','COM9','COM10')
portmenu.configure(width = 10, bg='cyan', bd=5)
portstr.set('COM1')
baudmenu = OptionMenu(F1, baudstr, '1200','2400','4800','9600','19200','38400')
baudmenu.configure(width = 10, bg='cyan', bd=5)
baudstr.set('9600')
portmenu.pack(side=LEFT, padx = 20, pady = 10)
baudmenu.pack(side = RIGHT, padx = 20, pady = 10)
lf1 = LabelFrame(F2, text='fin de ligne en émission')
lf1.pack(side = LEFT, padx = 10, pady = 10)
txeolvar = StringVar()
txeolvar.set('\r')
txeolr1 = Radiobutton(lf1, text="CR", variable= txeolvar, value='\r')
txeolr1.pack( anchor = W )
txeolr2 = Radiobutton(lf1, text="LF", variable= txeolvar, value='\n')
txeolr2.pack( anchor = W )
txeolr3 = Radiobutton(lf1, text="CR+LF", variable= txeolvar, value='\r\n')
txeolr3.pack( anchor = W )

lf2 = LabelFrame(F2, text='fin de ligne en réception')
lf2.pack(side = RIGHT, padx = 10, pady = 10)
rxeolvar = StringVar()
rxeolvar.set('\r')
rxeolr1 = Radiobutton(lf2, text="CR", variable= rxeolvar, value='\r')
rxeolr1.pack( anchor = W )
rxeolr2 = Radiobutton(lf2, text="LF", variable= rxeolvar, value='\n')
rxeolr2.pack( anchor = W )
rxeolr3 = Radiobutton(lf2, text="CR+LF", variable= rxeolvar, value='\r\n')
rxeolr3.pack( anchor = W )
echolocal = BooleanVar()
echolocal.set(True)
lecho = Checkbutton(PortSetup, text='Echo local', variable = echolocal)
lecho.pack(side = LEFT, padx=20, anchor = W )

Button(PortSetup,text = ' OK ', bd=5,bg='orange2',command=Port_Setup).pack(side = RIGHT, padx = 20, pady = 10)
Setup_B = Button(fp, text='Setup', bg='olivedrab',bd=5, command = PortSetup.deiconify)
Setup_B.pack(side = LEFT, padx=10, pady=5)
fp.mainloop()



