-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Lun 15 Décembre 2014 à 11:11
-- Version du serveur: 5.5.37
-- Version de PHP: 5.4.6-1ubuntu1.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gestage`
--

-- --------------------------------------------------------

--
-- Structure de la table `ANNEESCOL`
--

CREATE TABLE IF NOT EXISTS `ANNEESCOL` (
  `ANNEESCOL` char(9) NOT NULL,
  PRIMARY KEY (`ANNEESCOL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ANNEESCOL`
--

INSERT INTO `ANNEESCOL` (`ANNEESCOL`) VALUES
('2008-2009'),
('2009-2010'),
('2010-2011'),
('2011-2012'),
('2012-2013'),
('2013-2014'),
('2014-2015');

-- --------------------------------------------------------

--
-- Structure de la table `CLASSE`
--

CREATE TABLE IF NOT EXISTS `CLASSE` (
  `NUMCLASSE` char(32) NOT NULL,
  `IDSPECIALITE` smallint(6) DEFAULT NULL,
  `NUMFILIERE` int(11) NOT NULL,
  `NOMCLASSE` varchar(128) NOT NULL,
  PRIMARY KEY (`NUMCLASSE`),
  KEY `CLASSE_IBFK_1` (`IDSPECIALITE`),
  KEY `CLASSE_IBFK_2` (`NUMFILIERE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `CLASSE`
--

INSERT INTO `CLASSE` (`NUMCLASSE`, `IDSPECIALITE`, `NUMFILIERE`, `NOMCLASSE`) VALUES
('1SIOA', NULL, 4, '1ére année BTS Service Informatique auxOrganisation'),
('1SIOB', NULL, 4, '1ére année BTS Service Informatique auxOrganisation'),
('2SISR', 2, 4, '2ème année BTS Service Informatique auxOrganisation'),
('2SLAM', 1, 4, '2ème année BTS Service Informatique auxOrganisation');

-- --------------------------------------------------------

--
-- Structure de la table `CONTACT_ORGANISATION`
--

