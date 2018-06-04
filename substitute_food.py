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

def select_product(p_id):
    '''In order to offer a substitute, we must choice a product'''
    CURSOR.execute(query_select_product, p_id)
    for id, name, nutriscore in CURSOR:
        n_grade = nutriscore
    return n_grade    

def conversion(n_grade):
    '''To convert letter to number'''
    ns_number = 0
    conv_ns = {1 : "a", 2 : "b", 3 : "c", 4 : "d", 5 : "e"}
    for key, value in conv_ns.items():
        if n_grade == value:
            ns_number = key

    return ns_number            


#ecrire une fonction qui retournera un produit meilleur
#def substitute(ns_number)

    
#Nutriscore donné en chiffre
#Même categorie
#faire un random.choice sur une liste

if __name__ == "__main__":
       
    rep = int(input("1- Quel aliment souhaitez vous remplacer?: "))
    cnx = mysql.connector.connect(user="test_P5", password= "test_P5", database="alimentationV2")
    if rep == 1: 
        display_category()
        cat_id = (int(input("Selectionnez la catégorie: ")),) #cat_id is a tuple to insert in query
        select_category(cat_id)
        p_id = (int(input("Choisissez votre produit: ")),)
        n_grade = select_product(p_id)
        ns_number = conversion(n_grade)
        print(ns_number)

    
        

    CURSOR.close()
    cnx.close()     