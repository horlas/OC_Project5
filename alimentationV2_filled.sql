-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 29 Mai 2018 à 10:21
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

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(21, 'Cheese'),
(1, 'Dried fruits'),
(23, 'Fats'),
(35, 'Legumes'),
(20, 'One-dish meals'),
(48, 'Potatoes'),
(60, 'Sweetened beverages'),
(19, 'Sweets');

-- --------------------------------------------------------

--
-- Structure de la table `Product`
--

CREATE TABLE `Product` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `nutriscore` char(1) DEFAULT NULL,
  `category_name` varchar(70) DEFAULT NULL,
  `url` text NOT NULL,
  `substitut_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Product`
--

INSERT INTO `Product` (`id`, `name`, `nutriscore`, `category_name`, `url`, `substitut_id`) VALUES
(1, 'Dattes fraiches', '', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/6287004640485/dattes-fraiches-sukkary', 0),
(2, 'Mélange Tonus', 'a', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3700146205679/melange-tonus-la-maison-des-bistrots', 0),
(3, 'Melons secs', 'd', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/26022765/melons-secs-trader-joe-s', 0),
(4, 'Abricots moelleux', 'a', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3502490001545/abricots-moelleux-maitre-prunille', 0),
(5, 'Sun croquandises', 'c', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3068239251577/sun-croquandises', 0),
(6, 'Formule détente', 'c', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3270720090095/formule-detente-daco-bello', 0),
(7, 'Abricots secs', 'a', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3222473130887/abricots-secs-casino', 0),
(8, 'Pruneaux d\'Agen', 'b', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3564700670903/pruneaux-d-agen-couleurs-vives', 0),
(10, 'Raisins secs Sultanine', 'c', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3560070705801/raisins-secs-sultanine-carrefour-bio', 0),
(11, 'Mendiants Sans Raisins', 'b', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/5400112322079/mendiants-sans-raisins-delhaize', 0),
(12, 'Raisins Secs Bio', 'c', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3596710341023/raisins-secs-bio-auchan-bio', 0),
(13, 'Dattes', 'c', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3770002197035/dattes-sed-oasis', 0),
(14, 'Daco bello mix cocktail', 'b', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3270726141234/daco-bello-mix-cocktail', 0),
(15, 'Abricots secs entiers de turquie', 'a', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3325350263507/abricots-secs-entiers-de-turquie-holu-fruits', 0),
(16, 'Mélange de graines sans sel', 'c', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3502490116744/melange-de-graines-sans-sel-maitre-prunille', 0),
(17, 'Baies de goji', 'c', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3770001023939/baies-de-goji-nature', 0),
(18, 'Les Moelleux - Abricots', 'a', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3180840008842/les-moelleux-abricots-maitre-prunille', 0),
(19, 'Encas Noix de cajou & raisins les 5 sachets de 35 g', 'c', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3068230015000/encas-noix-de-cajou-raisins-les-5-sachets-de-35-g-sun', 0),
(20, 'Cranberries Déshydratées', 'c', 'Dried fruits', 'https://fr.openfoodfacts.org/produit/3760036358069/cranberries-deshydratees', 0),
(21, 'Confiture de fraises', 'b', 'Sweets', 'https://fr.openfoodfacts.org/produit/27004746/confiture-de-fraises-tamara', 0),
(22, 'Beure extra-fin doux 125g', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3256224252139/beure-extra-fin-doux-125g-u', 0),
(23, 'Le Farci Poitevin à DD', 'c', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3760276025073/le-farci-poitevin-a-dd-dd-du-pwatoo', 0),
(24, 'Homard Bleu à l\'Armoricaine', 'd', 'unknown', 'https://fr.openfoodfacts.org/produit/3770000648881/homard-bleu-a-l-armoricaine-la-paimpolaise', 0),
(25, 'Philadelphia light', 'd', 'Cheese', 'https://fr.openfoodfacts.org/produit/5410068563358/philadelphia-light', 0),
(26, 'Chocolat noisettes', 'e', 'Sweets', 'https://fr.openfoodfacts.org/produit/3760020500658/chocolat-noisettes-jardin-bio', 0),
(27, 'Confiture Myrtilles Sauvages', 'd', 'Sweets', 'https://fr.openfoodfacts.org/produit/3045320001587/confiture-myrtilles-sauvages-bonne-maman', 0),
(28, 'Margarine Sel de mer sans huile de palme', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3366321054212/margarine-sel-de-mer-sans-huile-de-palme-st-hubert', 0),
(29, 'Confiture de framboises extra', 'c', 'Sweets', 'https://fr.openfoodfacts.org/produit/20151669/confiture-de-framboises-extra-tante-klara', 0),
(30, 'Confiture Framboise', 'd', 'Sweets', 'https://fr.openfoodfacts.org/produit/20000691/confiture-framboise-maribel', 0),
(31, 'Confiture extea de quetsches de lorraine', 'd', 'Sweets', 'https://fr.openfoodfacts.org/produit/3760043720859/confiture-extea-de-quetsches-de-lorraine-douceur-de-pays', 0),
(32, 'Confiture extra de myrtille', 'c', 'Sweets', 'https://fr.openfoodfacts.org/produit/3760043720781/confiture-extra-de-myrtille-douceur-de-pays', 0),
(33, 'Miel de mandarinier', 'c', 'Sweets', 'https://fr.openfoodfacts.org/produit/3540860048257/miel-de-mandarinier-l-abeille-royale', 0),
(34, 'Confruipure orange', 'c', 'Sweets', 'https://fr.openfoodfacts.org/produit/3760260250238/confruipure-orange-les-raffineurs-de-fruits', 0),
(35, 'Confiture de Fraise', 'c', 'Sweets', 'https://fr.openfoodfacts.org/produit/3760260250207/confiture-de-fraise-les-raffineurs-de-fruits', 0),
(36, 'Confiture', 'c', 'Sweets', 'https://fr.openfoodfacts.org/produit/3760260250443/confiture-les-raffineurs-de-fruits', 0),
(37, 'Confiture extra d\'abricots', 'd', 'Sweets', 'https://fr.openfoodfacts.org/produit/8480017333032/confiture-extra-d-abricots', 0),
(38, 'Caramel Beurre salé tartines et desserts', 'e', 'Sweets', 'https://fr.openfoodfacts.org/produit/3043934243911/caramel-beurre-sale-tartines-et-desserts-regilait', 0),
(39, 'Gelée de Groseille', 'e', 'Sweets', 'https://fr.openfoodfacts.org/produit/3505510000214/gelee-de-groseille', 0),
(40, 'Confiture allégée de myrtille', 'c', 'Sweets', 'https://fr.openfoodfacts.org/produit/3234750039073/confiture-allegee-de-myrtille-albert-menes', 0),
(54, 'Peanut butter crunchy', 'e', 'Legumes', 'https://fr.openfoodfacts.org/produit/3351700067112/peanut-butter-crunchy-duerr-s', 0),
(56, 'Douceur d\'Agrumes', 'd', 'Sweets', 'https://fr.openfoodfacts.org/produit/3324498000241/douceur-d-agrumes-les-comtes-de-provence', 0),
(57, 'Confiture extra baies d\'argousier', 'd', 'Sweets', 'https://fr.openfoodfacts.org/produit/3338044200467/confiture-extra-baies-d-argousier-j-m-chatelain', 0),
(58, 'Confiture argousier bio', 'c', 'Sweets', 'https://fr.openfoodfacts.org/produit/3701109400308/confiture-argousier-bio-les-delices-orsatus', 0),
(59, 'Confiture argousier', 'd', 'Sweets', 'https://fr.openfoodfacts.org/produit/3760099601157/confiture-argousier-flore-alpes', 0),
(60, 'Confiture extra à la cassonade cerise noire', 'd', 'Sweets', 'https://fr.openfoodfacts.org/produit/3760058112588/confiture-extra-a-la-cassonade-cerise-noire', 0),
(61, 'Légumes Mijotés Provençale & Haricots Rouges', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3175681161160/legumes-mijotes-provencale-haricots-rouges-cereal-bio', 0),
(62, 'Lentilles et poids chiches cuisinés', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3760020509026/lentilles-et-poids-chiches-cuisines-jardin-bio', 0),
(63, 'Lasagnes de legumes', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3250391967919/lasagnes-de-legumes-claude-leger', 0),
(64, 'Tomates Farcies et leur riz cuisiné', 'c', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3596710304653/tomates-farcies-et-leur-riz-cuisine-auchan', 0),
(65, 'Purée de pois cassés', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3256221667837/puree-de-pois-casses-u', 0),
(66, 'Lentilles cuisinées', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3256221667820/lentilles-cuisinees-u', 0),
(67, 'Tomates farcies Boulgour cuisiné aux petits légumes', 'b', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3248830690214/tomates-farcies-boulgour-cuisine-aux-petits-legumes-weight-watchers', 0),
(68, 'L\'Écrasé de pommes de terre aux 2 carottes', 'c', 'Potatoes', 'https://fr.openfoodfacts.org/produit/3422440006638/l-ecrase-de-pommes-de-terre-aux-2-carottes-crealine', 0),
(70, 'Galettes aux légumes confits', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3585510017214/galettes-aux-legumes-confits-les-ensoleil-ades', 0),
(71, 'Gratin facon tomates farcies', 'c', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3700569001070/gratin-facon-tomates-farcies-dietbon', 0),
(72, 'Steaks Poivrons Tomates', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3585510017207/steaks-poivrons-tomates-les-ensoleil-ades', 0),
(73, 'Aubergines cuisinées à la tomate', 'b', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3335880004808/aubergines-cuisinees-a-la-tomate-prosain', 0),
(74, '2 Tomates Farcies et riz 3 couleurs', 'c', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3250391287406/2-tomates-farcies-et-riz-3-couleurs-monique-ranou', 0),
(75, 'Purée de Légumes Verts', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3222473268993/puree-de-legumes-verts-casino', 0),
(76, 'Mashed Carrot & Parsnip', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/25316605/mashed-carrot-parsnip-tasty', 0),
(77, 'La Purée Légumes Oubliés', 'b', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3422440006737/la-puree-legumes-oublies-crealine', 0),
(78, 'Purée Gourmande - Lentille Corail Carotte', 'a', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3760020503482/puree-gourmande-lentille-corail-carotte-jardin-bio', 0),
(79, 'Purée Gourmande Haricots Verts', 'b', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3760020508074/puree-gourmande-haricots-verts-jardin-bio', 0),
(80, 'Tomates farcies', 'e', 'One-dish meals', 'https://fr.openfoodfacts.org/produit/3564700879351/tomates-farcies-cote-table', 0),
(81, '', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/54491014/coca-cola', 0),
(82, 'Boisson gazeuse goût Fraise', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/3502110002884/boisson-gazeuse-gout-fraise-mirinda', 0),
(83, 'Coca Cola Original taste', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/5449000025173/coca-cola-original-taste', 0),
(84, 'Mountain Dew', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/4060800180681/mountain-dew', 0),
(85, 'Orangina', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/3124480184320/orangina', 0),
(86, 'San Pellegrino limonata', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/8002270356520/san-pellegrino-limonata', 0),
(87, 'Pepsi', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/3502110008329/pepsi', 0),
(88, 'Coca-cola', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/5000112631029/coca-cola', 0),
(89, 'Fanta citron frappé', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/5449000006004/fanta-citron-frappe', 0),
(90, 'Soda goût orange', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/3700640600024/soda-gout-orange-el-marjane', 0),
(91, 'Fanta orange', 'd', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/5000112631722/fanta-orange', 0),
(93, 'Soda Gout Citron', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/3700640600031/soda-gout-citron-el-marjorane', 0),
(94, 'Agrum\'', 'd', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/3124480002501/agrum-schweppes', 0),
(95, 'Cola Casino 1 x 1, 5L', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/3222471090022/cola-casino-1-x-1-5l', 0),
(96, 'Original taste', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/5000112609653/original-taste-coca-cola', 0),
(97, 'Limonade carrefour', 'b', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/3245411441920/limonade-carrefour', 0),
(98, 'Schweppes Agrum', 'd', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/5410221305085/schweppes-agrum', 0),
(99, 'Coca Cola', 'e', 'Sweetened beverages', 'https://fr.openfoodfacts.org/produit/5449000008046/coca-cola', 0),
(321, 'Beurre gastronomique demi-sel', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3155250367049/beurre-gastronomique-demi-sel-president', 0),
(322, 'Beurre de baratte doux', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3760121212597/beurre-de-baratte-doux-biocoop', 0),
(323, 'Beurre tendre', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/20669386/beurre-tendre-envia', 0),
(324, 'Le Beurre Moulé Doux (82 % MG)', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3412290015980/le-beurre-moule-doux-82-mg-paysan-breton', 0),
(325, 'Beurre extra fin', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3258561420752/beurre-extra-fin-belle-france', 0),
(327, 'Beurre doux gastronomique', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3155251205500/beurre-doux-gastronomique-president', 0),
(328, 'Le beurre tendre', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3451790988813/le-beurre-tendre-elle-vire', 0),
(330, 'Beurre doux fin et naturel', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3278310005207/beurre-doux-fin-et-naturel-alain-ledanec', 0),
(331, 'Beurre tendre demi-sel', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3155250366974/beurre-tendre-demi-sel-president', 0),
(332, 'Beurre', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3250390010647/beurre-paturages', 0),
(333, 'Beurre demi-sel', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3114270600116/beurre-demi-sel-le-marin', 0),
(334, 'La Motte Gastronomique Demi-Sel', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3155250367094/la-motte-gastronomique-demi-sel-president', 0),
(335, 'Beurre Tendre Demi-Sel (80% MG)', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3228022000250/beurre-tendre-demi-sel-80-mg-president', 0),
(336, 'Beurre d\'Isigny AOP de Baratte Doux', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3245390221698/beurre-d-isigny-aop-de-baratte-doux-reflets-de-france', 0),
(337, 'Beurre A.O.P Charentes-Poitou Doux', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3258231068000/beurre-a-o-p-charentes-poitou-doux-surgeres', 0),
(338, 'Beurre Demi-Sel (80 % MG)', 'e', 'Fats', 'https://fr.openfoodfacts.org/produit/3564707001175/beurre-demi-sel-80-mg-bio-village', 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT pour la table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
