#!/usr/bin/env python
# coding: utf-8

# # Import des bibliothèques nécessaires

# In[147]:


from bs4 import BeautifulSoup
import requests
import pandas as pd
import numpy as np
import random
from datetime import datetime, timedelta


# # Website Scraping pour les noms de résidence

# In[149]:


url = 'https://www.kley.fr/residence-etudiante'


# In[150]:


page = requests.get(url)


# In[151]:


table = soup.find(class_ = 'listing__residences')
table


# In[154]:


names =table.find_all('h2')


# In[155]:


Residences_Names = [name.text.strip() for name in names]


# In[156]:


Residences_Names


# # Définition des autres variables

# In[157]:


nb_residences = 22
nb_lits_total = 5000
nb_ecoles = 900
age_moyen_etudiants = 21
types_ecoles = ['Université', 'École de Commerce', 'École Spécialisée', 'IUT', 'BTS']
types_logements = ['T1', 'T2', 'T3', 'T4', 'T5', 'T6']
periode_commerciale_arrivees = pd.date_range(start='2024-05-01', end='2024-09-30')
periode_commerciale_departs = [datetime.strptime('2024-07-01', '%Y-%m-%d') + timedelta(days=x) for x in range(0, 92, 7)]


# # Génération des données pour chaque résidence

# In[158]:


data = []


# In[172]:


for i in range(nb_residences):
    residence_id = i + 1
    nom_residence = Residences_Names[i]  # Utilisation des noms des résidences scrapés
    taux_occupation = round(random.uniform(0.7, 1.0), 2)
    revenu_mensuel = round(random.uniform(300, 1000), 2)
    duree_sejour = round(random.uniform(1, 15), 2)
    produit_service = random.choice(['KLEY book', 'Événements et animations', 'Playstation', 'Cours de sport','Accès PMR'])
    
    for j in range(nb_lits_total // nb_residences):
        etudiant_id = str(i) + str(j)
        prenom = 'Étudiant' + str(random.randint(1, 1000))
        nom = 'Nom' + str(random.randint(1, 1000))
        age = random.randint(18, 25)
        ecole = 'École' + str(random.randint(1, 100))
        type_ecole = random.choice(types_ecoles)
        type_logement = random.choice(types_logements)
        date_arrivee = random.choice(periode_commerciale_arrivees)
        date_depart = random.choice(periode_commerciale_departs)
        data.append([etudiant_id, prenom, nom, age, ecole, type_ecole, type_logement, nom_residence, taux_occupation, revenu_mensuel, duree_sejour, produit_service, date_arrivee, date_depart])


# # Création du DataFrame

# In[174]:


df = pd.DataFrame(data, columns=['Etudiant_ID', 'Prénom', 'Nom', 'Age', 'École', 'Type_École', 'Type_Logement', 'Nom_Résidence', 'Taux_Occupation', 'Revenu_Mensuel', 'Durée_Séjour', 'Produit_Service', 'Date_Arrivée', 'Date_Départ'])


# In[175]:


df


# # Sauvegarde des données dans un fichier CSV

# In[176]:


df.to_csv('donnees_kley.csv', index=False)


# In[177]:


print(df.head())


# In[ ]:




