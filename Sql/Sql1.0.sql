-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mer. 10 jan. 2018 à 13:19
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `Monument`
--

-- --------------------------------------------------------

--
-- Structure de la table `Afficher`
--

CREATE TABLE `Afficher` (
  `Id_Monument` int(11) NOT NULL DEFAULT '0',
  `Id_User` int(11) NOT NULL DEFAULT '0',
  `Id_Comments` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Afficher`
--

INSERT INTO `Afficher` (`Id_Monument`, `Id_User`, `Id_Comments`) VALUES
(99, 1, 0),
(100, 1, 0),
(102, 1, 0),
(104, 1, 0),
(106, 1, 0),
(107, 1, 0),
(109, 1, 0),
(113, 1, 0),
(114, 1, 0),
(99, 1, 21),
(100, 1, 28),
(102, 1, 42),
(104, 1, 55),
(106, 1, 69),
(107, 1, 76),
(109, 1, 90),
(113, 1, 118),
(114, 1, 125);

-- --------------------------------------------------------

--
-- Structure de la table `Avoir`
--

CREATE TABLE `Avoir` (
  `Id_Monument` int(11) NOT NULL DEFAULT '0',
  `Id_Type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Avoir`
--

INSERT INTO `Avoir` (`Id_Monument`, `Id_Type`) VALUES
(98, 1),
(99, 1),
(100, 1),
(106, 1),
(104, 23),
(107, 27),
(109, 27),
(102, 28),
(111, 29),
(114, 29),
(113, 30);

-- --------------------------------------------------------

--
-- Structure de la table `Calendar`
--

CREATE TABLE `Calendar` (
  `Id` int(11) NOT NULL,
  `Name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Calendar`
--

INSERT INTO `Calendar` (`Id`, `Name`) VALUES
(1, 'Dimanche'),
(2, 'Lundi'),
(3, 'Mardi'),
(4, 'Mercredi'),
(5, 'Jeudi'),
(6, 'Vendredi'),
(7, 'Samedi');

-- --------------------------------------------------------

--
-- Structure de la table `City`
--

CREATE TABLE `City` (
  `Id` int(11) NOT NULL,
  `Name` varchar(80) NOT NULL,
  `Cp` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `City`
--

INSERT INTO `City` (`Id`, `Name`, `Cp`) VALUES
(2, 'Paris 01', 75001),
(3, 'Paris 02', 75002),
(4, 'Paris 03', 75003),
(5, 'Paris 04', 75004),
(6, 'Paris 05', 75005),
(7, 'Paris 06', 75006),
(8, 'Paris 07', 75007),
(9, 'Paris 08', 75008),
(10, 'Paris 09', 75009),
(11, 'Paris 10', 75010),
(12, 'Paris 11', 75011),
(13, 'Paris 12', 75012),
(14, 'Paris 13', 75013),
(15, 'Paris 14', 75014),
(16, 'Paris 15', 75015),
(17, 'Paris 16', 75016),
(18, 'Paris 17', 75017),
(19, 'Paris 18', 75018),
(20, 'Paris 19', 75019),
(21, 'Paris 20', 75020),
(22, 'Saint-Denis', 93100);

-- --------------------------------------------------------

--
-- Structure de la table `Comments`
--

CREATE TABLE `Comments` (
  `Id` int(11) NOT NULL,
  `Comments` varchar(300) DEFAULT NULL,
  `Rating` float(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Image`
--

CREATE TABLE `Image` (
  `Id` int(11) NOT NULL,
  `Url` varchar(300) NOT NULL,
  `Id_Monument` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Image`
--

INSERT INTO `Image` (`Id`, `Url`, `Id_Monument`) VALUES
(1, 'Eiffel Tower_1.jpg', 99),
(2, 'Eiffel Tower_2.jpg', 99),
(3, 'Eiffel Tower_3.jpg', 99),
(4, 'Eiffel Tower_4.jpg', 99),
(5, 'Eiffel Tower_5.jpg', 99),
(6, 'Panthéon_1.jpg', 100),
(7, 'Panthéon_2.jpg', 100),
(8, 'Panthéon_3.jpg', 100),
(9, 'Panthéon_4.jpg', 100),
(10, 'Panthéon_5.jpg', 100),
(11, 'Stade de France_1.jpg', 102),
(12, 'Pont des Arts_1.jpg', 106),
(13, 'Pont des Arts_2.jpg', 106),
(14, 'Pont des Arts_3.jpg', 106),
(15, 'Pont des Arts_4.jpg', 106),
(16, 'Pont des Arts_5.jpg', 106),
(17, 'Hilton Paris Opera_1.jpg', 109),
(18, 'Hilton Paris Opera_2.jpg', 109),
(19, 'Hilton Paris Opera_3.jpg', 109),
(20, 'Hilton Paris Opera_4.jpg', 109),
(21, 'Hilton Paris Opera_5.jpg', 109),
(22, 'The Basilica of the Sacred Heart of Paris_1.jpg', 111),
(23, 'The Basilica of the Sacred Heart of Paris_2.jpg', 111),
(24, 'The Basilica of the Sacred Heart of Paris_3.jpg', 111),
(25, 'The Basilica of the Sacred Heart of Paris_4.jpg', 111),
(26, 'The Basilica of the Sacred Heart of Paris_5.jpg', 111),
(27, 'Palais des congrès de Paris_1.jpg', 113),
(28, 'Palais des congrès de Paris_2.jpg', 113),
(29, 'Palais des congrès de Paris_3.jpg', 113),
(30, 'Palais des congrès de Paris_4.jpg', 113),
(31, 'Palais des congrès de Paris_5.jpg', 113),
(32, 'Grande Mosquée de Paris_1.jpg', 114),
(33, 'Grande Mosquée de Paris_2.jpg', 114),
(34, 'Grande Mosquée de Paris_3.jpg', 114),
(35, 'Grande Mosquée de Paris_4.jpg', 114),
(36, 'Grande Mosquée de Paris_5.jpg', 114);

-- --------------------------------------------------------

--
-- Structure de la table `Monument`
--

CREATE TABLE `Monument` (
  `Id` int(11) NOT NULL,
  `Name` varchar(80) NOT NULL,
  `Lat` float(25,20) DEFAULT NULL,
  `Lon` float(25,20) DEFAULT NULL,
  `Id_City` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Monument`
--

INSERT INTO `Monument` (`Id`, `Name`, `Lat`, `Lon`, `Id_City`) VALUES
(98, 'L\'Arc de Triomphe de l\'Etoile', 48.87377929687500000000, 2.29501557350158700000, 9),
(99, 'Eiffel Tower', 48.85837173461914000000, 2.29448127746582030000, 8),
(100, 'Panthéon', 48.84622192382812500000, 2.34641385078430180000, 6),
(102, 'Stade de France', 48.92445755004883000000, 2.36016440391540530000, 22),
(104, 'Metiers Art Museum', 48.86663818359375000000, 2.35543823242187500000, 4),
(106, 'Pont des Arts', 48.85834121704101600000, 2.33750844001770000000, 7),
(107, 'InterContinental Paris - Le Grand', 48.87083435058594000000, 2.33042693138122560000, 10),
(109, 'Hilton Paris Opera', 48.87569046020508000000, 2.32552790641784670000, 9),
(111, 'The Basilica of the Sacred Heart of Paris', 48.88670730590820000000, 2.34302282333374020000, 19),
(113, 'Palais des congrès de Paris', 48.87945175170898400000, 2.28344559669494630000, 18),
(114, 'Grande Mosquée de Paris', 48.84184265136719000000, 2.35517191886901860000, 6);

-- --------------------------------------------------------

--
-- Structure de la table `Ouvrir`
--

CREATE TABLE `Ouvrir` (
  `Id` int(11) NOT NULL,
  `Id_Monument` int(11) NOT NULL DEFAULT '0',
  `Id_Calendar` int(11) NOT NULL DEFAULT '0',
  `Matin_Debut` varchar(50) DEFAULT NULL,
  `Matin_Fin` varchar(50) DEFAULT NULL,
  `Midi_Debut` varchar(50) DEFAULT NULL,
  `Midi_Fin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Ouvrir`
--

INSERT INTO `Ouvrir` (`Id`, `Id_Monument`, `Id_Calendar`, `Matin_Debut`, `Matin_Fin`, `Midi_Debut`, `Midi_Fin`) VALUES
(9, 98, 1, '0000', '', '', '0000'),
(10, 98, 2, '0000', '', '', '0000'),
(11, 98, 3, '0000', '', '', '0000'),
(12, 98, 4, '0000', '', '', '0000'),
(13, 98, 5, '0000', '', '', '0000'),
(14, 98, 6, '0000', '', '', '0000'),
(15, 99, 1, '0930', '', '', '2300'),
(16, 99, 2, '0930', '', '', '2300'),
(17, 99, 3, '0930', '', '', '2300'),
(18, 99, 4, '0930', '', '', '2300'),
(19, 99, 5, '0930', '', '', '2300'),
(20, 99, 6, '0930', '', '', '0000'),
(21, 99, 7, '0930', '', '', '0000'),
(22, 100, 1, '1000', '', '', '1830'),
(23, 100, 2, '1000', '', '', '1830'),
(24, 100, 3, '1000', '', '', '1830'),
(25, 100, 4, '1000', '', '', '1830'),
(26, 100, 5, '1000', '', '', '1830'),
(27, 100, 6, '1000', '', '', '1830'),
(28, 100, 7, '1000', '', '', '1830'),
(37, 102, 1, '0000', '', '', '0000'),
(38, 102, 2, '0000', '', '', '0000'),
(39, 102, 3, '0000', '', '', '0000'),
(40, 102, 4, '0000', '', '', '0000'),
(41, 102, 5, '0000', '', '', '0000'),
(42, 102, 6, '0000', '', '', '0000'),
(50, 104, 1, '1000', '', '', '1800'),
(51, 104, 2, '1000', '', '', '1800'),
(52, 104, 3, '1000', '', '', '1800'),
(53, 104, 4, '1000', '', '', '2130'),
(54, 104, 5, '1000', '', '', '1800'),
(55, 104, 6, '1000', '', '', '1800'),
(64, 106, 1, '0000', '', '', '0000'),
(65, 106, 2, '0000', '', '', '0000'),
(66, 106, 3, '0000', '', '', '0000'),
(67, 106, 4, '0000', '', '', '0000'),
(68, 106, 5, '0000', '', '', '0000'),
(69, 106, 6, '0000', '', '', '0000'),
(71, 107, 1, '0000', '', '', '0000'),
(72, 107, 2, '0000', '', '', '0000'),
(73, 107, 3, '0000', '', '', '0000'),
(74, 107, 4, '0000', '', '', '0000'),
(75, 107, 5, '0000', '', '', '0000'),
(76, 107, 6, '0000', '', '', '0000'),
(85, 109, 1, '0000', '', '', '0000'),
(86, 109, 2, '0000', '', '', '0000'),
(87, 109, 3, '0000', '', '', '0000'),
(88, 109, 4, '0000', '', '', '0000'),
(89, 109, 5, '0000', '', '', '0000'),
(90, 109, 6, '0000', '', '', '0000'),
(99, 111, 1, '0000', '', '', '0000'),
(100, 111, 2, '0000', '', '', '0000'),
(101, 111, 3, '0000', '', '', '0000'),
(102, 111, 4, '0000', '', '', '0000'),
(103, 111, 5, '0000', '', '', '0000'),
(104, 111, 6, '0000', '', '', '0000'),
(112, 113, 1, '0730', '', '', '2200'),
(113, 113, 2, '0730', '', '', '2200'),
(114, 113, 3, '0730', '', '', '2200'),
(115, 113, 4, '0730', '', '', '2200'),
(116, 113, 5, '0730', '', '', '2200'),
(117, 113, 6, '0730', '', '', '2200'),
(118, 113, 7, '0730', '', '', '2200'),
(120, 114, 1, '0000', '', '', '0000'),
(121, 114, 2, '0000', '', '', '0000'),
(122, 114, 3, '0000', '', '', '0000'),
(123, 114, 4, '0000', '', '', '0000'),
(124, 114, 5, '0000', '', '', '0000'),
(125, 114, 6, '0000', '', '', '0000');

-- --------------------------------------------------------

--
-- Structure de la table `Type`
--

CREATE TABLE `Type` (
  `Id` int(11) NOT NULL,
  `Name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Type`
--

INSERT INTO `Type` (`Id`, `Name`) VALUES
(1, 'Historical'),
(27, 'Hostel'),
(23, 'Museum'),
(29, 'Religion'),
(24, 'Restaurant'),
(30, 'Show'),
(28, 'Sports');

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `Id` int(11) NOT NULL,
  `Name` varchar(80) DEFAULT NULL,
  `Surname` varchar(80) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Token_Connect` varchar(300) DEFAULT NULL,
  `Mail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `User`
--

INSERT INTO `User` (`Id`, `Name`, `Surname`, `Password`, `Token_Connect`, `Mail`) VALUES
(1, 'User', 'Google', NULL, NULL, NULL),
(2, 'TEBOUL', 'BENJAMIN', '2793fe669348cb4733942f6ae79c58a6', NULL, 'benj.teboul@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Afficher`
--
ALTER TABLE `Afficher`
  ADD PRIMARY KEY (`Id_Monument`,`Id_User`,`Id_Comments`),
  ADD KEY `Id_Comments` (`Id_Comments`),
  ADD KEY `Id_User` (`Id_User`);

--
-- Index pour la table `Avoir`
--
ALTER TABLE `Avoir`
  ADD PRIMARY KEY (`Id_Monument`,`Id_Type`),
  ADD KEY `Id_Type` (`Id_Type`);

--
-- Index pour la table `Calendar`
--
ALTER TABLE `Calendar`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `City`
--
ALTER TABLE `City`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD UNIQUE KEY `Cp` (`Cp`);

--
-- Index pour la table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Monument` (`Id_Monument`);

--
-- Index pour la table `Monument`
--
ALTER TABLE `Monument`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `monument_ibfk_1` (`Id_City`);

--
-- Index pour la table `Ouvrir`
--
ALTER TABLE `Ouvrir`
  ADD PRIMARY KEY (`Id_Monument`,`Id_Calendar`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_Calendar` (`Id_Calendar`);

--
-- Index pour la table `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `City`
--
ALTER TABLE `City`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Image`
--
ALTER TABLE `Image`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `Monument`
--
ALTER TABLE `Monument`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT pour la table `Ouvrir`
--
ALTER TABLE `Ouvrir`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT pour la table `Type`
--
ALTER TABLE `Type`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Afficher`
--
ALTER TABLE `Afficher`
  ADD CONSTRAINT `afficher_ibfk_4` FOREIGN KEY (`Id_Monument`) REFERENCES `Monument` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `afficher_ibfk_5` FOREIGN KEY (`Id_User`) REFERENCES `User` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Avoir`
--
ALTER TABLE `Avoir`
  ADD CONSTRAINT `Id_Type` FOREIGN KEY (`Id_Type`) REFERENCES `Type` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `avoir_ibfk_3` FOREIGN KEY (`Id_Monument`) REFERENCES `Monument` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Image`
--
ALTER TABLE `Image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`Id_Monument`) REFERENCES `Monument` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Ouvrir`
--
ALTER TABLE `Ouvrir`
  ADD CONSTRAINT `ouvrir_ibfk_2` FOREIGN KEY (`Id_Calendar`) REFERENCES `Calendar` (`Id`),
  ADD CONSTRAINT `ouvrir_ibfk_3` FOREIGN KEY (`Id_Monument`) REFERENCES `Monument` (`Id`) ON DELETE CASCADE;
