#!/usr/bin/python3.5
# -*-coding:utf-8 -


import mysql.connector
from constants import *

class Product():
    '''To enable the general use of the Product class
     for basic filling as well as for using the program,
     the constructor is empty and two functions are implemented
     add (fill in the base) and select_product (create the product
     object chosen by the user)'''

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
        '''function which find a substitute product among a list of better choice in 
        same category with random choice and return this product id to suggest the user
         the choice. If there is no substitute, the function tells the user.'''

        #Conversion
        #create a temporary dictionnary to convert and sort the substitut product
        temp = {} 
        
        CURSOR.execute(query_same_cat, cat_id)

        for id, nutriscore in CURSOR:
            temp[id] = nutriscore
        
        for key, value in temp.items(): #convert letter to number
            for key2, value2 in CONV_NS.items():
                if value == value2:
                    temp[key] = key2

        #sort product which have a nutriscore smaller than ns_number
        sub_dict = {k : v for k, v in temp.items() if v < ns_number}
        #Choose a product among better stuff
        #create first a dictionnary with value = 1 since the dictionnary is empty
        #incremente this value .
        if sub_dict: 
            ind = 1
            better_sub_dict = {}
            while len(better_sub_dict) == 0:
                for value in sub_dict.items():
                    better_sub_dict = {k:v for k, v in sub_dict.items() if v == ind}
                ind += 1

            #Since the dict doesn't preserve order,
            #by using popitem you get items in an arbitrary order from it.    
            sub_item = better_sub_dict.popitem() 
            self.substitut_id = sub_item[0]          
        
        #In case of no possibilitie of substitution
        else:
            print("Aucun produit de substitution dans la base de données")
            self.substitut_id = 0   
        return self.substitut_id


    def update_database(self):
        '''function also updates database in writing the id of the substitute product'''
        CURSOR.execute(query_update_sub_id, (self.substitut_id, self.id))
        #make sure to commit data to database
        cnx.commit()
            
    def display(self):
        '''display data belong to product'''
        print("{} \n\nDe la catégorie {} \n\n"
              "Son nutriscore est {}. \n\n"
              "Vous pouvez trouver sa fiche à cette adresse \n\n{}\n\n"
              .format(self.p_name, self.cat_name, self.n_grade, self.url))
