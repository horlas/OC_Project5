#!/usr/bin/python3.5
# -*-coding:utf-8 -

from math import *
import requests
import mysql.connector 

def fill_database(category):
    """Function which take an category from Open Food Facts in parameter and
    fill with datas the database"""
    url_begin = 'https://fr.openfoodfacts.org/categorie'
    nb_page = 1
    url_end = 'json'
    #url standart syntaxe
    url = "{}/{}/{}.{}".format(url_begin, category, nb_page, url_end)

    #Get the first page in order to have the number og product:
    response = requests.get(url)
    products = response.json()
    #How many page in a category.
    count = products["count"]
    loop = ceil(count/20) # 20 = pagination
    #fill database
    while loop != 0:
        #redefine url
        url = "{}/{}/{}.{}".format(url_begin, category, nb_page, url_end)
        
        response = requests.get(url)
        products = response.json()


        #Variables of filling database
        p_name = ""
        n_grade = ""
        cat_name = ""
        url = ""

        #query to insert data
        add_product = ("INSERT INTO Product"
                       "(name, nutriscore, category_name, url)"
                       "VALUES (%s, %s, %s, %s)")

        add_category = ("INSERT INTO Category"
                        "(id, name)"
                        "VALUES (%(id)s, %(name)s)")
        #Loop to fill database
        for p in products["products"]:
        #to avoid empty field from OpenFoodFacts        
            try:
                p_name = p["product_name_fr"]
                n_grade = p["nutrition_grades"]
                cat_name = p["pnns_groups_2"]
                url = p["url"]
            except KeyError:
                pass
        
        
        product_data = (p_name, n_grade, cat_name, url)
        nb_id = cursor.lastrowid
        category_data = {"id": nb_id, "name" :cat_name}
        #to avoid Integrity error on duplicate key from mysql 
        try:
            cursor.execute(add_product, product_data)
            cursor.execute(add_category, category_data)
        except mysql.connector.errors.IntegrityError:
            pass
        nb_page += 1
        loop -= 1
            

if __name__ == "__main__":

    #Define the connexion
    cnx = mysql.connector.connect(user="test_P5", password= "test_P5", database="alimentationV2")
    cursor = cnx.cursor()
    fill_database("fruits-secs")
    #make sure to commit data to database
    cnx.commit()
    #close connexion
    cursor.close()
    cnx.close()
#############################################################################FIN

