-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinemageorges
CREATE DATABASE IF NOT EXISTS `cinemageorges` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinemageorges`;

-- Listage de la structure de table cinemageorges. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int NOT NULL,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_acteur`),
  KEY `id_personne_acteur` (`id_personne`) USING BTREE,
  CONSTRAINT `acteur_personne_fk` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Listage des données de la table cinemageorges.acteur : ~0 rows (environ)
INSERT INTO `acteur` (`id_acteur`, `id_personne`) VALUES
	(1, 1);

-- Listage de la structure de table cinemageorges. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_film` int NOT NULL,
  `id_acteur` int NOT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_film`,`id_acteur`,`id_role`),
  KEY `id_film` (`id_film`),
  KEY `id_acteur` (`id_acteur`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `casting_acteur_fk` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `casting_film_fk` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `casting_role_fk` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinemageorges.casting : ~0 rows (environ)
INSERT INTO `casting` (`id_film`, `id_acteur`, `id_role`) VALUES
	(1, 1, 1),
	(1, 1, 2);

-- Listage de la structure de table cinemageorges. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL,
  `titre` varchar(50) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `duree` int NOT NULL DEFAULT '0',
  `synopsis` text,
  `affiche` varchar(255) NOT NULL DEFAULT '',
  `note` float DEFAULT '0',
  `id_realisateur` int NOT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`) USING BTREE,
  CONSTRAINT `film_realisateur_fk` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinemageorges.film : ~0 rows (environ)
INSERT INTO `film` (`id_film`, `titre`, `date`, `duree`, `synopsis`, `affiche`, `note`, `id_realisateur`) VALUES
	(1, 'Stop me if you can', '1980-03-03', 0, 'synopsis resume', 'api/imageid', 3, 1);

-- Listage de la structure de table cinemageorges. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinemageorges.genre : ~0 rows (environ)
INSERT INTO `genre` (`id_genre`, `type`) VALUES
	(1, 'action'),
	(2, 'science');

-- Listage de la structure de table cinemageorges. genr_det
CREATE TABLE IF NOT EXISTS `genr_det` (
  `id_genre` int NOT NULL,
  `id_film` int NOT NULL,
  PRIMARY KEY (`id_genre`,`id_film`),
  KEY `film_fk2` (`id_film`),
  KEY `genre_fk1` (`id_genre`) USING BTREE,
  CONSTRAINT `film_fk2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `genre_fk1` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table cinemageorges.genr_det : ~0 rows (environ)
INSERT INTO `genr_det` (`id_genre`, `id_film`) VALUES
	(1, 1),
	(2, 1);

-- Listage de la structure de table cinemageorges. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL,
  `nom` varchar(50) NOT NULL DEFAULT '',
  `prenom` varchar(50) NOT NULL DEFAULT '',
  `sexe` varchar(50) NOT NULL DEFAULT '',
  `date_de_naissance` date NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinemageorges.personne : ~0 rows (environ)
INSERT INTO `personne` (`id_personne`, `nom`, `prenom`, `sexe`, `date_de_naissance`) VALUES
	(1, 'kayal', 'georges', 'M', '2023-03-03');

-- Listage de la structure de table cinemageorges. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int NOT NULL,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_realisateur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `realisateur_personne_fk` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinemageorges.realisateur : ~0 rows (environ)
INSERT INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, 1);

-- Listage de la structure de table cinemageorges. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL,
  `nom` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinemageorges.role : ~0 rows (environ)
INSERT INTO `role` (`id_role`, `nom`) VALUES
	(1, 'principale'),
	(2, 'secondaire');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
