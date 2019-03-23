from nltk import *
import os
import numpy as np
import re
import matplotlib.pyplot as plt

#Format les noms des fichiers et permet de corriger les noms bizarres
pdfForm = lambda x : re.sub(re.compile(re.escape('.pdf'), re.IGNORECASE), '.pdf', x).replace(" ", "_")



#Classe Profil pour les CV
class Profil:
    def __init__(self, filename, text):
        self.filename = filename
        self.text = text
        self.word_count = len(word_tokenize(text))
        
        
#Classe Personne qui va etre dans la base de données
class Personne:
    def __init__(self):
        self.nom = 'Toto'

#On cherche le dossier qui va contenir tous les CV
directory = os.path.abspath("Bibliotheque_CV").replace("\\", "/")
#Puis on obtient tous les noms des CV
files = os.listdir(directory)

#On va stocker ici les différentes profils des CV
profilage = []


for name in files:
    print(name)
    #On renomme le fichier
    fileNameTxt = name.split('.pdf')[0].replace('.', '_').replace(' ', '_') + '.txt'
    #On transforme le pdf en fichier txt
    os.system('python pdf_parser.py -s "Bibliotheque_CV/'+ name +'" -f "Bibliotheque_CV_TXT/'+ fileNameTxt+'"')
    #On lit le contenu du fichier
    fichier=open(directory + "_TXT/" + fileNameTxt, 'r', encoding='utf8').read()
    #On ajoute le profi a notre liste
    profilage.append(Profil(name, fichier))
    
for profil in profilage:
    print(profil.word_count)

#Patron syntaxique
#age
re.findall(r'\d+ ans', profilage[5].text)
#email
re.findall(r'[\w.-]+@[\w]+.[\w]{2,3}', profilage[7].text)
#tel
re.findall(r'0\d{9}|0\d[\. -]\d{2}[\. -]\d{2}[\. -]\d{2}[\. -]\d{2}', profilage[5].text)
#codePostale
re.findall(r'\w+ \d{5} \w+', profilage[5].text)

profilage[7].filename

