#!/usr/bin/python3.5
# -*-coding:utf-8 -

import requests
import json
import mysql.connector

#Import data from Open Food Facts
#list of URL
response = requests.get("https://fr.openfoodfacts.org/categorie/fruits-secs.json")
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
				 "(name)"
				 "VALUES (%s)")
#Define the connexion
cnx = mysql.connector.connect(user="test_P5", password= "test_P5", database="alimentationV2")
cursor = cnx.cursor()

#Loop to fill database
for p in products["products"]:
	p_name = p["product_name_fr"]
	n_grade = p["nutrition_grades"]
	cat_name = p["pnns_groups_2"]
	url = p["url"]
	product_data = (p_name, n_grade, cat_name, url)
	category_data = (cat_name,)
	#to avoid Integrity error on duplicate key from mysql 
	try:
		cursor.execute(add_product, product_data)
		cursor.execute(add_category, category_data)
	except mysql.connector.errors.IntegrityError as error_on_duplicate_key:
		pass
	

#make sure to commit data to database
cnx.commit()
#close connexion
cursor.close()
cnx.close()

#############################################################################FIN

