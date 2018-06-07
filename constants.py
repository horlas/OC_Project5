#!/usr/bin/python3.5
# -*-coding:utf-8 -

import mysql.connector 

#File which collect constants and queries


#Cursor

cnx = mysql.connector.connect(user="user_P5", password= "user_P5", database="alimentation", buffered=True)
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

#query for updating substitute_id into Product
query_update_sub_id = ("UPDATE Product"
					   " SET substitut_id = %s"
					   " WHERE id = %s"	)

#query which return the list of substitute products recorded
query_substitut_product = ("SELECT substitut_product.category,"
						   " substitut_product.name AS mauvais_pour_ta_santé,"
						   " Product.name AS bon_pour_ta_santé"
						   " FROM substitut_product"
						   " INNER JOIN Product"
						   " ON substitut_product.substitut_id = Product.id"
						   " WHERE substitut_product.substitut_id = Product.id"
						   " ORDER BY substitut_product.name")




#Dictionary used to convert nutriscore in letter to number
#to compare easily to an another product
CONV_NS = {1 : "a", 2 : "b", 3 : "c", 4 : "d", 5 : "e"}