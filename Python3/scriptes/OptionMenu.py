from tkinter import *

def portchange(valeur):
    L1.configure(text= "Port = " + valeur, bg='green')

def baudchange(valeur):
    L1.configure(text= "Vitesse = " + valeur, bg='cyan')
 
def verif():
    L1.configure(text= "Port = " + portstr.get()+"\nVitesse = " + baudstr.get(), bg='yellow')
    
fp=Tk()
portstr = StringVar()
baudstr = StringVar()
portstr.set('COM1')
baudstr.set('9600')
portmenu = OptionMenu(fp, portstr, 'COM1', 'COM2', 'COM3', 'COM4', 'COM5', 'COM6', command = portchange)
baudmenu = OptionMenu(fp, baudstr, '4800', '9600', '19200', '38400', command = baudchange)
portmenu.configure(width = 10, bg='pink', bd=5)
baudmenu.configure(width = 10, bg='pink', bd=5)
B1 = Button(fp, text = 'Vérifier', command = verif)
L1 = Label(fp,text='Status',width=20)
B2 = Button(fp, text="EXIT", command=fp.destroy)
portmenu.grid(row=1, column=1, sticky='W')
baudmenu.grid(row=2, column=1, sticky='W')
B1.grid(row=4, column=1, sticky='W', padx = 10)
L1.grid(row=1,column=2, pady=5)
B2.grid(row=5, column=2, pady=10)
fp.grid_rowconfigure(3, minsize=30)

fp.mainloop()      
