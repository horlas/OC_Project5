#!/usr/bin/python3.5
# -*-coding:utf-8 -

import mysql.connector 

def display_category():
    '''Function witch display the list of category'''
    query = ("SELECT id, name from Category")
    cat_display = cnx.cursor()
    cat_display.execute(query)
    for id, name in cat_display:
        print(id, "  --  ", name)
    cat_display.close()

def select_category():
    '''Function to select a category of food'''
    rep2 = (int(input("Selectionnez la catégorie: ")),) #rep2 is a tuple to insert in query
    query = ("SELECT Product.id, Product.name from Product"
             " INNER JOIN Category"
             " ON Product.category_name = Category.name"
             " WHERE Category.id = %s")

    list_product = cnx.cursor()
    list_product.execute(query, rep2)
    for id, name in list_product:
        print(id, "  --  ", name)
    list_product.close()    

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

#def conversion():



if __name__ == "__main__":
       
    rep = int(input("1- Quel aliment souhaitez vous remplacer?: "))
    cnx = mysql.connector.connect(user="test_P5", password= "test_P5", database="alimentationV2")
    if rep == 1: 
        display_category()
        select_category()
        ns = select_product()
        print(ns)
    
        


    cnx.close()     