CREATE TABLE IF NOT EXISTS `CONTACT_ORGANISATION` (
  `IDORGANISATION` int(11) NOT NULL,
  `IDCONTACT` int(11) NOT NULL,
  `FONCTION` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`IDORGANISATION`,`IDCONTACT`),
  KEY `I_FK_CONTACT_ORGANISATION_ORGA` (`IDORGANISATION`),
  KEY `I_FK_CONTACT_ORGANISATION_PERS` (`IDCONTACT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `FILIERE`
--

CREATE TABLE IF NOT EXISTS `FILIERE` (
  `NUMFILIERE` int(11) NOT NULL,
  `LIBELLEFILIERE` varchar(128) NOT NULL,
  PRIMARY KEY (`NUMFILIERE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `FILIERE`
--

INSERT INTO `FILIERE` (`NUMFILIERE`, `LIBELLEFILIERE`) VALUES
(1, 'Management des Unités Commerciales'),
(2, 'Comptabilité et Gestion des Organisations'),
(3, 'Informatique de Gestion'),
(4, 'Services Informatiques aux Organisations'),
(5, 'Diplôme de Comptabilité et de Gestion'),
(6, 'Formation Complémentaire d''Initiative Locale');

-- --------------------------------------------------------

--
-- Structure de la table `ORGANISATION`
--

CREATE TABLE IF NOT EXISTS `ORGANISATION` (
  `IDORGANISATION` int(11) NOT NULL,
  `NOM_ORGANISATION` varchar(255) NOT NULL,
  `VILLE_ORGANISATION` varchar(128) NOT NULL,
  `ADRESSE_ORGANISATION` varchar(128) NOT NULL,
  `CP_ORGANISATION` char(10) NOT NULL,
  `TEL_ORGANISATION` char(15) NOT NULL,
  `FAX_ORGANISATION` char(15) DEFAULT NULL,
  `FORMEJURIDIQUE` varchar(10) NOT NULL,
  `ACTIVITE` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`IDORGANISATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ORGANISATION`
--

INSERT INTO `ORGANISATION` (`IDORGANISATION`, `NOM_ORGANISATION`, `VILLE_ORGANISATION`, `ADRESSE_ORGANISATION`, `CP_ORGANISATION`, `TEL_ORGANISATION`, `FAX_ORGANISATION`, `FORMEJURIDIQUE`, `ACTIVITE`) VALUES
(1, 'ECOLES DES MINES', 'NANTES', '4 rue alfred kastler', '44300', '0251858100', '1574893129', 'SA', 'dev'),
(2, 'Info Transit', 'STHERBLAIN', 'rue de la roulette', '48520', '0305040207', '', 'SArl', 'res');

-- --------------------------------------------------------

--
-- Structure de la table `PERSONNE`
--

CREATE TABLE IF NOT EXISTS `PERSONNE` (
  `IDPERSONNE` int(11) NOT NULL AUTO_INCREMENT,
  `IDSPECIALITE` smallint(6) DEFAULT NULL,
  `IDROLE` smallint(6) NOT NULL,
  `CIVILITE` char(32) NOT NULL,
  `NOM` varchar(30) NOT NULL,
  `PRENOM` varchar(20) NOT NULL,
  `NUM_TEL` char(13) NOT NULL,
  `ADRESSE_MAIL` varchar(30) NOT NULL,
  `NUM_TEL_MOBILE` char(15) DEFAULT NULL,
  `ETUDES` varchar(40) DEFAULT NULL,
  `FORMATION` varchar(128) DEFAULT NULL,
  `LOGINUTILISATEUR` varchar(128) DEFAULT NULL,
  `MDPUTILISATEUR` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`IDPERSONNE`),
  KEY `PERSONNE_IBFK_1` (`IDSPECIALITE`),
  KEY `PERSONNE_IBFK_2` (`IDROLE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Contenu de la table `PERSONNE`
--

INSERT INTO `PERSONNE` (`IDPERSONNE`, `IDSPECIALITE`, `IDROLE`, `CIVILITE`, `NOM`, `PRENOM`, `NUM_TEL`, `ADRESSE_MAIL`, `NUM_TEL_MOBILE`, `ETUDES`, `FORMATION`, `LOGINUTILISATEUR`, `MDPUTILISATEUR`) VALUES
(1, NULL, 1, 'Monsieur', 'Bourgeois', 'Nicolas', '0240809080', 'admin-gestage@la-joliverie.com', NULL, NULL, NULL, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(2, 1, 4, 'Mr', 'DEMARLY', 'thomas', '0600000000', 'tdemarl@gmail.com', '0600000000', 'STI option ï¿½lectrotechnique', 'NULL', 'tdemarly', 'ff289fa7cd0ed8339f20a43fa5f032d32fedd1d8'),
(3, 1, 0, 'Mselle', 'Amidala', 'Leïa', '0123456789', 'hastalarevolution@sempiere.com', 'NULL', 'NULL', 'NULL', 'lamidala', '6917033bf06842ac92d19800176448617aed8beb'),
(4, 1, 2, 'Mr', 'Binks', 'Jar-Jar', '0123456780', 'naboo@senat.com', 'NULL', 'NULL', 'NULL', 'jjbinks', '6da68fc08c64b2203b7c6482c5ea4302a4d20891'),
(5, 1, 3, 'Mr', 'Vador', 'Dark', '0123456700', 'vadordu95@empire.com', 'NULL', 'NULL', 'NULL', 'vadordu95', 'fafec1e5ff94390c631054d24bd289e8951e151e'),
(13, NULL, 5, 'Monsieur', 'Jobs', 'Steve', '0123456789', 'test1@gmail.com', '', '', '', 'etudiant', '2df87b6c0bfbdb58b91c7a50ac9ca42b086db583'),
(14, 1, 3, 'Monsieur', 'Beauvais', 'Jean pierre', '0000000000', 'test@mail.fr', '0000000000', 'Bts SIO', 'BTS', 'test', '51abb9636078defbf888d8457a7c76f85c8f114c'),
(16, NULL, 4, 'Monsieur', 'Goulet', 'Jerome', '0251745362', 'gg@live.fr', '0685635853', 'Informatique', 'BTS SIO', 'jerome', 'gouletgg'),
(17, NULL, 4, 'Monsieur', 'Maull', 'Dark', '0412457896', 'jesuismuet@laforce.com', '0666666666', 'BAC Force', 'Empire', 'dmaul', 'b927edcef176b3cdd54e0bf8049954c94bc78156'),
(20, NULL, 2, 'Monsieur', 'Binks', 'Jarjar', '0123456789', 'missa@naboo.fr', '0666689652', 'BAC Force', 'Empire', 'jbinks', '97c4f07d3721d9a3e590defffa70175a7166d134'),
(26, NULL, 2, 'Monsieur', 'Kenobi', 'Dark', '0789456321', 'jesuismuet@laforce.com', '0666666666', '', '', 'vadordu95', '399e7192ab8b09b1a2a196a84472d7e6ddae3981'),
(27, NULL, 3, 'Madame', 'Kenobi', 'Obiwan', '0789456321', 'owkenobi@jedi.fr', '0678563254', '', '', 'vadordu95', '399e7192ab8b09b1a2a196a84472d7e6ddae3981'),
(28, NULL, 1, 'Madame', 'test', 'test', '0412457896', 'tes@test.fr', '0678563254', '', '', 'testalert', '99d1acb29dc5977e3a834c44a73eddb150452abd'),
(29, NULL, 2, 'Madame', 'Maull', 'Dark', '0789456321', 'owkenobi@jedi.fr', '0666666666', '', '', 'teeeeeeest', '399e7192ab8b09b1a2a196a84472d7e6ddae3981'),
(30, NULL, 1, 'Madame', 'fesfzqs', 'Dark', '0412457896', 'tdemarl@gmail.com', '0678563254', '', '', 'vefqgqzergserqgr', '399e7192ab8b09b1a2a196a84472d7e6ddae3981');

-- --------------------------------------------------------

--
-- Structure de la table `PROMOTION`
--

CREATE TABLE IF NOT EXISTS `PROMOTION` (
  `ANNEESCOL` char(9) NOT NULL,
  `IDPERSONNE` int(11) NOT NULL,
  `NUMCLASSE` char(32) NOT NULL,
  PRIMARY KEY (`ANNEESCOL`,`IDPERSONNE`,`NUMCLASSE`),
  KEY `PROMOTION_IBFK_5` (`NUMCLASSE`),
  KEY `PROMOTION_IBFK_4` (`IDPERSONNE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `PROMOTION`
--

INSERT INTO `PROMOTION` (`ANNEESCOL`, `IDPERSONNE`, `NUMCLASSE`) VALUES
('2010-2011', 2, '2SLAM'),
('2009-2010', 16, '2SLAM'),
('2014-2015', 17, '2SISR');

-- --------------------------------------------------------

--
-- Structure de la table `ROLE`
--

CREATE TABLE IF NOT EXISTS `ROLE` (
  `IDROLE` smallint(6) NOT NULL,
  `RANG` smallint(6) NOT NULL,
  `LIBELLE` varchar(30) NOT NULL,
  PRIMARY KEY (`IDROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ROLE`
--

INSERT INTO `ROLE` (`IDROLE`, `RANG`, `LIBELLE`) VALUES
(0, 0, 'Autre'),
(1, 1, 'Administrateur'),
(2, 2, 'Secrétaire'),
(3, 3, 'Professeur'),
(4, 4, 'Etudiant'),
(5, 5, 'MaitreDeStage');

-- --------------------------------------------------------

--
-- Structure de la table `SPECIALITE`
--

CREATE TABLE IF NOT EXISTS `SPECIALITE` (
  `IDSPECIALITE` smallint(6) NOT NULL,
  `LIBELLECOURTSPECIALITE` varchar(10) NOT NULL,
  `LIBELLELONGSPECIALITE` varchar(128) NOT NULL,
  PRIMARY KEY (`IDSPECIALITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `SPECIALITE`
--

INSERT INTO `SPECIALITE` (`IDSPECIALITE`, `LIBELLECOURTSPECIALITE`, `LIBELLELONGSPECIALITE`) VALUES
(1, 'SLAM', 'Solutions logicielles et applications métiers'),
(2, 'SISR', 'Solutions d''infrastructures systèmes et réseaux');

-- --------------------------------------------------------

--
-- Structure de la table `STAGE`
--

CREATE TABLE IF NOT EXISTS `STAGE` (
  `NUM_STAGE` int(11) NOT NULL AUTO_INCREMENT,
  `ANNEESCOL` char(9) NOT NULL,
  `IDETUDIANT` int(11) NOT NULL,
  `IDPROFESSEUR` int(11) NOT NULL,
  `IDORGANISATION` int(11) NOT NULL,
  `IDMAITRESTAGE` int(11) NOT NULL,
  `DATEDEBUT` date NOT NULL,
  `DATEFIN` date NOT NULL,
  `DATEVISITESTAGE` date DEFAULT NULL,
  `VILLE` varchar(128) NOT NULL,
  `DIVERS` varchar(255) DEFAULT NULL,
  `BILANTRAVAUX` varchar(255) NOT NULL,
  `RESSOURCESOUTILS` varchar(255) NOT NULL,
  `COMMENTAIRES` varchar(255) NOT NULL,
  `PARTICIPATIONCCF` varchar(255) NOT NULL,
  PRIMARY KEY (`NUM_STAGE`),
  KEY `I_FK_STAGE_ANNEESCOL` (`ANNEESCOL`),
  KEY `I_FK_STAGE_ORGANISATION` (`IDORGANISATION`),
  KEY `I_FK_STAGE_PERSONNE` (`IDETUDIANT`),
  KEY `I_FK_STAGE_PERSONNE3` (`IDPROFESSEUR`),
  KEY `I_FK_STAGE_PERSONNE4` (`IDMAITRESTAGE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `STAGE`
--

INSERT INTO `STAGE` (`NUM_STAGE`, `ANNEESCOL`, `IDETUDIANT`, `IDPROFESSEUR`, `IDORGANISATION`, `IDMAITRESTAGE`, `DATEDEBUT`, `DATEFIN`, `DATEVISITESTAGE`, `VILLE`, `DIVERS`, `BILANTRAVAUX`, `RESSOURCESOUTILS`, `COMMENTAIRES`, `PARTICIPATIONCCF`) VALUES
(2, '2008-2009', 2, 14, 2, 14, '2013-10-17', '2013-10-18', '2013-10-18', 'nantes', NULL, '', '', '', '0'),
(14, '2008-2009', 2, 14, 1, 13, '2013-09-10', '2013-11-10', '2013-11-02', 'Nantes', 'teqe', 'fefsseffes', 'efssfe', 'sfesfe', '11'),
(15, '2011-2012', 2, 14, 1, 13, '2013-09-10', '2013-11-10', '2013-11-02', 'Nantes', 'Stage sur Linux', 'efes', 'fes', 'fsefse', '1'),
(16, '2012-2013', 16, 14, 2, 13, '2013-09-10', '2013-11-10', '2013-11-02', 'Marseille', '', '', '', '', '');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `PROMOTION`
--
ALTER TABLE `PROMOTION`
  ADD CONSTRAINT `PROMOTION_ibfk_3` FOREIGN KEY (`ANNEESCOL`) REFERENCES `ANNEESCOL` (`ANNEESCOL`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PROMOTION_ibfk_4` FOREIGN KEY (`IDPERSONNE`) REFERENCES `PERSONNE` (`IDPERSONNE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PROMOTION_ibfk_5` FOREIGN KEY (`NUMCLASSE`) REFERENCES `CLASSE` (`NUMCLASSE`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
