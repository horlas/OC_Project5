#!/usr/bin/python3.5
# -*-coding:utf-8 -


from sqlalchemy import *
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import time



# default connexion
engine = create_engine('mysql+pymysql://user_P5:user_P5@localhost/alimentation', encoding='latin1', echo=True)

#declare database
alimentation = declarative_base()
#define and create table
class Category(alimentation):
	__tablename__ = 'Category'

	id = Column(Integer, primary_key = True)
	name = Column(String(150))

class Product(alimentation):
	"""docstring for Product"""
	__tablename__ = 'Product'

	id = Column(Integer, primary_key = True)
	name = Column(String(150))
	nutriscore = Column(String(1))
	url = Column(String(450))
	substitut_id = Column(Integer, nullable=False)
	category_id = Column(Integer)
	category_name = Column(String(80))


#declare session
Session = sessionmaker(bind=engine)
session = Session()

for instance in session.query(Category):
	print(instance.id, instance.name)

cat_id = 1
for i in session.query(Product).\
					join(Category, Product.category_name == Category.name ).\
					filter(Category.id == cat_id).\
					all():
	print(i.id, i.name)
				
#select the category which contain one products
#select count(id), category_name from Product group by category_name;
#select count(id), category_name from Product group by category_name; where count(id) = 1;
#where count(id) 

orph_cat = []

for i, c in session.query(func.count(Product.name), Product.category_name).\
				 group_by(Product.category_name).\
				 all():
				 
	if i == 1:
		print(i,c)
		orph_cat.append(c)
print("Les catégories suivantes ne contiennent qu'un seul produit")
print(orph_cat)
time.sleep(5)



#class and sort the items of unknown category
for i in session.query(Product).\
				 filter(Product.category_name == "unknown").\
				 all():
	print(i.id, i.name)

#Pause
print("Traitement automatique des Pizza")
time.sleep(5)

for i in session.query(Product).\
				 filter(Product.category_name == "unknown").\
				 all():
	if "Pizza" in i.name:
		i.category_id = 13
		i.category_name = "Pizza pies and quiche"
		session.commit()

for i in session.query(Product).\
				 filter(Product.category_name == "unknown").\
				 all():
	print(i.id, i.name)
				 
	 		
