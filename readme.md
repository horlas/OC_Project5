# Projet 5: utiliser les données publiques d'Open Food Facts
Programmes ecrits en Python3
https://github.com/horlas/OC_Project5
**Librairies utilisées:**
 **requests** (interrogation et rappatriement des données d'Open Fodd Facts
**mysql-connector-python**: communication avec la base de données
**pandas**: affichage en tableau
**sqlalchemy**: ORM, communication avec la base de données

**Base de données** : Mysql administrée avec PHPAdmin.

Pour utiliser ce programme , au préalable créer une base sous mysql nommée alimentation : CREATE DATABASE alimentation;
créer un utlisateur : CREATE USER 'user_P5'@'localhost IDENTIFIED  BY 'user_P5';
GRANT USAGE ON alimentation to 
user_P5'@'localhost' [IDENTIFIED BY 'user_P5'];

## Création des tables: create_database_alimentation.sql 
Ce script crée la structure de la base qui contient trois tables : 
Temp, Product, Category
**Temp**: contiendra le premier import des données.
**Product**: les données sur les produits
**Catégory**: le nom des catégories et leur id

Les tables Product et Catégory sont remplies à partir des données stockées dans Temp gräce à une procédure stockée nommée "*fill_database*".
Cette procédure nous permet de gérer correctement l'intégrité des données notamment l'incrémentation des id et d'éviter les doublons dans les noms.
Elle permet aussi de créer un id de la catégorie en local et de l'affecter dans un deuxième temps au produit ( colonne Product.category_id = Category.id ). 
Elle vide la table Temp à la fin pour éviter le poids de données inutiles pour la suite du programme et permettre aussi un nouvel import.

La  vue *substitut_product* permet de satisfaire la fonctionnalité 2 du programme principal : Afficher les produits substitués. Elle permet de boucler sur la table Product afin d'obtenir le nom des produits selectionnés et le nom des produits substitués correspondants.

## Remplissage de la base "alimentation" gâce aux données OpenFood Facts: resquest_off.py 
Pour les besoins du projet,  seules les trois premières pages des catégories choisies sont importées pour éviter la lourdeur de la base.
Cependant une fonctionnalité peut permettre d'importer l'ensemble des pages:
(située ligne 23 :   loop = 3    #import only the tree first pages       #ceil(count/20) # 20 = pagination)

Ce programme va interroger les catégories choisies pour les intégrer dans la base.
Pour cela il s'appuie sur la creation d'objet Product (objet défini dans le fichier classes.py par la méthode add product), cette étape est implémentée dans la fonction load_data qui vient stocker les données dans la table Temp.
Une deuxième fonction: fill_database fait appel à la procédure stockée dans la base Mysql qui prend en charge le remplissage des tables utiles au programme : Product et Category.

## Traitement des données de la base: analysis_data.py
 Nous nous sommes aperçu que les données d'OpenFood Fact pouvaient être corrompues notamment dans l'affection des catégories aux produits (ex : une catégorie ne contient qu'un seul produits , ou la présence d'une catégorie nommée unknown).
Ce programme utilise l'ORM SQlAlchemy et il va venir interroger la base et  les données seront traités grâce à l'intervention de l'administrateur de l'application. Il permettra de supprimer les catégories non valide et de regrouper les produits.

## Application: substitut_food.py: 
### Fonctionnalité 1:
Le programme propose à l'utilisateur de choisir une catégorie puis un produit qu'il consommerai . Lorsque la saisie est faite , il renvoie un substitut de meilleure qualité puis propose son enregistrement.

### Fonctionnalité 2 :
Le programme permet de renvoyer à l'utilisateur l'ensemble de ces produits sauvegardés dans la base de données.

Une boucle est mise en place permettant à l'utilisateur de faire plusieurs choix possibles. Il peut à tout moment sortir du programme en rentrant "0".

Ce programme s'appuie sur l'utilisation de trois fonctions : select_category et display_category et recorded_substitut : qui permettent, respectivement, de selectionner une catégorie et d'enregistrer le substitut (choix laissé à l'utilisateur) .

Une fois le produit selectionné, un objet Product est créé, il permet de renvoyer les attributs du produits choisi mais aussi de faire le choix parmi la même catégorie d'un produit substituant c'est à dire avec un nutriscore meilleur (conversion du nutriscore au préalable en chiffre) 

## Fichier définissant la class Product.class.py :
Cette classe est utilisée par les programmes request_off et substitut_food.py. 

## Fichier regroupant les constantes des programmes:
constants.py.