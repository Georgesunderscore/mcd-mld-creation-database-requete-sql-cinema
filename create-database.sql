-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.11.2-MariaDB - mariadb.org binary distribution
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


-- Listage de la structure de la base pour cinema
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `cinema`;

-- Listage de la structure de table cinema. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int(11) NOT NULL,
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_acteur`),
  KEY `id_personne_acteur` (`id_personne`) USING BTREE,
  CONSTRAINT `acteur_personne_fk` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table cinema. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_film` int(11) NOT NULL,
  `id_acteur` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_film`,`id_acteur`,`id_role`),
  KEY `id_film` (`id_film`),
  KEY `id_acteur` (`id_acteur`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `casting_acteur_fk` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `casting_film_fk` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `casting_role_fk` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table cinema. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `duree` time NOT NULL DEFAULT '00:00:00',
  `synopsis` text DEFAULT NULL,
  `affiche` varchar(255) NOT NULL DEFAULT '',
  `note` float DEFAULT 0,
  `id_realisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`) USING BTREE,
  CONSTRAINT `film_realisateur_fk` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table cinema. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL DEFAULT '',
  `prenom` varchar(50) NOT NULL DEFAULT '',
  `sexe` varchar(50) NOT NULL DEFAULT '',
  `date_de_naissance` date NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table cinema. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int(11) NOT NULL,
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_realisateur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `realisateur_personne_fk` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Les données exportées n'étaient pas sélectionnées.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
