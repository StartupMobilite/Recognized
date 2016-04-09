CREATE DATABASE  IF NOT EXISTS `recognizedbdd` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `RecognizedBDD`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: RecognizedBDD
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Adresse`
--

DROP TABLE IF EXISTS `Adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adresse` (
  `adresse_id` int(45) NOT NULL AUTO_INCREMENT,
  `adresse_numeroVoie` int(11) NOT NULL,
  `adresse_nomVoie` varchar(45) NOT NULL,
  `adresse_codePostal` varchar(45) NOT NULL,
  `adresse_ville` varchar(45) NOT NULL,
  `adresse_pays` varchar(45) NOT NULL,
  PRIMARY KEY (`adresse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adresse`
--

LOCK TABLES `Adresse` WRITE;
/*!40000 ALTER TABLE `Adresse` DISABLE KEYS */;
/*!40000 ALTER TABLE `Adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorie`
--

DROP TABLE IF EXISTS `Categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorie` (
  `categorie_id` int(11) NOT NULL,
  `categorie_libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorie`
--

LOCK TABLES `Categorie` WRITE;
/*!40000 ALTER TABLE `Categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commande`
--

DROP TABLE IF EXISTS `Commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commande` (
  `commande_id` int(11) NOT NULL AUTO_INCREMENT,
  `commande_reference` varchar(45) NOT NULL,
  `commande_date` datetime NOT NULL,
  `commande_etat` varchar(45) NOT NULL,
  `commande_panier` int(11) DEFAULT NULL,
  `commande_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`commande_id`),
  KEY `fk_commande_panier_idx` (`commande_panier`),
  KEY `fk_commande_client_idx` (`commande_client`),
  CONSTRAINT `fk_commande_client` FOREIGN KEY (`commande_client`) REFERENCES `personne` (`personne_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_commande_panier` FOREIGN KEY (`commande_panier`) REFERENCES `panier` (`panier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commande`
--

LOCK TABLES `Commande` WRITE;
/*!40000 ALTER TABLE `Commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `Commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompteBancaire`
--

DROP TABLE IF EXISTS `CompteBancaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompteBancaire` (
  `compteBancaire_id` int(11) NOT NULL,
  `compteBancaire_banque` varchar(45) DEFAULT NULL,
  `compteBancaire_code_banque` int(11) DEFAULT NULL,
  `compteBancaire_iban` varchar(45) DEFAULT NULL,
  `compteBancaire_code_BIC` varchar(45) DEFAULT NULL,
  `compteBancaire_numero_compte` varchar(45) DEFAULT NULL,
  `compteBancaire_cle_rib` varchar(45) DEFAULT NULL,
  `compteBancaire_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`compteBancaire_id`),
  KEY `fk_compteBancaire_personne_idx` (`compteBancaire_personne`),
  CONSTRAINT `fk_compteBancaire_personne` FOREIGN KEY (`compteBancaire_personne`) REFERENCES `personne` (`personne_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompteBancaire`
--

LOCK TABLES `CompteBancaire` WRITE;
/*!40000 ALTER TABLE `CompteBancaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompteBancaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LignePanier`
--

DROP TABLE IF EXISTS `LignePanier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LignePanier` (
  `lignePanier_quantite` int(11) NOT NULL,
  `lignePanier_produit` int(11) NOT NULL,
  `lignePanier_panier` int(11) NOT NULL,
  KEY `fk_lignePanier_produit_idx` (`lignePanier_produit`),
  KEY `fk_lignePanier_panier_idx` (`lignePanier_panier`),
  CONSTRAINT `fk_lignePanier_produit` FOREIGN KEY (`lignePanier_produit`) REFERENCES `produit` (`produit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lignePanier_panier` FOREIGN KEY (`lignePanier_panier`) REFERENCES `panier` (`panier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LignePanier`
--

LOCK TABLES `LignePanier` WRITE;
/*!40000 ALTER TABLE `LignePanier` DISABLE KEYS */;
/*!40000 ALTER TABLE `LignePanier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marque`
--

DROP TABLE IF EXISTS `Marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Marque` (
  `marque_id` int(11) NOT NULL AUTO_INCREMENT,
  `marque_libelle` varchar(45) NOT NULL,
  `marque_logo` varchar(45) DEFAULT NULL,
  `marque_createur` int(11) DEFAULT NULL,
  PRIMARY KEY (`marque_id`),
  KEY `fk_marque_createur_idx` (`marque_createur`),
  CONSTRAINT `fk_marque_createur` FOREIGN KEY (`marque_createur`) REFERENCES `personne` (`personne_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marque`
--

LOCK TABLES `Marque` WRITE;
/*!40000 ALTER TABLE `Marque` DISABLE KEYS */;
INSERT INTO `Marque` VALUES (1,'Bennnito','lol',3),(5,'llq','llk',3);
/*!40000 ALTER TABLE `Marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Panier`
--

DROP TABLE IF EXISTS `Panier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Panier` (
  `panier_id` int(11) NOT NULL AUTO_INCREMENT,
  `panier_client` int(11) NOT NULL,
  PRIMARY KEY (`panier_id`),
  KEY `fk_panier_client_idx` (`panier_client`),
  CONSTRAINT `fk_panier_client` FOREIGN KEY (`panier_client`) REFERENCES `personne` (`personne_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Panier`
--

LOCK TABLES `Panier` WRITE;
/*!40000 ALTER TABLE `Panier` DISABLE KEYS */;
/*!40000 ALTER TABLE `Panier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personne`
--

DROP TABLE IF EXISTS `Personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Personne` (
  `personne_id` int(45) NOT NULL AUTO_INCREMENT,
  `personne_nom` varchar(45) NOT NULL,
  `personne_prenom` varchar(45) DEFAULT NULL,
  `personne_mail` varchar(45) NOT NULL,
  `personne_password` varchar(45) NOT NULL,
  `personne_description` varchar(45) DEFAULT NULL,
  `personne_telephone` int(11) NOT NULL,
  `personne_site` varchar(45) DEFAULT NULL,
  `personne_typePersonne` int(45) NOT NULL,
  `personne_adresse` int(45) unsigned DEFAULT NULL,
  PRIMARY KEY (`personne_id`,`personne_telephone`),
  KEY `fk_personne_typePersonne_idx` (`personne_typePersonne`),
  CONSTRAINT `fk_personne_typePersonne` FOREIGN KEY (`personne_typePersonne`) REFERENCES `typepersonne` (`typePersonne_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personne`
--

LOCK TABLES `Personne` WRITE;
/*!40000 ALTER TABLE `Personne` DISABLE KEYS */;
INSERT INTO `Personne` VALUES (1,'ould','karine','kdka@zd.fr','test',NULL,0,NULL,0,0),(2,'perin','janany','janou@hotmail.fr','test2',NULL,9999999,NULL,1,NULL),(3,'nikieama','ben','ben@lol.com','test3','LOOL',0,NULL,2,NULL),(4,'',NULL,'','',NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `Personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produit`
--

DROP TABLE IF EXISTS `Produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produit` (
  `produit_id` int(11) NOT NULL AUTO_INCREMENT,
  `produit_reference` varchar(45) NOT NULL,
  `produit_libelle` varchar(45) NOT NULL,
  `produit_description` varchar(75) DEFAULT NULL,
  `produit_prix` float NOT NULL,
  `produit_quantite_stock` varchar(45) NOT NULL,
  `produit_marque` int(11) NOT NULL,
  `produit_categorie` int(11) NOT NULL,
  `produit_createur` int(11) NOT NULL,
  PRIMARY KEY (`produit_id`),
  KEY `fk_produit_marque_idx` (`produit_marque`),
  KEY `fk_produit_categorie_idx` (`produit_categorie`),
  KEY `fk_produit_createur_idx` (`produit_createur`),
  CONSTRAINT `fk_produit_categorie` FOREIGN KEY (`produit_categorie`) REFERENCES `categorie` (`categorie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produit_createur` FOREIGN KEY (`produit_createur`) REFERENCES `personne` (`personne_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produit_marque` FOREIGN KEY (`produit_marque`) REFERENCES `marque` (`marque_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produit`
--

LOCK TABLES `Produit` WRITE;
/*!40000 ALTER TABLE `Produit` DISABLE KEYS */;
/*!40000 ALTER TABLE `Produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reglement`
--

DROP TABLE IF EXISTS `Reglement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reglement` (
  `reglement_id` int(11) NOT NULL AUTO_INCREMENT,
  `reglement_montant` float DEFAULT NULL,
  `reglement_mode` varchar(45) DEFAULT NULL,
  `reglement_date` datetime DEFAULT NULL,
  `reglement_compteBancaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`reglement_id`),
  KEY `fk_reglement_compteBancaire_idx` (`reglement_compteBancaire`),
  CONSTRAINT `fk_reglement_compteBancaire` FOREIGN KEY (`reglement_compteBancaire`) REFERENCES `comptebancaire` (`compteBancaire_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reglement`
--

LOCK TABLES `Reglement` WRITE;
/*!40000 ALTER TABLE `Reglement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reglement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TypePersonne`
--

DROP TABLE IF EXISTS `TypePersonne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TypePersonne` (
  `typePersonne_id` int(11) NOT NULL,
  `typePersonne_valeur` varchar(45) NOT NULL,
  PRIMARY KEY (`typePersonne_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TypePersonne`
--

LOCK TABLES `TypePersonne` WRITE;
/*!40000 ALTER TABLE `TypePersonne` DISABLE KEYS */;
INSERT INTO `TypePersonne` VALUES (0,'admin'),(1,'client'),(2,'createur');
/*!40000 ALTER TABLE `TypePersonne` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-16 16:35:42
