# -*- coding: utf-8 -*-
import serial

#for i in range(-5,5):
#        print(i, 1/i)


for i in range(-5,5):
    try:
        print(i, 1/i)
    except:
        pass
print('Le cas qui pose problème est tout simplement ignoré')
print('======================================================')

for i in range(-5,5):
    try:
        print(i, 1/i)
    except:
        print(i, '   --> Problème de division par 0 <--')
print("Sachant que le problème vient d'une division par 0")
print("on affiche le message: -->Problème de division par 0<-- ")
print('\n======================================================\n')

for i in range(-5,5):
    try:
        print(i, 1/i)
    except Exception as erreur:
        print("==> "+str(erreur)+" <==")
print("On affiche le message d'erreur retourné par le système")

print('\n======================================================\n')
port = 'COM5'
try:
    sp = serial.Serial(port)
except Exception as erreur:
    sterr 
    print(erreur)
else:
    print("Port "+port+" Ouvert")
    
