-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  lun. 12 mars 2018 à 17:34
-- Version du serveur :  5.6.38
-- Version de PHP :  7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `monument`
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
  (129, 1, 0),
  (130, 1, 0),
  (131, 1, 0),
  (132, 1, 0),
  (133, 1, 0),
  (134, 1, 0),
  (135, 1, 0),
  (136, 1, 0),
  (137, 1, 0),
  (138, 1, 0),
  (140, 1, 0),
  (141, 1, 0),
  (142, 1, 0),
  (143, 1, 0),
  (144, 1, 0),
  (145, 1, 0),
  (146, 1, 0),
  (148, 1, 0),
  (149, 1, 0),
  (150, 1, 0),
  (151, 1, 0),
  (152, 1, 0),
  (153, 1, 0),
  (154, 1, 0),
  (128, 1, 1),
  (125, 1, 2),
  (126, 1, 2),
  (126, 3, 2),
  (127, 1, 2),
  (128, 1, 2),
  (126, 1, 3),
  (127, 1, 4),
  (130, 1, 39),
  (131, 1, 46),
  (132, 1, 53),
  (133, 1, 60),
  (134, 1, 67),
  (135, 1, 74),
  (136, 1, 81),
  (137, 1, 88),
  (138, 1, 95),
  (140, 1, 109),
  (141, 1, 116),
  (142, 1, 123),
  (143, 1, 130),
  (144, 1, 136),
  (145, 1, 143),
  (146, 1, 150),
  (148, 1, 171),
  (149, 1, 179),
  (150, 1, 185),
  (151, 1, 190),
  (152, 1, 197),
  (153, 1, 204),
  (154, 1, 211);

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
  (134, 1),
  (138, 1),
  (140, 1),
  (141, 1),
  (142, 1),
  (129, 23),
  (130, 23),
  (136, 23),
  (143, 24),
  (144, 24),
  (145, 24),
  (146, 24),
  (148, 24),
  (149, 24),
  (150, 24),
  (151, 24),
  (152, 24),
  (153, 24),
  (154, 24),
  (128, 27),
  (131, 28),
  (132, 28),
  (127, 29),
  (133, 29),
  (139, 29),
  (135, 30),
  (137, 30),
  (147, 30);

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
  (22, 'Saint-Denis', 93100),
  (23, 'Seine et Marne', 77);

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
  (0, 'Besides spending my Valentine\'s Day at the number 1 romantic location in the world! I really enjoyed the Japanese Culture House!\n\nFound a book I had been looking for in a long time at this unexpected location!\n\nThat\'s the way to finish a trip to Paris!\nCan\'t wait until I return!\nLet\'s plan another V', 5.0),
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
  (20, 'Hôtel+Ritz+Paris+5.jpg', 128),
  (21, 'Japanese+Culture+House+of+Paris+1.jpg', 129),
  (22, 'Japanese+Culture+House+of+Paris+2.jpg', 129),
  (23, 'Japanese+Culture+House+of+Paris+3.jpg', 129),
  (24, 'Japanese+Culture+House+of+Paris+4.jpg', 129),
  (25, 'Japanese+Culture+House+of+Paris+5.jpg', 129),
  (26, 'Louvre+Museum+1.jpg', 130),
  (27, 'Louvre+Museum+2.jpg', 130),
  (28, 'Louvre+Museum+3.jpg', 130),
  (29, 'Louvre+Museum+4.jpg', 130),
  (30, 'Louvre+Museum+5.jpg', 130),
  (31, 'Tuileries+Garden+1.jpg', 131),
  (32, 'Tuileries+Garden+2.jpg', 131),
  (33, 'Tuileries+Garden+3.jpg', 131),
  (34, 'Tuileries+Garden+4.jpg', 131),
  (35, 'Tuileries+Garden+5.jpg', 131),
  (36, 'Stade+de+France+1.jpg', 132),
  (37, 'Stade+de+France+2.jpg', 132),
  (38, 'Stade+de+France+3.jpg', 132),
  (39, 'Stade+de+France+4.jpg', 132),
  (40, 'Stade+de+France+5.jpg', 132),
  (41, 'Grande+Mosquée+de+Paris+1.jpg', 133),
  (42, 'Grande+Mosquée+de+Paris+2.jpg', 133),
  (43, 'Grande+Mosquée+de+Paris+3.jpg', 133),
  (44, 'Grande+Mosquée+de+Paris+4.jpg', 133),
  (45, 'Grande+Mosquée+de+Paris+5.jpg', 133),
  (46, 'Invalides+1.jpg', 134),
  (47, 'Grande_Mosquée_de_Paris_6.jpg', 133),
  (48, 'Grande+Mosquée+de+Paris+7.jpg', 133),
  (49, 'Disneyland+Paris+1.jpg', 135),
  (50, 'Disneyland+Paris+2.jpg', 135),
  (51, 'Disneyland+Paris+3.jpg', 135),
  (52, 'Disneyland+Paris+4.jpg', 135),
  (53, 'Disneyland+Paris+5.jpg', 135),
  (54, 'Musée+d+Orsay+1.jpg', 136),
  (55, 'Musée+d+Orsay+2.jpg', 136),
  (56, 'Musée+d+Orsay+3.jpg', 136),
  (57, 'Musée+d+Orsay+4.jpg', 136),
  (58, 'Musée+d+Orsay+5.jpg', 136),
  (59, 'Rhe+Yi+Tao+1.jpg', 137),
  (60, 'Rhe+Yi+Tao+2.jpg', 137),
  (61, 'Rhe+Yi+Tao+3.jpg', 137),
  (62, 'Rhe+Yi+Tao+4.jpg', 137),
  (63, 'Rhe+Yi+Tao+5.jpg', 137),
  (64, 'Place+de+la+Concorde+1.jpg', 138),
  (65, 'Place+de+la+Concorde+2.jpg', 138),
  (66, 'Place+de+la+Concorde+3.jpg', 138),
  (67, 'Place+de+la+Concorde+4.jpg', 138),
  (68, 'Place+de+la+Concorde+5.jpg', 138),
  (69, 'The+Basilica+of+the+Sacred+Heart+of+Paris+1.jpg', 139),
  (70, 'The+Basilica+of+the+Sacred+Heart+of+Paris+2.jpg', 139),
  (71, 'The+Basilica+of+the+Sacred+Heart+of+Paris+3.jpg', 139),
  (72, 'The+Basilica+of+the+Sacred+Heart+of+Paris+4.jpg', 139),
  (73, 'The+Basilica+of+the+Sacred+Heart+of+Paris+5.jpg', 139),
  (74, 'Pont+des+Arts+1.jpg', 140),
  (75, 'Pont+des+Arts+2.jpg', 140),
  (76, 'Pont+des+Arts+3.jpg', 140),
  (77, 'Pont+des+Arts+4.jpg', 140),
  (78, 'Pont+des+Arts+5.jpg', 140),
  (79, 'Pont+Alexandre+III+1.jpg', 141),
  (80, 'Pont+Alexandre+III+2.jpg', 141),
  (81, 'Pont+Alexandre+III+3.jpg', 141),
  (82, 'Pont+Alexandre+III+4.jpg', 141),
  (83, 'Pont+Alexandre+III+5.jpg', 141),
  (84, 'Restaurant+Fouquet+s+Paris+1.jpg', 143),
  (85, 'Restaurant+Fouquet+s+Paris+2.jpg', 143),
  (86, 'Restaurant+Fouquet+s+Paris+3.jpg', 143),
  (87, 'Restaurant+Fouquet+s+Paris+4.jpg', 143),
  (88, 'Restaurant+Fouquet+s+Paris+5.jpg', 143),
  (89, 'L+as+du+Fallafel+1.jpg', 144),
  (90, 'L+as+du+Fallafel+2.jpg', 144),
  (91, 'L+as+du+Fallafel+3.jpg', 144),
  (92, 'L+as+du+Fallafel+4.jpg', 144),
  (93, 'L+as+du+Fallafel+5.jpg', 144),
  (94, 'Maison+Rostang+1.jpg', 145),
  (95, 'Maison+Rostang+2.jpg', 145),
  (96, 'Maison+Rostang+3.jpg', 145),
  (97, 'Maison+Rostang+4.jpg', 145),
  (98, 'Maison+Rostang+5.jpg', 145),
  (99, 'Le+Cinq+1.jpg', 146),
  (100, 'Le+Cinq+2.jpg', 146),
  (101, 'Le+Cinq+3.jpg', 146),
  (102, 'Le+Cinq+4.jpg', 146),
  (103, 'Le+Cinq+5.jpg', 146),
  (104, 'Palais+Garnier+1.jpg', 147),
  (105, 'Palais+Garnier+2.jpg', 147),
  (106, 'Palais+Garnier+3.jpg', 147),
  (107, 'Palais+Garnier+4.jpg', 147),
  (108, 'Qui+plume+la+lune+1.jpg', 148),
  (109, 'Qui+plume+la+lune+2.jpg', 148),
  (110, 'Qui+plume+la+lune+3.jpg', 148),
  (111, 'Qui+plume+la+lune+4.jpg', 148),
  (112, 'Qui+plume+la+lune+5.jpg', 148),
  (113, 'Ice+Kube+Bar+1.jpg', 152),
  (114, 'Ice+Kube+Bar+2.jpg', 152),
  (115, 'Ice+Kube+Bar+3.jpg', 152),
  (116, 'Ice+Kube+Bar+4.jpg', 152),
  (117, 'Ice+Kube+Bar+5.jpg', 152),
  (118, 'Le+Cyrano+1.jpg', 153),
  (119, 'Le+Cyrano+2.jpg', 153),
  (120, 'Le+Cyrano+3.jpg', 153),
  (121, 'Le+Cyrano+4.jpg', 153),
  (122, 'Le+Cyrano+5.jpg', 153),
  (123, 'Le+Boucan+1.jpg', 154),
  (124, 'Le+Boucan+2.jpg', 154),
  (125, 'Le+Boucan+3.jpg', 154),
  (126, 'Le+Boucan+4.jpg', 154),
  (127, 'Le+Boucan+5.jpg', 154);

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
  (128, 'Hôtel Ritz Paris', 48.86809921264648400000, 2.32889318466186520000, 2),
  (129, 'Japanese Culture House of Paris', 48.85486984252930000000, 2.28970146179199200000, 16),
  (130, 'Louvre Museum', 48.86061096191406000000, 2.33764410018920900000, 2),
  (131, 'Tuileries Garden', 48.86349105834961000000, 2.32749438285827640000, 2),
  (132, 'Stade de France', 48.92445755004883000000, 2.36016440391540530000, 22),
  (133, 'Grande Mosquée de Paris', 48.84184265136719000000, 2.35517191886901860000, 6),
  (134, 'Invalides', 48.86203384399414000000, 2.31489253044128400000, 8),
  (135, 'Disneyland Paris', 48.87223434448242000000, 2.77580785751342770000, 23),
  (136, 'Musée d\'Orsay', 48.86095428466797000000, 2.32572197914123540000, 8),
  (137, 'Rhe Yi Tao', 48.84696960449219000000, 2.33715581893920900000, 6),
  (138, 'Place de la Concorde', 48.86563491821289000000, 2.32123565673828120000, 9),
  (139, 'The Basilica of the Sacred Heart of Paris', 48.88670730590820000000, 2.34302282333374020000, 19),
  (140, 'Pont des Arts', 48.85834121704101600000, 2.33750844001770000000, 7),
  (141, 'Pont Alexandre III', 48.86389923095703000000, 2.31355905532836900000, 9),
  (142, 'Ch.de Mars-Tour-Eiffel', 48.85621643066406000000, 2.28981852531433100000, 16),
  (143, 'Restaurant Fouquet\'s Paris', 48.87144851684570000000, 2.30118441581726070000, 9),
  (144, 'L\'as du Fallafel', 48.85737991333008000000, 2.35916256904602050000, 5),
  (145, 'Maison Rostang', 48.88142776489258000000, 2.29849648475646970000, 18),
  (146, 'Le Cinq', 48.86879730224609400000, 2.30022954940795900000, 9),
  (147, 'Palais Garnier', 48.87193298339844000000, 2.33176660537719730000, 10),
  (148, 'Qui plume la lune', 48.85903930664062500000, 2.36841678619384770000, 12),
  (149, 'ASPIC', 48.87919616699219000000, 2.34372591972351070000, 10),
  (150, 'L\'Alibi', 48.89204788208008000000, 2.34289026260375980000, 19),
  (151, 'L\'Absurde Imposture', 48.89097976684570000000, 2.34607577323913570000, 19),
  (152, 'Ice Kube Bar', 48.88652038574219000000, 2.35880994796752930000, 19),
  (153, 'Le Cyrano', 48.88379669189453000000, 2.32656860351562500000, 18),
  (154, 'Le Boucan', 48.88442993164062500000, 2.33108115196228030000, 19);

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
  (28, 128, 6, '0000', '', '', '0000'),
  (29, 129, 1, '1200', '', '', '2000'),
  (30, 129, 2, '1200', '', '', '2000'),
  (31, 129, 3, '1200', '', '', '2000'),
  (32, 129, 4, '1200', '', '', '2000'),
  (33, 129, 5, '1200', '', '', '2000'),
  (34, 130, 1, '0900', '', '', '1800'),
  (35, 130, 2, '0900', '', '', '1800'),
  (36, 130, 3, '0900', '', '', '2200'),
  (37, 130, 4, '0900', '', '', '1800'),
  (38, 130, 5, '0900', '', '', '2200'),
  (39, 130, 6, '0900', '', '', '1800'),
  (40, 131, 1, '0700', '', '', '2100'),
  (41, 131, 2, '0700', '', '', '2100'),
  (42, 131, 3, '0700', '', '', '2100'),
  (43, 131, 4, '0700', '', '', '2100'),
  (44, 131, 5, '0700', '', '', '2100'),
  (45, 131, 6, '0700', '', '', '2100'),
  (46, 131, 7, '0700', '', '', '2100'),
  (48, 132, 1, '0000', '', '', '0000'),
  (49, 132, 2, '0000', '', '', '0000'),
  (50, 132, 3, '0000', '', '', '0000'),
  (51, 132, 4, '0000', '', '', '0000'),
  (52, 132, 5, '0000', '', '', '0000'),
  (53, 132, 6, '0000', '', '', '0000'),
  (55, 133, 1, '0000', '', '', '0000'),
  (56, 133, 2, '0000', '', '', '0000'),
  (57, 133, 3, '0000', '', '', '0000'),
  (58, 133, 4, '0000', '', '', '0000'),
  (59, 133, 5, '0000', '', '', '0000'),
  (60, 133, 6, '0000', '', '', '0000'),
  (62, 134, 1, '0000', '', '', '0000'),
  (63, 134, 2, '0000', '', '', '0000'),
  (64, 134, 3, '0000', '', '', '0000'),
  (65, 134, 4, '0000', '', '', '0000'),
  (66, 134, 5, '0000', '', '', '0000'),
  (67, 134, 6, '0000', '', '', '0000'),
  (68, 135, 1, '1000', '', '', '2000'),
  (69, 135, 2, '1000', '', '', '2000'),
  (70, 135, 3, '1000', '', '', '2000'),
  (71, 135, 4, '1000', '', '', '2000'),
  (72, 135, 5, '1000', '', '', '2000'),
  (73, 135, 6, '1000', '', '', '2000'),
  (74, 135, 7, '1000', '', '', '2000'),
  (76, 136, 1, '0000', '', '', '0000'),
  (77, 136, 2, '0000', '', '', '0000'),
  (78, 136, 3, '0000', '', '', '0000'),
  (79, 136, 4, '0000', '', '', '0000'),
  (80, 136, 5, '0000', '', '', '0000'),
  (81, 136, 6, '0000', '', '', '0000'),
  (83, 137, 1, '0000', '', '', '0000'),
  (84, 137, 2, '0000', '', '', '0000'),
  (85, 137, 3, '0000', '', '', '0000'),
  (86, 137, 4, '0000', '', '', '0000'),
  (87, 137, 5, '0000', '', '', '0000'),
  (88, 137, 6, '0000', '', '', '0000'),
  (90, 138, 1, '0000', '', '', '0000'),
  (91, 138, 2, '0000', '', '', '0000'),
  (92, 138, 3, '0000', '', '', '0000'),
  (93, 138, 4, '0000', '', '', '0000'),
  (94, 138, 5, '0000', '', '', '0000'),
  (95, 138, 6, '0000', '', '', '0000'),
  (97, 139, 1, '0000', '', '', '0000'),
  (98, 139, 2, '0000', '', '', '0000'),
  (99, 139, 3, '0000', '', '', '0000'),
  (100, 139, 4, '0000', '', '', '0000'),
  (101, 139, 5, '0000', '', '', '0000'),
  (102, 139, 6, '0000', '', '', '0000'),
  (104, 140, 1, '0000', '', '', '0000'),
  (105, 140, 2, '0000', '', '', '0000'),
  (106, 140, 3, '0000', '', '', '0000'),
  (107, 140, 4, '0000', '', '', '0000'),
  (108, 140, 5, '0000', '', '', '0000'),
  (109, 140, 6, '0000', '', '', '0000'),
  (111, 141, 1, '0000', '', '', '0000'),
  (112, 141, 2, '0000', '', '', '0000'),
  (113, 141, 3, '0000', '', '', '0000'),
  (114, 141, 4, '0000', '', '', '0000'),
  (115, 141, 5, '0000', '', '', '0000'),
  (116, 141, 6, '0000', '', '', '0000'),
  (118, 142, 1, '0000', '', '', '0000'),
  (119, 142, 2, '0000', '', '', '0000'),
  (120, 142, 3, '0000', '', '', '0000'),
  (121, 142, 4, '0000', '', '', '0000'),
  (122, 142, 5, '0000', '', '', '0000'),
  (123, 142, 6, '0000', '', '', '0000'),
  (124, 143, 1, '0800', '', '', '0200'),
  (125, 143, 2, '0800', '', '', '0200'),
  (126, 143, 3, '0800', '', '', '0200'),
  (127, 143, 4, '0800', '', '', '0200'),
  (128, 143, 5, '0800', '', '', '0200'),
  (129, 143, 6, '0800', '', '', '0200'),
  (130, 143, 7, '0800', '', '', '0200'),
  (131, 144, 1, '1100', '', '', '2330'),
  (132, 144, 2, '1100', '', '', '2330'),
  (133, 144, 3, '1100', '', '', '2330'),
  (134, 144, 4, '1100', '', '', '2330'),
  (135, 144, 5, '1100', '', '', '2330'),
  (136, 144, 6, '1200', '', '', '1600'),
  (137, 145, 1, '0600', '', '', '2300'),
  (138, 145, 2, '0600', '', '', '2300'),
  (139, 145, 3, '0600', '', '', '2300'),
  (140, 145, 4, '0600', '', '', '2300'),
  (141, 145, 5, '0600', '', '', '2300'),
  (142, 145, 6, '0600', '', '', '2300'),
  (143, 145, 7, '0600', '', '', '2300'),
  (144, 146, 1, '0700', '', '', '1030'),
  (145, 146, 2, '1230', '', '', '1430'),
  (146, 146, 3, '0700', '', '', '1000'),
  (147, 146, 4, '1230', '', '', '1430'),
  (148, 146, 5, '0700', '', '', '1000'),
  (149, 146, 6, '1230', '', '', '1430'),
  (150, 146, 7, '0700', '', '', '1000'),
  (159, 147, 1, '0000', '', '', '0000'),
  (160, 147, 2, '0000', '', '', '0000'),
  (161, 147, 3, '0000', '', '', '0000'),
  (162, 147, 4, '0000', '', '', '0000'),
  (163, 147, 5, '0000', '', '', '0000'),
  (164, 147, 6, '0000', '', '', '0000'),
  (165, 148, 1, '1200', '', '', '1330'),
  (166, 148, 2, '1930', '', '', '2115'),
  (167, 148, 3, '1200', '', '', '1330'),
  (168, 148, 4, '1930', '', '', '2115'),
  (169, 148, 5, '1200', '', '', '1330'),
  (170, 148, 6, '1930', '', '', '2115'),
  (171, 148, 7, '1200', '', '', '1330'),
  (175, 149, 1, '1930', '', '', '2230'),
  (176, 149, 2, '1930', '', '', '2230'),
  (177, 149, 3, '1930', '', '', '2230'),
  (178, 149, 4, '1930', '', '', '2230'),
  (179, 149, 5, '1930', '', '', '2230'),
  (180, 150, 1, '1730', '', '', '0115'),
  (181, 150, 2, '1730', '', '', '0115'),
  (182, 150, 3, '1730', '', '', '0115'),
  (183, 150, 4, '1730', '', '', '0115'),
  (184, 150, 5, '1730', '', '', '0115'),
  (185, 150, 6, '1730', '', '', '0115'),
  (186, 151, 1, '1800', '', '', '0200'),
  (187, 151, 2, '1800', '', '', '0200'),
  (188, 151, 3, '1800', '', '', '0200'),
  (189, 151, 4, '1800', '', '', '0200'),
  (190, 151, 5, '1800', '', '', '0200'),
  (191, 152, 1, '1830', '', '', '0100'),
  (192, 152, 2, '1830', '', '', '0100'),
  (193, 152, 3, '1830', '', '', '0100'),
  (194, 152, 4, '1830', '', '', '0100'),
  (195, 152, 5, '1830', '', '', '0100'),
  (196, 152, 6, '1830', '', '', '0100'),
  (197, 152, 7, '1830', '', '', '0100'),
  (198, 153, 1, '0400', '', '', '1200'),
  (199, 153, 2, '0900', '', '', '0100'),
  (200, 153, 3, '0900', '', '', '0100'),
  (201, 153, 4, '0900', '', '', '0100'),
  (202, 153, 5, '0900', '', '', '0100'),
  (203, 153, 6, '0900', '', '', '0100'),
  (204, 153, 7, '1000', '', '', '0100'),
  (205, 154, 1, '1700', '', '', '0200'),
  (206, 154, 2, '1700', '', '', '0200'),
  (207, 154, 3, '1700', '', '', '0200'),
  (208, 154, 4, '1700', '', '', '0200'),
  (209, 154, 5, '1700', '', '', '0200'),
  (210, 154, 6, '1700', '', '', '0200'),
  (211, 154, 7, '1700', '', '', '0200');

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
  (2, 'TEBOUL', 'BENJAMIN', 'd0c3dd61bd01b0219c19769cff0dd2b2', NULL, 'benj.teboul@gmail.com'),
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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `Image`
--
ALTER TABLE `Image`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT pour la table `Monument`
--
ALTER TABLE `Monument`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT pour la table `Ouvrir`
--
ALTER TABLE `Ouvrir`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

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
