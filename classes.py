#!/usr/bin/python3.5
# -*-coding:utf-8 -

import mysql.connector
from constants import *


class Product():

    def __init__(self):
        
        self.p_name = ""
        self.n_grade = ""
        self.cat_name = ""
        self.url = ""
        self.id = 0
        self.category_id = 0

        

    def add(self, p_name, n_grade, cat_name, url, cursor):
        '''Function used to fill database'''
        self.p_name = p_name
        self.n_grade = n_grade
        self.cat_name = cat_name
        self.url = url

        product_data = (self.p_name, self.n_grade, self.cat_name, self.url)

        try:
            cursor.execute(add_product, product_data)
        except mysql.connector.errors.IntegrityError:
            pass

    def conversion(n_grade):
        '''To convert letter to number'''
        ns_number = 0
        conv_ns = {1 : "a", 2 : "b", 3 : "c", 4 : "d", 5 : "e"}
        for key, value in conv_ns.items():
            if n_grade == value:
                ns_number = key

        return ns_number            

        

