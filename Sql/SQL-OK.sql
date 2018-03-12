
CREATE TABLE `Afficher` (
  `Id_Monument` int(11) NOT NULL DEFAULT '0',
  `Id_User` int(11) NOT NULL DEFAULT '0',
  `Id_Comments` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Afficher`
--

INSERT INTO `Afficher` (`Id_Monument`, `Id_User`, `Id_Comments`) VALUES
(128, 1, 1),
(125, 1, 2),
(126, 1, 2),
(126, 3, 2),
(127, 1, 2),
(128, 1, 2),
(126, 1, 3),
(127, 1, 4);

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
(125, 1),
(126, 1),
(128, 27),
(127, 29);

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
(0, '', 0),
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

--
-- Déchargement des données de la table `Comments`
--

INSERT INTO `Comments` (`Id`, `Comments`, `Rating`) VALUES
(1, 'I have seen it on the morning on my mobile', 5.0),
(2, 'Top', 5.0),
(3, 'Top', 5.0),
(4, 'Top', 5.0);

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
(1, 'Tour+Eiffel+1.jpg', 125),
(2, 'Tour+Eiffel+2.jpg', 125),
(3, 'Tour+Eiffel+3.jpg', 125),
(4, 'Tour+Eiffel+4.jpg', 125),
(5, 'Tour+Eiffel+5.jpg', 125),
(6, 'Arc+de+Triomphe+1.jpg', 126),
(7, 'Arc+de+Triomphe+2.jpg', 126),
(8, 'Arc+de+Triomphe+3.jpg', 126),
(9, 'Arc+de+Triomphe+4.jpg', 126),
(10, 'Arc+de+Triomphe+5.jpg', 126),
(11, 'Cathédrale+Notre-Dame+de+Paris+1.jpg', 127),
(12, 'Cathédrale+Notre-Dame+de+Paris+2.jpg', 127),
(13, 'Cathédrale+Notre-Dame+de+Paris+3.jpg', 127),
(14, 'Cathédrale+Notre-Dame+de+Paris+4.jpg', 127),
(15, 'Cathédrale+Notre-Dame+de+Paris+5.jpg', 127),
(16, 'Hôtel+Ritz+Paris+1.jpg', 128),
(17, 'Hôtel+Ritz+Paris+2.jpg', 128),
(18, 'Hôtel+Ritz+Paris+3.jpg', 128),
(19, 'Hôtel+Ritz+Paris+4.jpg', 128),
(20, 'Hôtel+Ritz+Paris+5.jpg', 128);

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
(125, 'Tour Eiffel', 48.85836410522461000000, 2.29448795318603500000, 8),
(126, 'Arc de Triomphe', 48.87379074096680000000, 2.29502749443054200000, 8),
(127, 'Cathédrale Notre-Dame de Paris', 48.85296630859375000000, 2.34990215301513670000, 5),
(128, 'Hôtel Ritz Paris', 48.86809921264648400000, 2.32889318466186520000, 2);

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
(1, 125, 1, '0930', '', '', '2300'),
(2, 125, 2, '0930', '', '', '2300'),
(3, 125, 3, '0930', '', '', '2300'),
(4, 125, 4, '0930', '', '', '2300'),
(5, 125, 5, '0930', '', '', '2300'),
(6, 125, 6, '0930', '', '', '2300'),
(7, 125, 7, '0930', '', '', '2300'),
(8, 126, 1, '1000', '', '', '2300'),
(9, 126, 2, '1000', '', '', '2300'),
(10, 126, 3, '1000', '', '', '2300'),
(11, 126, 4, '1000', '', '', '2300'),
(12, 126, 5, '1000', '', '', '2300'),
(13, 126, 6, '1000', '', '', '2300'),
(14, 126, 7, '1000', '', '', '2300'),
(16, 127, 1, '0000', '', '', '0000'),
(17, 127, 2, '0000', '', '', '0000'),
(18, 127, 3, '0000', '', '', '0000'),
(19, 127, 4, '0000', '', '', '0000'),
(20, 127, 5, '0000', '', '', '0000'),
(21, 127, 6, '0000', '', '', '0000'),
(23, 128, 1, '0000', '', '', '0000'),
(24, 128, 2, '0000', '', '', '0000'),
(25, 128, 3, '0000', '', '', '0000'),
(26, 128, 4, '0000', '', '', '0000'),
(27, 128, 5, '0000', '', '', '0000'),
(28, 128, 6, '0000', '', '', '0000');

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
(0, ' '),
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
(2, 'TEBOUL', 'BENJAMIN', '9f91553771969acb04e802b6a9f19264', NULL, 'benj.teboul@gmail.com'),
(3, 'Teboul', 'Ben', 'bb711343436ce8ccf590e0695e87f9c4', NULL, 'B.enj.teboul@gmail.com'),
(4, 'Teb', 'Ben', '2793fe669348cb4733942f6ae79c58a6', NULL, 'Benj.teb.oul@gmail.com');

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
-- AUTO_INCREMENT pour la table `Image`
--
ALTER TABLE `Image`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `Monument`
--
ALTER TABLE `Monument`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT pour la table `Ouvrir`
--
ALTER TABLE `Ouvrir`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `Type`
--
ALTER TABLE `Type`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
