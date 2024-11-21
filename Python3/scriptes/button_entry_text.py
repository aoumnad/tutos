from tkinter import *

def hello():
   E3.insert(INSERT, 'Bonjour '+ E1.get() + '  ' +  E2.get()+'\n')
  
fp = Tk()
fp.title('Widgets Button Entry Text')
L1 = Label(fp, text = 'Nom')
E1 = Entry(fp, width=20, bg = 'yellow')
E1.insert(INSERT , 'Pain')
L2 = Label(fp, text = '\nPrénom')
E2 = Entry(fp, width=15 ,  bg ='#ffcc00')
E2.insert(INSERT,'Desucre')
B1 = Button(fp, text='Saluer', bd=5, command = hello)
B2 = Button(fp, text='EXIT', bd=5, command=fp.destroy)
E3 = Text(fp, width=30, height=15)
E3.pack(side=RIGHT, fill= BOTH, padx = 5, pady = 10, expand=False)
L1.pack()
E1.pack()
L2.pack()
E2.pack()
B1.pack(pady=20)
B2.pack(pady=5)

fp.mainloop()
