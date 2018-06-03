-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 03 Juin 2018 à 20:24
-- Version du serveur :  5.7.22-0ubuntu0.16.04.1
-- Version de PHP :  7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `alimentationV2`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_database` ()  BEGIN
    
    INSERT INTO Product (name, nutriscore, url, category_name)
    SELECT name, nutriscore, url, category_name  FROM Temp;
     
    INSERT INTO Category (name) 
    SELECT DISTINCT category_name FROM Temp;
    
    UPDATE Product
    INNER JOIN Category ON Category.name = Product.category_name
    SET Product.category_id = Category.id
    WHERE Product.category_name = Category.name;
    
    TRUNCATE TABLE Temp;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Product`
--

CREATE TABLE `Product` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `nutriscore` char(1) DEFAULT NULL,
  `url` text NOT NULL,
  `substitut_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(6) UNSIGNED DEFAULT NULL,
  `category_name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Temp`
--

CREATE TABLE `Temp` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `nutriscore` char(1) NOT NULL DEFAULT '0',
  `category_name` varchar(150) DEFAULT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Temp`
--
ALTER TABLE `Temp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Temp`
--
ALTER TABLE `Temp`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
