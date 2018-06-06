#!/usr/bin/python3.5
# -*-coding:utf-8 -

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
      



if __name__ == "__main__":
       
    rep = int(input("1- Quel aliment souhaitez vous remplacer? \n"
                    "2- Retrouver mes aliments substitués \n"
                    "Votre choix :  "))


    if rep == 1: 
        display_category()
        cat_id = (int(input("Selectionnez la catégorie: ")),) #cat_id is a tuple to insert in query
        select_category(cat_id)
        p_id = (int(input("Choisissez votre produit: \n")),)

        #create a product from input user
        p_selected = Product() 
        p_selected.define_product(p_id)

        #convert nutriscore in number and choice a substitute product
        ns_number = p_selected.conversion()
        substitute_id = (p_selected.substitut(cat_id, ns_number),) #tuple to pass in query's parameter
        
        #create a substitute product from the programme
        p_substitute = Product()
        p_substitute.define_product(substitute_id)
        
        #display for the user
        print("Vous avez selectionné: \n")
        p_selected.display()
        print("Nous vous proposons de le substituer \n\n"
              "Par un produit meilleur pour votre santé\n\n")
        p_substitute.display()          
        

    CURSOR.close()
    cnx.close()     