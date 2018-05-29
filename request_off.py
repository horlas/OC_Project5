#!/usr/bin/python3.5
# -*-coding:utf-8 -

import requests
import mysql.connector 


def fill_database(url):
    """Function which take an url from Open Food Facts in parameter and
    fill with datas the database"""
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
            n_grade = p['nutrition_grades']
            cat_name = p["pnns_groups_2"]
            url = p["url"]
        except KeyError:
            pass
        
        
        product_data = (p_name, n_grade, cat_name, url)
        id = cursor.lastrowid
        category_data = {"id": id, "name" :cat_name}
        #to avoid Integrity error on duplicate key from mysql 
        try:
            cursor.execute(add_product, product_data)
            cursor.execute(add_category, category_data)
        except mysql.connector.errors.IntegrityError:
            pass


if __name__ == "__main__":

    #Define the connexion
    cnx = mysql.connector.connect(user="test_P5", password= "test_P5", database="alimentationV2")
    cursor = cnx.cursor()
    fill_database("https://fr.openfoodfacts.org/categorie/fruits-secs.json")
    fill_database("https://fr.openfoodfacts.org/categorie/produits-a-tartiner.json")
    fill_database("https://fr.openfoodfacts.org/categorie/pates-a-tartiner-vegetales.json")
    fill_database("https://fr.openfoodfacts.org/categorie/plats-prepares-a-rechauffer-au-micro-ondes/categorie/legumes-prepares.json")
    fill_database("https://fr.openfoodfacts.org/categorie/boissons-sucrees/categorie/sodas.json")
    fill_database("https://fr.openfoodfacts.org/categorie/matieres-grasses-a-tartiner/categorie/matieres-grasses-animales.json")
    #make sure to commit data to database
    cnx.commit()
    #close connexion
    cursor.close()
    cnx.close()
#############################################################################FIN

