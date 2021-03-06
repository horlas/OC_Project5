#!/usr/bin/python3.5
# -*-coding:utf-8 -
'''Program which find among the same category a subtitut product
   to a selected product.
   The user can update this proposal to database.
   The user can consult the products recorded.'''
import pandas as pd
from classes import *
from constants import *


def display_category():
    '''Function witch display the list of category'''
    CURSOR.execute(query_display_category)

    for id, name in CURSOR:
        print(id, "  --  ", name)

def select_category(cat_id):
    '''Function to select a category of food'''
    CURSOR.execute(query_select_category, cat_id)
    for id, name in CURSOR:
        print(id, "  --  ", name)
      
def recorded_substitut():
    '''Function which display substitut on demand'''

    #extract data from database Mysql
    CURSOR.execute(query_substitut_product)
    frame = []
    results = []
    for cat_name, p_selected, p_substitute in CURSOR:
        frame = [cat_name, p_selected, p_substitute]
        results.append(frame)

    #data processing with library panda to have a nice display
    results_array = pd.DataFrame(results, columns=['CATEGORIE', 'PRODUIT SELECTIONNE', 'PRODUIT SUBSTITUE'])
    for line in results_array.iterrows():
        index_line = line[0]
        contents_ligne = line[1]
        print("Votre produit substitué {} :".format(index_line + 1)) #+1 for a better display
        print(contents_ligne)
        print("--------------------------------------------")


if __name__ == "__main__":

    HOME_LOOP = True
    while HOME_LOOP:
        cnx = mysql.connector.connect(user="user_P5", password= "user_P5", database="alimentation", buffered=True)
        CURSOR = cnx.cursor()
        try:
            rep = int(input("1- Quel aliment souhaitez vous remplacer? \n"
                            "2- Retrouver mes aliments substitués \n"
                            "0- Pour quitter le programme\n"
                            "Votre choix :  "))
        #error during the first user input
        except ValueError:
            print("Vous n'avez pas saisi 1 ou 2. Veuillez\n taper 1 ou 2")
            rep = int(input("1- Quel aliment souhaitez vous remplacer? \n"
                            "2- Retrouver mes aliments substitués \n"
                            "0- Pour quitter le programme\n"
                            "Votre choix :  "))
    
        while rep not in (1, 2, 0):
            print("Saissisez 1 ou 2 ou 0 pour quitter le programme")
            try:
                rep = int(input("1- Quel aliment souhaitez vous remplacer? \n"
                                "2- Retrouver mes aliments substitués \n"
                                "0- Pour quitter le programme\n"
                                "Votre choix :  "))
            #error during the second user input
            except  ValueError:
                print("Vous n'avez pas saisi 1 ou 2. Veuillez taper 1 ou 2")
                rep = int(input("1- Quel aliment souhaitez vous remplacer? \n"
                                "2- Retrouver mes aliments substitués \n"
                                "0- Pour quitter le programme\n"
                                "Votre choix :  "))   
        if rep == 0:
            HOME_LOOP = False
        
        if rep == 1:
            display_category()
        
            try:
                cat_id = (int(input("Selectionnez la catégorie: ")),) #cat_id is a tuple to insert in query
            except ValueError:
                print("Vous n'avez pas saisi une bonne valeur de catégorie")
                cat_id = (int(input("Selectionnez la catégorie: ")),)
   
            select_category(cat_id)

            try:
                p_id = (int(input("Choisissez votre produit: \n")),)
            except ValueError:
                print("Vous n'avez pas saisi une bonne valeur de produit") 
                p_id = (int(input("Choisissez votre produit: \n")),)

            #create a product from input user
            p_selected = Product() 
            p_selected.define_product(p_id)

            #convert nutriscore in number and choice a substitute product
            ns_number = p_selected.conversion()
            substitut_id = (p_selected.substitut(cat_id, ns_number),) #tuple to pass in query's parameter
            #in case of no substitut because is already the best product
            if substitut_id == (0,):
                print("\nVotre produit est déjà avec le meilleur nutriscore de sa catégorie\n")
            else:
                #create a substitute product in order to display it
                p_substitute = Product()
                p_substitute.define_product(substitut_id)
        
                #display for the user
                print("Vous avez selectionné: \n")
                p_selected.display()
                print("Nous vous proposons de le substituer \n\n"
                      "Par un produit meilleur pour votre santé\n\n")
                p_substitute.display()
        
                #suggest to record the substitute product
                rep_1 = input(("Voulez vous enregistrer cette proposition? Tapez o: \n  "
                               "Sinon n'importe quelle touche pour revenir au programme :  ")
                             .lower())
                if rep_1 != "o":
                    print("sauvegarde abandonnée")

                if rep_1 == "o":
                    p_selected.update_database()

                    
    
        if rep == 2:
            recorded_substitut()          


        CURSOR.close()
        cnx.close()     