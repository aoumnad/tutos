from tkinter import *

def fonction1(bidon):
    T1.insert(END,"La fentere de saisie a pris ")
    T1.insert(END,"le focus\n", 'rouge')
    T1.see(END)  # scroll auto quand on arrive en fin de fenêtre

def fonction2(valeur):
    T1.insert(END,"Vous avez tapé le caractère ")
    T1.insert(END, valeur.keysym + "\n", 'rouge')
    T1.see(END)
    return('break')  #pour que le caractère tapé ne soit pas affiché
    
def fonction3(bidon):
    T1.insert(END,"Vous avez cliqué sur le bouton ")
    T1.insert(END,"gauche\n", 'rouge')
    T1.see(END)

def fonction4(bidon):
    T1.insert(END,"Vous avez cliqué sur le bouton ")
    T1.insert(END,"droit\n", 'rouge')
    T1.see(END)
    
fp = Tk()
T1 = Text(fp, width=60, height = 30, padx = 10, pady = 10)
T1.pack(padx=10, pady=10)
T1.bind('<FocusIn>', fonction1)
T1.bind('<Key>', fonction2)
T1.bind('<Button-1>', fonction3)
T1.bind('<Button-3>', fonction4)
T1.tag_config('rouge', foreground ='red')
T1.insert(INSERT,"cliquez ou ou touchez le clavier\n\n\n")

B = Button(fp, text='EXIT', bg='brown', command=fp.destroy)
B.pack(pady = 10)

fp.mainloop()
