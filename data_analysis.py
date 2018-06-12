#!/usr/bin/python3.5
# -*-coding:utf-8 -


from sqlalchemy import *
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import time



# default connexion
engine = create_engine('mysql+pymysql://user_P5:user_P5@localhost/alimentation', encoding='latin1', echo=False)

#declare database
alimentation = declarative_base()
#define and create table
class Category(alimentation):
	__tablename__ = 'Category'

	id = Column(Integer, primary_key = True)
	name = Column(String(150))

	#del_cat = relationship("Product", back_populates ="Category")

 


class Product(alimentation):
	"""docstring for Product"""
	__tablename__ = 'Product'

	id = Column(Integer, primary_key = True)
	name = Column(String(150))
	nutriscore = Column(String(1))
	url = Column(String(450))
	substitut_id = Column(Integer, nullable=False)
	category_id = Column(Integer, ForeignKey("Category.id"))
	category_name = Column(String(80))

	#fk_cat_id = relationship("Category", backpopulate ="")


#declare session
Session = sessionmaker(bind=engine)
session = Session()

def find_product_per_category():
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

#################Functions for treatment of orphans products##########################
def find_category_one_product():
	#list category which contains only one product
	orph_cat = {}
	for i, cat_name, cat_id in session.query(func.count(Product.name), Product.category_name, Product.category_id).\
				        group_by(Product.category_name, Product.category_id).\
				        all():
		if i == 1:
			orph_cat[cat_id] = cat_name
	return orph_cat

def pos_cat(cat_id):
	#create a list of categorie available
	pos_cat = {}
	for cat_id, cat_name in orph_cat.items():
		#sort all category except oph_cat
		for i in session.query(Category).\
				 		 all():
			if i.id != cat_id:
				pos_cat[i.id] = i.name
				#print(i.id, i.name)
	return pos_cat

def find_orph_product(orph_cat, cat_id):			
	#list product for those categories

	for product in session.query(Product).\
						   filter(Product.category_id == cat_id).\
						   all():
		print("le produit suivant est unique dans sa catégorie")			 
		print("{}---{}".format(product.id, product.name))
		print("Vous pouvez le requalifier dans les categories suivantes")

		dict_cat = pos_cat(cat_id)
		#display list 
		for i, n in dict_cat.items():
			print(i, n)	

		product.category_id = int(input("Veuillez selectionner le numero de la nouvelle categorie :  "))
		product.category_name = dict_cat[product.category_id]
		session.commit()

####################################################################################		 	
############# Function for treatment of product with no name #######################
def no_name_product():
	#list product id with no name
	no_name =[]
	for i in session.query(Product).\
					 filter(Product.name == "").\
					 all():
		no_name.append(i.id)			 
	return no_name	


####################################################################################

def possibilities_classisy(orph_cat):
	#list possibilities of classication without orphan category 
	for cat_id, cat_name in orph_cat.items():
		for i in session.query(Category).\
						 all():
			if i.id != cat_id:
					print(i.id, i.name)

def change_category(rep):
	#reaffect a category and clean orph_cat
	for replace in session.query(Category).\
								   filter(Category.name.like(rep)).\
								   all():
		print("yayayaya")
		print(i.category_id, replace.id)				   
		i.category_id = replace.id
		i.category_name = replace.name
		session.commit()
	#for i in session.query(Product).\

def unknown_category_product():
	#class and sort the items of unknown category
	unknown_cat_pro = {}
	for i in session.query(Product).\
				     filter(Product.category_name == "unknown").\
				      all():
		#print(i.id, i.name)
		unknown_cat_pro[i.id] = i.name
	return unknown_cat_pro	


def classify_product(rep):
	for i in session.query(Product).\
				     filter(Product.category_name == "unknown").\
				     all():
		if rep in i.name:
			change_category(rep)
	session.commit()
	print("yayay")		
			


if __name__ == "__main__":

	#treat categories which have only one product
	print("Traitement des produits seul dans leur catégorie.\n")
	orph_cat = find_category_one_product()

	if len(orph_cat) == 0:
		print("aucun produit orphelin")
	#display orphans products
	print("Les catégories suivantes ne contiennent qu'un seul produit")
	print(orph_cat)
	cat_id = 0 #define cat_id
	for id, name in orph_cat.items():
		cat_id =id	
		find_orph_product(orph_cat, cat_id)
	
	#delete orphans categories

	print("suppression des catégories orphelines : {}".format(orph_cat))
	time.sleep(2)

	for cat_id, cat_name in orph_cat.items():
		
		session.query(Category).filter(Category.id == cat_id).\
						        delete(synchronize_session=False)

	session.commit()
	print("done\n")
					     
	#delete no_name_product
	print("Traitement de produit sans nom.\n")	
	no_name = no_name_product()
	print("suppression des produits sans nom : {}".format(no_name))
	for i in no_name:
		session.query(Product).filter(Product.id == i).\
							   delete(synchronize_session=False)

	session.commit()
	print("done\n")	

	

	#treat category names "unknow"
	print("Traitement de la catégorie unknow \n")
	unknown_cat_pro = unknown_category_product()

	#while len(unknown_cat_pro) > 0 :
	for i, n in unknown_cat_pro.items():
		print(i, n)		
	print("1 traitement par mot clé : \n")
	rep = input("saisissez une mot clé par exemple  Pizza :   ")	
	print("Traitement automatique de {}".format(rep))
	for i in session.query(Product).\
				     filter(Product.category_name == "unknown").\
				     all():
		if rep in i.name:
			print("balalal")

			for instance in session.query(Category).\
						   filter(Category.name.like(rep)).all():
								   
				print(instance.id)	
			#print("yayayaya")
			#print(i.category_id, replace.id)				   
			#i.category_id = Category.id
			#i.category_name = Category.name
			#session.commit()




	#classify_product(rep)
		#unknown_cat_pro = unknown_category_product()

	#while len(unknown_cat_pro) > 0 :
		#unknown_cat_pro = unknown_category()

	
					   


	






				 
	 		
