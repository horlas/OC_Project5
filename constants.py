#!/usr/bin/python3.5
# -*-coding:utf-8 -

import mysql.connector 

#File which collect constants and queries


#Cursor

cnx = mysql.connector.connect(user="test_P5", password= "test_P5", database="alimentationV2")
CURSOR = cnx.cursor()



query_display_category = ("SELECT id, name from Category")

query_select_category = ("SELECT Product.id, Product.name from Product"
                         " INNER JOIN Category"
                         " ON Product.category_name = Category.name"
                         " WHERE Category.id = %s")
query_select_product= ("SELECT Product.id, Product.name, Product.nutriscore from Product"
             		   " WHERE Product.id = %s")