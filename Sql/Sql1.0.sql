-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mer. 10 jan. 2018 à 13:03
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `Monument`
--

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

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Monument`
--
ALTER TABLE `Monument`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `monument_ibfk_1` (`Id_City`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Monument`
--
ALTER TABLE `Monument`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
