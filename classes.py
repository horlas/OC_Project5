#!/usr/bin/python3.5
# -*-coding:utf-8 -

import mysql.connector 

class Product():

    def __init__(self, p_name, n_grade, cat_name, url):
        
        self.p_name = p_name
        self.n_grade = n_grade
        self.cat_name = cat_name
        self.url = url
        self.id = 0
        self.category_id = 0

        


    def add(self, cursor):


            
        add_product = ("INSERT INTO Temp"
                       "(name, nutriscore, category_name, url)"
                       "VALUES (%s, %s, %s, %s)")

        product_data = (self.p_name, self.n_grade, self.cat_name, self.url)

        try:
            cursor.execute(add_product, product_data)
        except mysql.connector.errors.IntegrityError:
            pass


    def select_product():
        '''In order to offer a substitute, we must choice a product'''
        rep3 = (int(input("Choisissez votre produit: ")),)
        query = ("SELECT Product.id, Product.nutriscore from Product"
                " WHERE Product.id = %s")
        product = cnx.cursor()
        product.execute(query, rep3)
        for id, nutriscore in product:
            ns = nutriscore
 
        product.close() 
        return ns    

    def conversion(ns):
        '''To convert letter to number'''
        ns_number = 0
        conv_ns = {1 : "a", 2 : "b", 3 : "c", 4 : "d", 5 : "e"}
        for key, value in conv_ns.items():
            if ns == value:
                ns_number = key

        return ns_number            

