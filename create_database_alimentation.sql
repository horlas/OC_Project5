SET NAMES utf8;


DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Temp;
DROP TABLE IF EXISTS substitut_product;
DROP PROCEDURE IF EXISTS fill_database;



--
-- Table structure for table `Category`
--

CREATE TABLE Category (
id int(11) unsigned NOT NULL AUTO_INCREMENT,
name varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




--
-- Table structure for table `Product`
--

CREATE TABLE Product (
id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
name varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
nutriscore char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
url text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
substitut_id int(11) NOT NULL DEFAULT '0',
category_id int(6) unsigned DEFAULT NULL,
category_name varchar(80) DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `Temp`
--

CREATE TABLE Temp (
id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
name varchar(150) NOT NULL,
nutriscore char(1) NOT NULL DEFAULT '0',
category_name varchar(150) DEFAULT NULL,
url text NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY name (name)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- View substitut_product
--
CREATE VIEW substitut_product
AS SELECT Product.category_name as category,
Product.name as name, 
Product.substitut_id as substitut_id
FROM Product WHERE Product.substitut_id <> 0
ORDER BY Product.name;




/*Stored procedure Temp>Product*/
DELIMITER |
CREATE PROCEDURE fill_database()
BEGIN
    /*Fill Product table*/
    INSERT INTO Product (name, nutriscore, url, category_name)
    SELECT name, nutriscore, url, category_name  FROM Temp;
    /*Fill Category table */ 
    INSERT INTO Category (name) 
    SELECT DISTINCT category_name FROM Temp;
    /*Update Product with category id corresponding for each product*/
    UPDATE Product
    INNER JOIN Category ON Category.name = Product.category_name
    SET Product.category_id = Category.id
    WHERE Product.category_name = Category.name;
    /*Empty Temp Table*/
    TRUNCATE TABLE Temp;
END |
DELIMITER ;




