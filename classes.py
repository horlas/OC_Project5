#!/usr/bin/python3.5
# -*-coding:utf-8 -

import mysql.connector
import random
from constants import *


class Product():

    def __init__(self):
        
        self.p_name = ""
        self.n_grade = ""
        self.cat_name = ""
        self.url = ""
        self.id = 0
        self.category_id = 0
        self.substitut_id = 0

        


    def add(self, p_name, n_grade, cat_name, url, cursor):
        '''Function used to fill database, used in request_off.py program'''
        self.p_name = p_name
        self.n_grade = n_grade
        self.cat_name = cat_name
        self.url = url

        product_data = (self.p_name, self.n_grade, self.cat_name, self.url)

        try:
            cursor.execute(add_product, product_data)
        except mysql.connector.errors.IntegrityError:
            pass

    def define_product(self, k_id):
        '''create an object with data link to the id selected by the user
        or provided by the programme as substitute '''
        CURSOR.execute(query_create_select_product, k_id)
        for id, name, category_name, nutriscore, url, category_id in CURSOR:
            self.id = id
            self.p_name = name
            self.n_grade = nutriscore
            self.cat_name = category_name
            self.category_id = category_id
            self.url = url
  
        return self.n_grade    

    def conversion(self):
        '''To convert letter to number'''
        ns_number = 0
        for key, value in CONV_NS.items(): #CONV_NS is a dictionnary stocked in constants.py
            if self.n_grade == value:
                ns_number = key

        return ns_number 

    def substitut(self, cat_id, ns_number):

        temp = {} #create a temporary dictionnary to convert and sort the substitut product
        
        CURSOR.execute(query_same_cat, cat_id)

        for id, nutriscore in CURSOR:
            temp[id] = nutriscore
        
        for key, value in temp.items(): #convert letter to number
            for key2, value2 in CONV_NS.items():
                if value == value2:
                    temp[key] = key2
        
        sub_dict = { k:v for k, v in temp.items() if v < ns_number} #sort product which have a nutriscore smaller than ns_number             
        substitut_id = random.choice(list(sub_dict.keys())) #random among the possibilities of substitution
        
        self.substitut_id = substitut_id

        return substitut_id


    def display(self):
        '''display data belong to product'''
        print("{} \n\nDe la catégorie {} \n\n"
              "Son nutriscore est {}. \n\n"
              "Vous pouvez trouver sa fiche à cette adresse \n\n{}\n\n"
              .format(self.p_name, self.cat_name, self.n_grade, self.url))




        

#Note: pour permettre l'utilisation générale de la classe Product
#pour le rempliqqage de base ainsi que pour l'utilisation du programme
#le constructeur est vide et deux fonctions sont mises en place
#add(remplir la base) et select_product (creation de l'objet produit choisi par l'utlisateur)



