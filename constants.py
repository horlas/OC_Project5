#!/usr/bin/python3.5
# -*-coding:utf-8 -

import mysql.connector 

#File which collect constants and queries


#Cursor

cnx = mysql.connector.connect(user="test_P5", password= "test_P5", database="alimentationV2", buffered=True)
CURSOR = cnx.cursor()

add_product = ("INSERT INTO Temp"
               "(name, nutriscore, category_name, url)"
               "VALUES (%s, %s, %s, %s)")

query_display_category = ("SELECT id, name from Category")

query_select_category = ("SELECT Product.id, Product.name from Product"
                         " INNER JOIN Category"
                         " ON Product.category_name = Category.name"
                         " WHERE Category.id = %s")
query_select_product = ("SELECT Product.id, Product.name, Product.nutriscore from Product"
             		   " WHERE Product.id = %s")

query_create_select_product = ("SELECT Product.id, Product.name, Product.category_name, Product.nutriscore, Product.url, Product.category_id from Product"
							   " WHERE Product.id = %s")

#query used to select the same category in order to find the substitute product
query_same_cat = ("SELECT id, nutriscore FROM Product" 
				 " WHERE category_id = %s")



#Dictionary used to convert nutriscore in letter to number
#to compare easily to an another product
CONV_NS = {1 : "a", 2 : "b", 3 : "c", 4 : "d", 5 : "e"}