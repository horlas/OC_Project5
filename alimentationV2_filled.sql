-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 03 Juin 2018 à 20:30
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

--
-- Contenu de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(1, 'Dried fruits'),
(2, ''),
(3, 'Fats'),
(4, 'Sweets'),
(5, 'Cheese'),
(6, 'unknown'),
(7, 'One-dish meals'),
(8, 'Legumes'),
(9, 'Processed meat'),
(10, 'Ice cream'),
(11, 'Sandwich'),
(12, 'Pizza pies and quiche');

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

--
-- Contenu de la table `Product`
--

INSERT INTO `Product` (`id`, `name`, `nutriscore`, `url`, `substitut_id`, `category_id`, `category_name`) VALUES
(1, 'Cocktail gourmand', 'b', 'https://fr.openfoodfacts.org/produit/3564700709689/cocktail-gourmand-couleurs-vives', 0, 1, 'Dried fruits'),
(2, 'Dattes Branchées Deglet Nour', 'b', 'https://fr.openfoodfacts.org/produit/3564700709689/cocktail-gourmand-couleurs-vives', 0, 1, 'Dried fruits'),
(3, 'Pâte de Dattes tunisienne', 'c', 'https://fr.openfoodfacts.org/produit/3433791013008/pate-de-dattes-tunisienne-star', 0, 1, 'Dried fruits'),
(4, 'Dattes', 'c', 'https://fr.openfoodfacts.org/produit/8480000349064/dattes-hacendado', 0, 1, 'Dried fruits'),
(5, 'Dattes Sukari', 'b', 'https://fr.openfoodfacts.org/produit/7629999023857/dattes-sukari-palmyra', 0, 1, 'Dried fruits'),
(6, 'Dattes Medjoul', 'c', 'https://fr.openfoodfacts.org/produit/7291008084915/dattes-medjoul-mehadrin', 0, 1, 'Dried fruits'),
(7, 'Dattes Moelleuses Bio', 'c', 'https://fr.openfoodfacts.org/produit/3180840005520/dattes-domino', 0, 1, 'Dried fruits'),
(8, 'Dattes Fraîches Mazafati d\'Iran', 'b', 'https://fr.openfoodfacts.org/produit/3760104000104/dattes-fraiches-mazafati-d-iran-sans-marque', 0, 1, 'Dried fruits'),
(9, 'Dattes Moelleuses', 'c', 'https://fr.openfoodfacts.org/produit/3068230013440/dattes-moelleuses-sun', 0, 1, 'Dried fruits'),
(10, 'Dattes Deglet Nour', 'c', 'https://fr.openfoodfacts.org/produit/3191220000035/dattes-deglet-nour-brousse-vergez', 0, 1, 'Dried fruits'),
(11, 'Pruneaux d\'Agen', 'c', 'https://fr.openfoodfacts.org/produit/3502490013203/pruneaux-d-agen-maitre-prunille', 0, 1, 'Dried fruits'),
(12, 'Formule détente', 'c', 'https://fr.openfoodfacts.org/produit/3270720090095/formule-detente-daco-bello', 0, 1, 'Dried fruits'),
(13, 'Abricots Moelleux', 'a', 'https://fr.openfoodfacts.org/produit/3396410097028/abricots-moelleux-le-sillon', 0, 1, 'Dried fruits'),
(14, 'Figues Layers seches de Turquie', 'c', 'https://fr.openfoodfacts.org/produit/3068238504353/figues-layers-seches-de-turquie-la-favorite', 0, 1, 'Dried fruits'),
(15, 'Dattes avec noyaux', 'b', 'https://fr.openfoodfacts.org/produit/3245414087965/dattes-avec-noyaux-carrefour', 0, 1, 'Dried fruits'),
(16, 'Abricots secs', 'b', 'https://fr.openfoodfacts.org/produit/3700036901018/abricots-secs-naturalia', 0, 1, 'Dried fruits'),
(17, 'Abricots séchés', 'a', 'https://fr.openfoodfacts.org/produit/3502490189588/abricots-seches-maitre-prunille', 0, 1, 'Dried fruits'),
(18, 'Abricot sec', 'a', 'https://fr.openfoodfacts.org/produit/3502490189588/abricots-seches-maitre-prunille', 0, 1, 'Dried fruits'),
(19, 'Abricots Moelleux Dénoyautés Bio', 'a', 'https://fr.openfoodfacts.org/produit/3245414088153/abricots-moelleux-denoyautes-bio-carrefour', 0, 1, 'Dried fruits'),
(20, 'Abricots Moelleux Bio', 'b', 'https://fr.openfoodfacts.org/produit/3596710341030/abricots-moelleux-bio-auchan', 0, 1, 'Dried fruits'),
(21, 'Abricot séchés', 'c', 'https://fr.openfoodfacts.org/produit/3700066102614/abricot-seches-arev', 0, 1, 'Dried fruits'),
(22, 'Abricots Moelleux - 500g - Les vergers d’escoute', 'c', 'https://fr.openfoodfacts.org/produit/3481010000483/abricots-moelleux-500g-les-vergers-d-escoute', 0, 1, 'Dried fruits'),
(23, 'Mangue Tranches', 'c', 'https://fr.openfoodfacts.org/produit/3396410216788/mangue-tranches-le-sillon', 0, 1, 'Dried fruits'),
(24, 'Figue Moelleuses', 'b', 'https://fr.openfoodfacts.org/produit/3396410014964/figue-moelleuses-le-sillon', 0, 1, 'Dried fruits'),
(25, 'Abricot de Turquie', 'a', 'https://fr.openfoodfacts.org/produit/3396410014957/abricot-de-turquie-le-sillon', 0, 1, 'Dried fruits'),
(26, 'Abricot moelleux/ abricots sec réhydratés', 'a', 'https://fr.openfoodfacts.org/produit/3000026006342/abricot-moelleux-abricots-sec-rehydrates-fruit-mouelleux', 0, 1, 'Dried fruits'),
(27, 'Abricots moelleux biologiques', 'a', 'https://fr.openfoodfacts.org/produit/3502490210626/abricots-moelleux-biologiques-leader-price', 0, 1, 'Dried fruits'),
(28, 'Abricots bio moelleux', 'b', 'https://fr.openfoodfacts.org/produit/3266191016504/abricots-moelleux-la-vie-claire', 0, 1, 'Dried fruits'),
(29, 'Abricots seches ultra moelleux', 'c', 'https://fr.openfoodfacts.org/produit/3452519050521/abricots-seches-ultra-moelleux-lilifruit', 0, 1, 'Dried fruits'),
(30, 'Figues sèches', 'b', 'https://fr.openfoodfacts.org/produit/3325359903718/figues-seches-holy-fruits', 0, 1, 'Dried fruits'),
(31, 'Amandes émondées,', 'a', 'https://fr.openfoodfacts.org/produit/3256220658959/amandes-emondees-u', 0, 1, 'Dried fruits'),
(32, 'Raisin Golden,', 'c', 'https://fr.openfoodfacts.org/produit/3256220658935/raisin-golden-u', 0, 1, 'Dried fruits'),
(33, 'Dattes Dénoyautées', 'a', 'https://fr.openfoodfacts.org/produit/3502490008872/dattes-denoyautees-maitre-prunille', 0, 1, 'Dried fruits'),
(34, 'ABRICOTS BIO', 'b', 'https://fr.openfoodfacts.org/produit/3760250010729/abricots-bio', 0, 1, 'Dried fruits'),
(35, 'Abricots', 'c', 'https://fr.openfoodfacts.org/produit/3481010099524/abricots-les-vergers-d-escoute', 0, 1, 'Dried fruits'),
(36, 'Raisins Moelleux Sultanines - Maître Prunille', 'c', 'https://fr.openfoodfacts.org/produit/3481010099524/abricots-les-vergers-d-escoute', 0, 1, 'Dried fruits'),
(37, 'Abricots séchés extra moelleux', 'c', 'https://fr.openfoodfacts.org/produit/3452519050125/abricots-seches-extra-moelleux-lilifruit', 0, 1, 'Dried fruits'),
(38, 'Abricots secs entiers', 'c', 'https://fr.openfoodfacts.org/produit/3452519050125/abricots-seches-extra-moelleux-lilifruit', 0, 1, 'Dried fruits'),
(39, 'Abricot sans sucres ajoutés', 'c', 'https://fr.openfoodfacts.org/produit/3270720014022/abricot-sans-sucres-ajoutes-daco-bello', 0, 1, 'Dried fruits'),
(40, '', '', 'https://fr.openfoodfacts.org/categorie/produits-a-tartiner/1.json', 0, 2, ''),
(41, 'Beurre traditionnel demi-sel', 'e', 'https://fr.openfoodfacts.org/produit/3222472772606/beurre-traditionnel-demi-sel-casino', 0, 3, 'Fats'),
(42, 'Confiture extra fraise', 'd', 'https://fr.openfoodfacts.org/produit/3564700011119/confiture-extra-fraise-mamie-douceur', 0, 4, 'Sweets'),
(43, 'Gelées fruits de la passion', 'd', 'https://fr.openfoodfacts.org/produit/3760124234015/gelees-fruits-de-la-passion-la-cuillere-gourmande', 0, 4, 'Sweets'),
(44, 'Marmelades citron à la mentonnaise', 'd', 'https://fr.openfoodfacts.org/produit/3760124231359/marmelades-citron-a-la-mentonnaise-la-cuillere-gourmande', 0, 4, 'Sweets'),
(45, 'Confiture peche de vigne', 'c', 'https://fr.openfoodfacts.org/produit/3700238304860/confiture-peche-de-vigne-jean-d-audignac', 0, 4, 'Sweets'),
(46, 'Confiture de myrtille bio', 'c', 'https://fr.openfoodfacts.org/produit/3700238304860/confiture-peche-de-vigne-jean-d-audignac', 0, 4, 'Sweets'),
(47, 'Confipote cerise', 'c', 'https://fr.openfoodfacts.org/produit/3021762383320/confipote-cerise-materne', 0, 4, 'Sweets'),
(48, 'Confipote abricot', 'c', 'https://fr.openfoodfacts.org/produit/3021762383313/confipote-abricot-materne', 0, 4, 'Sweets'),
(49, 'Mangue cuite au chaudron', 'c', 'https://fr.openfoodfacts.org/produit/3700238382431/mangue-cuite-au-chaudron-jean-d-audignac', 0, 4, 'Sweets'),
(50, 'Confiture de fraise', 'c', 'https://fr.openfoodfacts.org/produit/3339500610202/confiture-de-fraise-confitures-ardechoises', 0, 4, 'Sweets'),
(51, 'Préparation de clémentines et oranges de Corse', 'd', 'https://fr.openfoodfacts.org/produit/3250390783275/preparation-de-clementines-et-oranges-de-corse-itineraire-des-saveurs', 0, 4, 'Sweets'),
(52, 'Miel de Tomillo', 'd', 'https://fr.openfoodfacts.org/produit/3250390783275/preparation-de-clementines-et-oranges-de-corse-itineraire-des-saveurs', 0, 4, 'Sweets'),
(53, 'Confiture d\'abricot au poivre de timut', 'c', 'https://fr.openfoodfacts.org/produit/3701090800460/confiture-d-abricot-au-poivre-de-timut-maison-perrotte', 0, 4, 'Sweets'),
(54, 'Pâte à tartiner noir noisette', 'd', 'https://fr.openfoodfacts.org/produit/3760170099842/pate-a-tartiner-noir-noisette-le-comptoir-de-mathilde', 0, 4, 'Sweets'),
(55, 'Pâte à tartiner', 'd', 'https://fr.openfoodfacts.org/produit/3760170092560/pate-a-tartiner-le-comptoir-de-mathilde', 0, 4, 'Sweets'),
(56, 'Beurre Extra-Fin Doux (82 % MG)', 'e', 'https://fr.openfoodfacts.org/produit/3354599571005/beurre-extra-fin-doux-82-mg-grand-fermage', 0, 3, 'Fats'),
(57, 'Pâte à tartiner au cacao cru', 'd', 'https://fr.openfoodfacts.org/produit/3760213863331/pate-a-tartiner-au-cacao-cru-sol-semilla', 0, 4, 'Sweets'),
(58, 'Crème à Tartiner de Roquefort', 'd', 'https://fr.openfoodfacts.org/produit/3376960009429/creme-a-tartiner-de-roquefort-gabriel-coulet', 0, 5, 'Cheese'),
(59, 'Miel de fleur d\'oranger', 'd', 'https://fr.openfoodfacts.org/produit/3376960009429/creme-a-tartiner-de-roquefort-gabriel-coulet', 0, 5, 'Cheese'),
(60, 'Tartinade de legumes Trio de poivrons', 'c', 'https://fr.openfoodfacts.org/produit/3396411224195/tartinade-de-legumes-trio-de-poivrons-bonneterre', 0, 6, 'unknown'),
(61, 'Caviar D\'aubergine Grillee', 'c', 'https://fr.openfoodfacts.org/produit/3335880005898/caviar-d-aubergine-grillee-prosain', 0, 7, 'One-dish meals'),
(62, 'Houmous Purée de pois chiches aux gra8nes de sésame', 'd', 'https://fr.openfoodfacts.org/produit/3564700435380/houmous-puree-de-pois-chiches-aux-gra8nes-de-sesame-tables-du-monde', 0, 6, 'unknown'),
(63, 'Den Gamle Fabrik Hallonmarmelad', 'd', 'https://fr.openfoodfacts.org/produit/5701211012909/den-gamle-fabrik-hallonmarmelad', 0, 4, 'Sweets'),
(64, 'Confiture d\'orange', 'c', 'https://fr.openfoodfacts.org/produit/3519623612011/confiture-d-orange-anne-rozes', 0, 4, 'Sweets'),
(65, 'Confiture de Framboise', 'd', 'https://fr.openfoodfacts.org/produit/3588280000370/confiture-de-framboise-tea-together', 0, 4, 'Sweets'),
(66, 'Marshmallow Fluff Strawberry', 'd', 'https://fr.openfoodfacts.org/produit/0052600312755/marshmallow-fluff-strawberry-durkee', 0, 4, 'Sweets'),
(67, 'Beurre Doux', 'e', 'https://fr.openfoodfacts.org/produit/3270190020288/beurre-doux-carrefour', 0, 3, 'Fats'),
(68, 'Confiture extra fraises', 'c', 'https://fr.openfoodfacts.org/produit/3222472111351/confiture-extra-fraises-casino', 0, 4, 'Sweets'),
(69, 'Le Caramel de Pommes Dieppois - Cannelle', 'e', 'https://fr.openfoodfacts.org/produit/3700548200012/le-caramel-de-pommes-dieppois-cannelle-les-marmitons-d-etran', 0, 4, 'Sweets'),
(70, 'Beurre Extra-Fin Doux', 'e', 'https://fr.openfoodfacts.org/produit/3564700014523/beurre-extra-fin-doux-les-croises', 0, 3, 'Fats'),
(71, 'Beurre de Baratte', 'e', 'https://fr.openfoodfacts.org/produit/3252920012350/beurre-de-baratte-le-gall', 0, 3, 'Fats'),
(72, 'Confiture de Framboises', 'c', 'https://fr.openfoodfacts.org/produit/3396745000144/confiture-de-framboises-francis-miot', 0, 4, 'Sweets'),
(73, 'Beurre demi-sel', 'e', 'https://fr.openfoodfacts.org/produit/3114270300214/beurre-demi-sel-le-marin', 0, 3, 'Fats'),
(74, 'Confiture artisanale myrtille sauvage au sucre de canne roux', 'd', 'https://fr.openfoodfacts.org/produit/3760128080281/confiture-artisanale-myrtille-sauvage-au-sucre-de-canne-roux-les-confitures-de-la-creation', 0, 4, 'Sweets'),
(75, 'Purée d\'amande complète', 'c', 'https://fr.openfoodfacts.org/produit/3390390001600/puree-d-amande-complete-ti-bio', 0, 6, 'unknown'),
(76, 'Beurre St hubert bio sel de mer', 'd', 'https://fr.openfoodfacts.org/produit/3366321052348/beurre-st-hubert-bio-sel-de-mer', 0, 3, 'Fats'),
(77, 'Miel de fleurs et noisettes', '', 'https://fr.openfoodfacts.org/categorie/produits-a-tartiner/3.json', 0, 2, ''),
(78, 'Caramel au lait', 'd', 'https://fr.openfoodfacts.org/produit/3700961303642/caramel-au-lait-le-comptoir-de-mathilde', 0, 4, 'Sweets'),
(79, 'Pâte à tartiner aux pralines', 'e', 'https://fr.openfoodfacts.org/produit/3580280775234/pate-a-tartiner-aux-pralines-pates-a-tartiner-aux-pralines', 0, 4, 'Sweets'),
(80, 'Miel doux', 'e', 'https://fr.openfoodfacts.org/produit/3580280775234/pate-a-tartiner-aux-pralines-pates-a-tartiner-aux-pralines', 0, 4, 'Sweets'),
(81, 'Miel à la Cannelle', 'e', 'https://fr.openfoodfacts.org/produit/3580280775234/pate-a-tartiner-aux-pralines-pates-a-tartiner-aux-pralines', 0, 4, 'Sweets'),
(82, 'Confiture Prune Cannelle', 'e', 'https://fr.openfoodfacts.org/produit/3580280775234/pate-a-tartiner-aux-pralines-pates-a-tartiner-aux-pralines', 0, 4, 'Sweets'),
(83, 'Beurre de Cacahuète Croquant à la Cannelle', 'a', 'https://fr.openfoodfacts.org/produit/5600854623360/beurre-de-cacahuete-croquant-a-la-cannelle-prozis', 0, 8, 'Legumes'),
(84, 'Rillettes poulet rotis', 'd', 'https://fr.openfoodfacts.org/produit/3024720026543/rillettes-poulet-rotis-bordeau-chesnel', 0, 9, 'Processed meat'),
(85, 'Beurre', 'd', 'https://fr.openfoodfacts.org/produit/8722700170518/beurre-planta-fin', 0, 3, 'Fats'),
(86, 'Délice de Potimarron Cannelle', 'd', 'https://fr.openfoodfacts.org/produit/3760163630663/delice-de-potimarron-cannelle-saveurs-du-vercors', 0, 4, 'Sweets'),
(87, 'Confiture extra d\'abricot 60% de fruits', 'c', 'https://fr.openfoodfacts.org/produit/3299430030108/confiture-extra-d-abricot-60-de-fruits-saveurs-attitudes', 0, 4, 'Sweets'),
(88, 'Doux Le Pays (60% MG)', 'e', 'https://fr.openfoodfacts.org/produit/3175910001182/doux-le-pays-60-mg-le-pays-fromager', 0, 3, 'Fats'),
(89, 'Gelée de groseilles', 'd', 'https://fr.openfoodfacts.org/produit/3278930000224/gelee-de-groseilles-bretagne-specialites', 0, 4, 'Sweets'),
(90, 'Miel des Agriate', 'd', 'https://fr.openfoodfacts.org/produit/3278930000224/gelee-de-groseilles-bretagne-specialites', 0, 4, 'Sweets'),
(91, 'Beurre tendre demi-sel', 'e', 'https://fr.openfoodfacts.org/produit/3155250366974/beurre-tendre-demi-sel-president', 0, 3, 'Fats'),
(92, 'Confiture abricot', 'c', 'https://fr.openfoodfacts.org/produit/3558390003141/confiture-abricot-les-vergers-de-melanie', 0, 4, 'Sweets'),
(93, 'Specialité gourmande', 'c', 'https://fr.openfoodfacts.org/produit/3546940305937/specialite-gourmande-les-vergers-de-melanie', 0, 4, 'Sweets'),
(94, 'NUT+', 'e', 'https://fr.openfoodfacts.org/produit/3760076001208/nut-nute', 0, 4, 'Sweets'),
(95, 'Beurre doux gastronomique', 'e', 'https://fr.openfoodfacts.org/produit/3155251205500/beurre-doux-gastronomique-president', 0, 3, 'Fats'),
(96, 'Sorbets Citrons Framboises', 'c', 'https://fr.openfoodfacts.org/produit/7613035452930/sorbets-citrons-framboises-extreme', 0, 10, 'Ice cream'),
(97, 'Maxi Gourmand Goût Chantilly', 'd', 'https://fr.openfoodfacts.org/produit/3250392009533/maxi-gourmand-gout-chantilly-netto', 0, 10, 'Ice cream'),
(98, 'Petits Cônes Fraise et Vanille', 'd', 'https://fr.openfoodfacts.org/produit/3596710450299/petits-cones-fraise-et-vanille-auchan', 0, 10, 'Ice cream'),
(99, 'Cônes Fraise Vanille', 'd', 'https://fr.openfoodfacts.org/produit/7613031608065/cones-fraise-vanille-extreme', 0, 10, 'Ice cream'),
(100, 'Extrême Original Fraise Vanille Sauce fruits rouges', 'd', 'https://fr.openfoodfacts.org/produit/7613031608065/cones-fraise-vanille-extreme', 0, 10, 'Ice cream'),
(101, '6 Cônes Vanille / Fraise', 'd', 'https://fr.openfoodfacts.org/produit/3254563260464/6-cones-vanille-fraise-auchan', 0, 10, 'Ice cream'),
(102, 'Glace Mini Cônes', 'e', 'https://fr.openfoodfacts.org/produit/4007993014317/glace-mini-cones-milka', 0, 6, 'unknown'),
(103, 'Cônes Vanille Praliné', 'd', 'https://fr.openfoodfacts.org/produit/3348261204704/cones-vanille-praline-carrefour', 0, 10, 'Ice cream'),
(104, 'Extrême Fraise Vanille onctueuses', 'd', 'https://fr.openfoodfacts.org/produit/7613035887930/extreme-fraise-vanille-onctueuses-nestle', 0, 10, 'Ice cream'),
(105, 'Cônes Cœur de Chocolat', 'd', 'https://fr.openfoodfacts.org/produit/3250392017118/cones-coeur-de-chocolat-netto', 0, 10, 'Ice cream'),
(106, 'Cône Vanille Amandes caramélisées', 'd', 'https://fr.openfoodfacts.org/produit/7613034479709/cone-vanille-amandes-caramelisees-extreme', 0, 10, 'Ice cream'),
(107, 'Cônes Soja Chocolat', 'd', 'https://fr.openfoodfacts.org/produit/8006040710826/cones-soja-chocolat-naturattiva', 0, 10, 'Ice cream'),
(108, 'Magnum Mini Cookie Crumble White Ice Cream', 'e', 'https://fr.openfoodfacts.org/produit/8714100665350/magnum-mini-cookie-crumble-white-ice-cream', 0, 10, 'Ice cream'),
(109, 'Vanille Pécan x6', 'd', 'https://fr.openfoodfacts.org/produit/3256224934301/vanille-pecan-x6-u', 0, 10, 'Ice cream'),
(110, 'Cônes Saveur Crème brûlée', 'e', 'https://fr.openfoodfacts.org/produit/3263856690215/cones-saveur-creme-brulee-leader-price', 0, 10, 'Ice cream'),
(111, 'Glace avec des morceaux de biscuit Oreo', 'd', 'https://fr.openfoodfacts.org/produit/4007993017066/glace-avec-des-morceaux-de-biscuit-oreo', 0, 10, 'Ice cream'),
(112, 'Mini Cônes Chocolat', 'd', 'https://fr.openfoodfacts.org/produit/3270160358854/mini-cones-chocolat-picard', 0, 6, 'unknown'),
(113, 'Cône Vanille & Caramel - Chocolat Craquant - Extrême Les Sélections', 'd', 'https://fr.openfoodfacts.org/produit/7613034478313/cone-vanille-caramel-chocolat-craquant-extreme-les-selections-nestle', 0, 10, 'Ice cream'),
(114, 'Cône Coco Sorbets Exotiques', 'd', 'https://fr.openfoodfacts.org/produit/7613035453593/cone-coco-sorbets-exotiques-extreme', 0, 10, 'Ice cream'),
(115, 'Extrême Collection Délice Fruits Rouges Glace Veloutée', 'c', 'https://fr.openfoodfacts.org/produit/7613035007789/extreme-collection-delice-fruits-rouges-glace-veloutee-nestle', 0, 10, 'Ice cream'),
(116, 'Cône à l\'Américaine Vanilla Pécan', 'd', 'https://fr.openfoodfacts.org/produit/7613033113727/cone-a-l-americaine-vanilla-pecan-nestle', 0, 10, 'Ice cream'),
(117, 'Extrême Original Cône Vanille Praliné', 'd', 'https://fr.openfoodfacts.org/produit/7613034077943/extreme-original-cone-vanille-praline-nestle', 0, 10, 'Ice cream'),
(118, 'Extrême Original Cônes Glacés Chocolat Pépites de Nougatine', 'c', 'https://fr.openfoodfacts.org/produit/7613760975476/extreme-original-cones-glaces-chocolat-pepites-de-nougatine-nestle', 0, 10, 'Ice cream'),
(119, 'Cônes Extrême Chocolat Craquant - Vanille et Chocolat ', 'd', 'https://fr.openfoodfacts.org/produit/7613034478474/cones-extreme-chocolat-craquant-vanille-et-chocolat-nestle', 0, 10, 'Ice cream'),
(120, 'Emmental crudités', 'd', 'https://fr.openfoodfacts.org/produit/3242272864257/emmental-crudites-sodebo', 0, 11, 'Sandwich'),
(121, 'Poulet sauce tandoori salade', 'b', 'https://fr.openfoodfacts.org/produit/26002170/poulet-sauce-tandoori-salade-bistro-vite', 0, 11, 'Sandwich'),
(122, 'Sandwich Poulet Rôti Salade', 'c', 'https://fr.openfoodfacts.org/produit/3242272859055/sandwich-poulet-roti-salade-sodebo', 0, 11, 'Sandwich'),
(123, 'Le mega Jambon Emmental', 'c', 'https://fr.openfoodfacts.org/produit/3242272980759/le-mega-jambon-emmental-sodebo', 0, 11, 'Sandwich'),
(124, 'Sandwich jambon beurre', 'd', 'https://fr.openfoodfacts.org/produit/3564700564394/sandwich-jambon-beurre-marque-repere', 0, 11, 'Sandwich'),
(125, 'Club suédois Jambon cheddar', 'd', 'https://fr.openfoodfacts.org/produit/3367651005325/club-suedois-jambon-cheddar-daunat', 0, 11, 'Sandwich'),
(126, '2 Cheese Burgers', 'd', 'https://fr.openfoodfacts.org/produit/3258561411194/2-cheese-burgers-belle-france', 0, 11, 'Sandwich'),
(127, 'Poulet rôti', 'c', 'https://fr.openfoodfacts.org/produit/3250391101764/poulet-roti-monique-ranou', 0, 11, 'Sandwich'),
(128, 'Pause Snack Thon', 'c', 'https://fr.openfoodfacts.org/produit/3596710413713/pause-snack-thon-auchan', 0, 11, 'Sandwich'),
(129, 'Croque Monsieur', 'd', 'https://fr.openfoodfacts.org/produit/3222475891045/croque-monsieur-casino', 0, 11, 'Sandwich'),
(130, 'Wrap Poulet Crudités', 'b', 'https://fr.openfoodfacts.org/produit/3560070711871/wrap-poulet-crudites-bon-app', 0, 11, 'Sandwich'),
(131, 'Cheeseburgers', 'd', 'https://fr.openfoodfacts.org/produit/3257981176218/cheeseburgers-cora', 0, 11, 'Sandwich'),
(132, 'Sandwich Poulet Crudités', 'b', 'https://fr.openfoodfacts.org/produit/3257983751789/sandwich-poulet-crudites-cora', 0, 11, 'Sandwich'),
(133, 'Sandwich', 'c', 'https://fr.openfoodfacts.org/produit/3367651001853/sandwich-daunat', 0, 11, 'Sandwich'),
(134, 'Les Minis Maxi Moelleux Blanc de Poulet Emmental', 'd', 'https://fr.openfoodfacts.org/produit/3367651001891/les-minis-maxi-moelleux-blanc-de-poulet-emmental-daunat', 0, 11, 'Sandwich'),
(135, 'Wrap Jambon Chèvre', 'c', 'https://fr.openfoodfacts.org/produit/3560070711901/wrap-jambon-chevre-carrefour-bon-app', 0, 11, 'Sandwich'),
(136, 'Le Méga Club Suédois Poulet Œuf', 'c', 'https://fr.openfoodfacts.org/produit/3242272981558/le-mega-club-suedois-poulet-oeuf-sodebo', 0, 11, 'Sandwich'),
(137, 'Baguette viennoise Thon Tomate Oeuf', 'b', 'https://fr.openfoodfacts.org/produit/3560070563777/baguette-viennoise-thon-tomate-oeuf-bon-app', 0, 11, 'Sandwich'),
(138, 'Sandwich Jambon Emmental Mayonnaise Allégée', 'd', 'https://fr.openfoodfacts.org/produit/3323790322310/sandwich-jambon-emmental-mayonnaise-allegee-sans-marque', 0, 11, 'Sandwich'),
(139, 'Le Moelleux Pain viennois Thon oeuf crudités Sauce cocktail', 'c', 'https://fr.openfoodfacts.org/produit/3367651002812/le-moelleux-pain-viennois-thon-oeuf-crudites-sauce-cocktail-daunat', 0, 11, 'Sandwich'),
(140, 'Saumon pointe de citron', 'c', 'https://fr.openfoodfacts.org/produit/3242272845256/saumon-pointe-de-citron-sodebo', 0, 11, 'Sandwich'),
(141, 'Sandwich polaire jambon emmental salade U', 'd', 'https://fr.openfoodfacts.org/produit/3256224756781/sandwich-polaire-jambon-emmental-salade-u', 0, 11, 'Sandwich'),
(142, 'Sandwich Thon crudités', 'b', 'https://fr.openfoodfacts.org/produit/3258561471204/sandwich-thon-crudites-belle-france', 0, 11, 'Sandwich'),
(143, 'Sandwich nordique saumon oeufs ciboulette', 'd', 'https://fr.openfoodfacts.org/produit/3258561471181/sandwich-nordique-saumon-oeufs-ciboulette-belle-france', 0, 11, 'Sandwich'),
(144, 'Wrap Poulet', 'b', 'https://fr.openfoodfacts.org/produit/3560071012229/wrap-poulet-bon-app', 0, 11, 'Sandwich'),
(145, 'Le Goûteux Jambon Emmental', 'c', 'https://fr.openfoodfacts.org/produit/3367651003307/le-gouteux-jambon-emmental-daunat', 0, 11, 'Sandwich'),
(146, 'Jambon Emmental', 'd', 'https://fr.openfoodfacts.org/produit/3250390764601/jambon-emmental-monique-ranou', 0, 11, 'Sandwich'),
(147, 'Jambon Beurre Le Gouteux', 'd', 'https://fr.openfoodfacts.org/produit/3367651003956/jambon-beurre-le-gouteux-daunat', 0, 11, 'Sandwich'),
(148, 'Le Club Bio Féta AOP & se légumes', 'd', 'https://fr.openfoodfacts.org/produit/3367651007718/le-club-bio-feta-aop-se-legumes-daunat', 0, 11, 'Sandwich'),
(149, 'Club Sandwich chèvre concombre sauce basilic', 'c', 'https://fr.openfoodfacts.org/produit/3367651002669/club-sandwich-chevre-concombre-sauce-basilic-daunat', 0, 11, 'Sandwich'),
(150, 'Tendre Croc\' L\'Original Jambon Fromage Format Familial', 'd', 'https://fr.openfoodfacts.org/produit/7613035514966/tendre-croc-l-original-jambon-fromage-format-familial-herta', 0, 11, 'Sandwich'),
(151, 'Sandwich Baguette Jambon Crudités', 'c', 'https://fr.openfoodfacts.org/produit/3258561471228/sandwich-baguette-jambon-crudites-belle-france', 0, 11, 'Sandwich'),
(152, 'Club jambon emmental', 'd', 'https://fr.openfoodfacts.org/produit/20146160/club-jambon-emmental-chef-select-to-go', 0, 11, 'Sandwich'),
(153, 'Sandwich club poulet rôti crudités', 'c', 'https://fr.openfoodfacts.org/produit/3256222245218/sandwich-club-poulet-roti-crudites-u', 0, 11, 'Sandwich'),
(154, 'Bioburger Noisettes Amandes', 'c', 'https://fr.openfoodfacts.org/produit/3256222245218/sandwich-club-poulet-roti-crudites-u', 0, 11, 'Sandwich'),
(155, 'Poulet Crudités Oeuf Baguette Viennoise', 'a', 'https://fr.openfoodfacts.org/produit/3560070563746/poulet-crudites-oeuf-baguette-viennoise-bonapp', 0, 11, 'Sandwich'),
(156, 'Sandwich Jambon Emmental', 'd', 'https://fr.openfoodfacts.org/produit/3242272907251/sandwich-jambon-emmental-sodebo', 0, 11, 'Sandwich'),
(157, 'Cheese Burger', 'd', 'https://fr.openfoodfacts.org/produit/3250392226725/cheese-burger-jean-roze', 0, 11, 'Sandwich'),
(158, 'Wrappy Bacon grillé œufs tomates marinées sauce yaourt', 'd', 'https://fr.openfoodfacts.org/produit/3367651002973/wrappy-bacon-grille-oeufs-tomates-marinees-sauce-yaourt-daunat', 0, 11, 'Sandwich'),
(159, 'Pain complet moelleux Thon Tomate', 'c', 'https://fr.openfoodfacts.org/produit/3367651002225/pain-complet-moelleux-thon-tomate-daunat', 0, 11, 'Sandwich'),
(160, 'Jambon Cheddar', 'd', 'https://fr.openfoodfacts.org/produit/20267674/jambon-cheddar-chef-select-to-go', 0, 11, 'Sandwich'),
(161, 'Wraps Poulet Rôti Sauce Pesto', 'b', 'https://fr.openfoodfacts.org/produit/20637842/wraps-poulet-roti-sauce-pesto-chef-select-to-go', 0, 11, 'Sandwich'),
(162, 'Sandwich Jambon-Emmental', 'd', 'https://fr.openfoodfacts.org/produit/3222472642473/sandwich-jambon-emmental-casino', 0, 11, 'Sandwich'),
(163, 'Mini viennois', 'd', 'https://fr.openfoodfacts.org/produit/20637811/mini-viennois-chef-to-go-select', 0, 11, 'Sandwich'),
(164, 'Wrap blé complet', 'a', 'https://fr.openfoodfacts.org/produit/8410076470812/wrap-ble-complet-old-el-paso', 0, 11, 'Sandwich'),
(165, 'Le méga poulet rôti crudités', 'b', 'https://fr.openfoodfacts.org/produit/3242272980858/le-mega-poulet-roti-crudites-sodebo', 0, 11, 'Sandwich'),
(166, 'Maxi Thon œuf salade', 'b', 'https://fr.openfoodfacts.org/produit/3242272907350/maxi-thon-oeuf-salade-sodebo', 0, 11, 'Sandwich'),
(167, 'Wraps', 'b', 'https://fr.openfoodfacts.org/produit/8410076472953/wraps-old-el-paso', 0, 11, 'Sandwich'),
(168, 'Mon club sandwich Thon salade', 'c', 'https://fr.openfoodfacts.org/produit/26026268/mon-club-sandwich-thon-salade-bistro-vite', 0, 11, 'Sandwich'),
(169, 'Plaisir vrai! Thon Crudités Mayonnaise légère', 'c', 'https://fr.openfoodfacts.org/produit/3367651000016/plaisir-vrai-thon-crudites-mayonnaise-legere-daunat', 0, 11, 'Sandwich'),
(170, 'Maxi Poulet Rôti Crudités', 'b', 'https://fr.openfoodfacts.org/produit/3242272897750/maxi-poulet-roti-crudites-sodebo', 0, 11, 'Sandwich'),
(171, 'Bagel', 'd', 'https://fr.openfoodfacts.org/produit/3270160830695/bagel-delice-d-un-instant', 0, 11, 'Sandwich'),
(172, 'McWrap Bœuf Deluxe', 'd', 'https://fr.openfoodfacts.org/produit/2000000067583/mcwrap-boeuf-deluxe-mcdonald-s', 0, 11, 'Sandwich'),
(173, 'Maxi Poulet Crudités', 'b', 'https://fr.openfoodfacts.org/produit/3245412697739/maxi-poulet-crudites-carrefour', 0, 11, 'Sandwich'),
(174, 'Le gourmand - Poulet caesar', 'c', 'https://fr.openfoodfacts.org/produit/3242272845157/le-gourmand-poulet-caesar-sodebo', 0, 11, 'Sandwich'),
(175, 'La Rosca Rustica Serrana', 'c', 'https://fr.openfoodfacts.org/produit/8437012185300/la-rosca-rustica-serrana-mister-crock', 0, 11, 'Sandwich'),
(176, 'Bacon Oeuf Mimosa', 'c', 'https://fr.openfoodfacts.org/produit/3560070563654/bacon-oeuf-mimosa-carrefour', 0, 11, 'Sandwich'),
(177, 'Burrito', 'c', 'https://fr.openfoodfacts.org/produit/20121570/burrito-el-tequito', 0, 11, 'Sandwich'),
(178, 'Déli\'Pocket Montagnard', 'd', 'https://fr.openfoodfacts.org/produit/20638009/deli-pocket-montagnard-trattoria-alfredo', 0, 6, 'unknown'),
(179, 'Pizza Margherita', 'd', 'https://fr.openfoodfacts.org/produit/3270160833900/pizza-margherita-picard', 0, 12, 'Pizza pies and quiche'),
(180, 'Flammekueche Tradition Bio', 'c', 'https://fr.openfoodfacts.org/produit/3464012000408/flammekueche-tradition-bio-friedrich', 0, 12, 'Pizza pies and quiche'),
(181, 'Pizza 3 fromages', 'd', 'https://fr.openfoodfacts.org/produit/3350031937736/pizza-3-fromages-monoprix-bio', 0, 12, 'Pizza pies and quiche'),
(182, '2 Quiches Lorraines', 'd', 'https://fr.openfoodfacts.org/produit/3270160801381/2-quiches-lorraines-picard', 0, 12, 'Pizza pies and quiche'),
(183, 'Pizza Regina', 'c', 'https://fr.openfoodfacts.org/produit/3596710433490/pizza-regina-auchan', 0, 6, 'unknown'),
(184, 'Pizza kebab Les cuites sur pierre', 'd', 'https://fr.openfoodfacts.org/produit/3596710441976/pizza-kebab-les-cuites-sur-pierre-auchan', 0, 12, 'Pizza pies and quiche'),
(185, 'Tarte tomate et fromage de chèvre', 'c', 'https://fr.openfoodfacts.org/produit/3564700528433/tarte-tomate-et-fromage-de-chevre-cote-table', 0, 6, 'unknown'),
(186, 'Ristorante Pizza Speciale', 'd', 'https://fr.openfoodfacts.org/produit/4001724819509/ristorante-pizza-speciale-dr-oetker', 0, 7, 'One-dish meals'),
(187, 'Pizza Tradizionale - Diavola Calabrese', 'd', 'https://fr.openfoodfacts.org/produit/4001724019954/pizza-tradizionale-diavola-calabrese-dr-oetker', 0, 6, 'unknown'),
(188, 'Pizza Legumes pesto parmesan', 'c', 'https://fr.openfoodfacts.org/produit/3270160890170/pizza-legumes-pesto-parmesan-picard', 0, 6, 'unknown'),
(189, 'Pizza 4 Saisons', 'b', 'https://fr.openfoodfacts.org/produit/3270160717668/pizza-4-saisons-picard', 0, 6, 'unknown'),
(190, 'Delizza Royale', 'a', 'https://fr.openfoodfacts.org/produit/4001724017578/delizza-royale-dr-oetker', 0, 6, 'unknown'),
(191, 'Pizza 4 stagioni', 'b', 'https://fr.openfoodfacts.org/produit/3560070123971/pizza-4-stagioni-carrefour', 0, 12, 'Pizza pies and quiche'),
(192, 'Tarte Saumon Oseille', 'c', 'https://fr.openfoodfacts.org/produit/3258561412030/tarte-saumon-oseille-belle-france', 0, 12, 'Pizza pies and quiche'),
(193, 'Tarte Chèvre Tomate', 'c', 'https://fr.openfoodfacts.org/produit/3258561412207/tarte-chevre-tomate-belle-france', 0, 12, 'Pizza pies and quiche'),
(194, 'Pizza Fiesta Regina', 'd', 'https://fr.openfoodfacts.org/produit/7613034642271/pizza-fiesta-regina-buitoni', 0, 6, 'unknown'),
(195, 'Pizza cuite sur pierre - 4 Formaggi', 'c', 'https://fr.openfoodfacts.org/produit/3560070124817/pizza-cuite-sur-pierre-4-formaggi-carrefour', 0, 12, 'Pizza pies and quiche'),
(196, 'Pizza 4 Fromages', 'd', 'https://fr.openfoodfacts.org/produit/20711719/pizza-4-fromages-alfredo', 0, 6, 'unknown'),
(197, 'Pizza bolognaise', 'c', 'https://fr.openfoodfacts.org/produit/3273640001189/pizza-bolognaise-la-pizza-du-moulin', 0, 12, 'Pizza pies and quiche'),
(198, 'Piccolinis Formaggio generoso - 3 Fromages', 'd', 'https://fr.openfoodfacts.org/produit/7613035090583/piccolinis-formaggio-generoso-3-fromages-buitoni', 0, 6, 'unknown'),
(199, '2 Mini Calzones Tomate Mozzarella', 'b', 'https://fr.openfoodfacts.org/produit/3270160890897/2-mini-calzones-tomate-mozzarella-picard', 0, 6, 'unknown'),
(200, 'Pizza Royale cuite au feu de bois', 'b', 'https://fr.openfoodfacts.org/produit/3560070134564/pizza-royale-cuite-au-feu-de-bois-carrefour', 0, 6, 'unknown'),
(201, 'Fraîch\'Up 4 Fromages', 'c', 'https://fr.openfoodfacts.org/produit/7613034223852/fraich-up-4-fromages-buitoni', 0, 6, 'unknown'),
(202, 'Pizza au chèvre', 'c', 'https://fr.openfoodfacts.org/produit/3258561412122/pizza-au-chevre-belle-france', 0, 12, 'Pizza pies and quiche'),
(203, 'Pizza Ristorante Quattro Formaggi', 'd', 'https://fr.openfoodfacts.org/produit/4001724818908/pizza-ristorante-quattro-formaggi-dr-oetker', 0, 12, 'Pizza pies and quiche'),
(204, 'Pizza cuite au feu de bois Royale', 'c', 'https://fr.openfoodfacts.org/produit/3245390192417/pizza-cuite-au-feu-de-bois-royale-grand-jury', 0, 12, 'Pizza pies and quiche'),
(205, 'Fraich\'Up Little Italy Veggie Style', 'b', 'https://fr.openfoodfacts.org/produit/7613035768185/fraich-up-little-italy-veggie-style-buitoni', 0, 6, 'unknown'),
(206, 'Pizza Coppa Légumes Burrata', 'c', 'https://fr.openfoodfacts.org/produit/3270160890187/pizza-coppa-legumes-burrata-picard', 0, 6, 'unknown'),
(207, 'Pizza surgelée Jambon Speck Roquette Mozzarella', 'b', 'https://fr.openfoodfacts.org/produit/3270160717323/pizza-surgelee-jambon-speck-roquette-mozzarella-picard', 0, 12, 'Pizza pies and quiche'),
(208, 'Pizza aux 4 fromages', 'd', 'https://fr.openfoodfacts.org/produit/3270160830275/pizza-aux-4-fromages-picard', 0, 12, 'Pizza pies and quiche'),
(209, 'Pizza feu de bois Royale', 'c', 'https://fr.openfoodfacts.org/produit/3257982052702/pizza-feu-de-bois-royale-cora', 0, 12, 'Pizza pies and quiche'),
(210, 'Pizza Fiesta Poulet BBQ', 'd', 'https://fr.openfoodfacts.org/produit/7613036218153/pizza-fiesta-poulet-bbq-buitoni', 0, 12, 'Pizza pies and quiche'),
(211, 'Tarte saumon épinards', 'b', 'https://fr.openfoodfacts.org/produit/3245412413889/tarte-saumon-epinards-carrefour', 0, 12, 'Pizza pies and quiche'),
(212, 'Pizza chèvre-miel mozzarella emmental', 'd', 'https://fr.openfoodfacts.org/produit/3424600000265/pizza-chevre-miel-mozzarella-emmental-manosque', 0, 12, 'Pizza pies and quiche'),
(213, 'Fraîch\'Up Little Italy Italian Burger', 'c', 'https://fr.openfoodfacts.org/produit/7613035768154/fraich-up-little-italy-italian-burger-buitoni', 0, 12, 'Pizza pies and quiche'),
(214, 'Pizza fromages cuite sur pierre', 'c', 'https://fr.openfoodfacts.org/produit/3263859811419/pizza-fromages-cuite-sur-pierre-leader-price', 0, 12, 'Pizza pies and quiche'),
(215, 'Crousti moelleuse extrême l\'américaine sauce burger', 'b', 'https://fr.openfoodfacts.org/produit/3248830724254/crousti-moelleuse-extreme-l-americaine-sauce-burger-marie', 0, 12, 'Pizza pies and quiche'),
(216, 'Pizza royale', 'c', 'https://fr.openfoodfacts.org/produit/3245390132284/pizza-royale-grand-jury', 0, 12, 'Pizza pies and quiche'),
(217, 'Bœuf Fromage', 'c', 'https://fr.openfoodfacts.org/produit/3256225425105/boeuf-fromage-u', 0, 6, 'unknown'),
(218, 'Pizza Regina Jambon, champignon, fromage', 'b', 'https://fr.openfoodfacts.org/produit/3270160374618/pizza-regina-jambon-champignon-fromage-picard', 0, 6, 'unknown'),
(219, 'Ristorante Pizza Mozzarella', 'd', 'https://fr.openfoodfacts.org/produit/4001724819806/ristorante-pizza-mozzarella', 0, 6, 'unknown'),
(220, 'Pizza Calabrese cuite au feu de bois', 'c', 'https://fr.openfoodfacts.org/produit/3245390117304/pizza-calabrese-cuite-au-feu-de-bois-grand-jury', 0, 6, 'unknown'),
(221, 'Maxi Moelleuse Royale', 'c', 'https://fr.openfoodfacts.org/produit/32503920882200/maxi-moelleuse-royale-netto', 0, 12, 'Pizza pies and quiche'),
(222, 'Quiche Lorraine', 'd', 'https://fr.openfoodfacts.org/produit/3256224160007/quiche-lorraine-u', 0, 12, 'Pizza pies and quiche'),
(223, 'Pizza familiale royale', 'c', 'https://fr.openfoodfacts.org/produit/3256224755623/pizza-familiale-royale-u', 0, 6, 'unknown'),
(224, 'Pizza Moelleuse Royale Fromage - Jambon- Champignon. Surgelée', 'c', 'https://fr.openfoodfacts.org/produit/3256224755609/pizza-moelleuse-royale-fromage-jambon-champignon-surgelee-u', 0, 12, 'Pizza pies and quiche'),
(225, 'Pizza Moelleuse 3 fromages - Mozzarella - Edam - Emmental. Surgelée', 'd', 'https://fr.openfoodfacts.org/produit/3256224755616/pizza-moelleuse-3-fromages-mozzarella-edam-emmental-surgelee-u', 0, 6, 'unknown'),
(226, 'Pizza 4 fromaggi', 'd', 'https://fr.openfoodfacts.org/produit/3368958946755/pizza-4-fromaggi-u-saveurs', 0, 6, 'unknown'),
(227, 'Pizza Chorizo', 'c', 'https://fr.openfoodfacts.org/produit/3256221116014/pizza-chorizo-u', 0, 12, 'Pizza pies and quiche'),
(228, 'Tarte à la savoyarde', 'd', 'https://fr.openfoodfacts.org/produit/3256225094561/tarte-a-la-savoyarde-u', 0, 12, 'Pizza pies and quiche'),
(229, 'Pizza savoyarde', 'c', 'https://fr.openfoodfacts.org/produit/3256225425099/pizza-savoyarde-u', 0, 12, 'Pizza pies and quiche'),
(230, 'Pizza à base de sauce aux champignons et à la truffe blanche d\'été 1,08% et arome truffe', 'c', 'https://fr.openfoodfacts.org/produit/3368954148788/pizza-a-base-de-sauce-aux-champignons-et-a-la-truffe-blanche-d-ete-1-08-et-arome-truffe-u-saveurs', 0, 6, 'unknown');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;
--
-- AUTO_INCREMENT pour la table `Temp`
--
ALTER TABLE `Temp`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
