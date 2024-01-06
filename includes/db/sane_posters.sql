-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: sane_posters
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` int unsigned NOT NULL AUTO_INCREMENT,
  `color_name` varchar(20) NOT NULL,
  `hexcode` varchar(6) NOT NULL,
  PRIMARY KEY (`color_id`),
  UNIQUE KEY `color_id_UNIQUE` (`color_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'red','ff0000'),(2,'yellow','ffff00'),(3,'orange','ff6600'),(4,'blue','0000ff'),(5,'purple','cc00ff'),(6,'brown','663300'),(7,'green','00ff00'),(8,'pink','ff99ff');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `director_id` int unsigned NOT NULL AUTO_INCREMENT,
  `director_first` varchar(45) DEFAULT NULL,
  `director_middle` varchar(45) DEFAULT NULL,
  `director_last` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`director_id`),
  UNIQUE KEY `director_id_UNIQUE` (`director_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Lewis',NULL,'Seiler'),(2,'Don',NULL,'Sharp'),(3,'Joseph',NULL,'Kane'),(4,'William',NULL,'Dieterle'),(5,'Joseph','H.','Lewis'),(6,'Delbert',NULL,'Mann'),(7,'Robert',NULL,'Stevenson'),(8,'George',NULL,'Sydney'),(9,'Bruce',NULL,'Humberstone');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor`
--

DROP TABLE IF EXISTS `distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributor` (
  `distributor_id` int unsigned NOT NULL AUTO_INCREMENT,
  `distributor_name` varchar(100) NOT NULL,
  PRIMARY KEY (`distributor_id`),
  UNIQUE KEY `distributor_id_UNIQUE` (`distributor_id`),
  UNIQUE KEY `distributor_name_UNIQUE` (`distributor_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor`
--

LOCK TABLES `distributor` WRITE;
/*!40000 ALTER TABLE `distributor` DISABLE KEYS */;
INSERT INTO `distributor` VALUES (1,'Columbia Pictures'),(2,'Allied Artists'),(3,'Republic Pictures'),(4,'Paramount Pictures'),(5,'United States Pictures'),(6,'United Artists'),(7,'Buena Vista Distribution Company'),(8,'Metro-Goldwyn-Mayer'),(9,'Universal Pictures');
/*!40000 ALTER TABLE `distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `film_id` int unsigned NOT NULL AUTO_INCREMENT,
  `film_title` varchar(100) NOT NULL,
  `film_year` year DEFAULT NULL,
  `film_synopsis` text,
  `distributor_id` int unsigned NOT NULL DEFAULT '0',
  `producer_id` int unsigned NOT NULL DEFAULT '0',
  `productionco_id` int unsigned NOT NULL DEFAULT '0',
  `director_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`film_id`,`distributor_id`,`producer_id`,`productionco_id`,`director_id`),
  UNIQUE KEY `film_id_UNIQUE` (`film_id`),
  UNIQUE KEY `film_title_UNIQUE` (`film_title`),
  KEY `fk_film_distributor` (`distributor_id`),
  KEY `fk_film_producer` (`producer_id`),
  KEY `fk_film_productionco` (`productionco_id`),
  KEY `fk_film_director` (`director_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'The True Story of Lynn Stuart',1958,'When the nephews of Phyllis Carter are killed in an automobile crash while under the influence of narcotics, she persuades Police Lieutenant Jim Hahan to use her as an undercover agent, despite the fact she is married and has a young son. She is trained to impersonate \'Lynn Stuart,\" who did time for a bank hold-up, and is given a job at a drive-in restaurant where members of a narcotics-gang are know to frequent. She attracts the attention of Willie Down, a mid-level boss in the gang and begins getting information from him. Her husband, alarmed over the health of their son gets her to promise to quit. Willie takes her to Mexico, where he and a gang-henchman murder the driver and guard of a truck transporting dope and hijack the load. Phyllis/Lynn goes to the ladies-room of a service station where she scribble their destination on a mirror using lipstick.',1,1,1,1),(2,'Fair Wind to Java',1953,'The Dutch East Indies, at the end of the nineteenth century. An adventurous captain of an American merchant vessel is looking for a sunken Dutch vessel containing 10,000 precious diamonds. Unfortunately, he\'s not the only one and then there\'s also that volcano on the nearby island of Krakatau, waiting to explode in its historical, disastrous eruption... ',3,3,2,3),(3,'Peking Express',1951,'Many passengers on the Shanghai Express are more concerned that the notorious Shanghai Lil is on board than the fact that a civil war is going on that may make the trip take more than three days. The British Army doctor, Donald Harvey, knew Lil before she became a famous \"coaster.\" A fellow passenger defines a coaster as \"a woman who lives by her wits along the China coast.\" When Chinese guerillas stop the train, Dr. Harvey is selected as the hostage. Lil saves him, but can she make him believe that she really hasn\'t changed from the woman he loved five years before?',4,4,3,4),(4,'The Bachelor Party',1957,'Five office friends meet up for a night on the town to celebrate the forthcoming marriage of one of them. As the night wears on and the drink starts to tell, they become more confidential in expressing their concerns and hopes.',6,5,5,6),(5,'Old Yeller',1957,'Five office friends meet up for a night on the town to celebrate the forthcoming marriage of one of them. As the night wears on and the drink starts to tell, they become more confidential in expressing their concerns and hopes.',7,6,6,7),(6,'Kiss Me Kate',1953,'Fred and Lilly are a divorced pair of actors who are brought together by Cole Porter who has written a musical version of The Taming of the Shrew. Of course, the couple seem to act a great deal like the characters they play. A fight on the opening night threatens the production, as well as two thugs who have the mistaken idea that Fred owes their boss money and insist on staying next to him all night. ',8,7,7,8),(7,'The Purple Mask',1955,'France, 1803: 11 years after the Revolution, a royalist underground is led by a new \'Scarlet Pimpernel\', the Purple Mask, who rescues nobles in distress and kidnaps Napoleon\'s officials for ransom, aided by the spy services of a group of lovely models headed by Laurette (really the Duc de Latour\'s daughter). But even she doesn\'t know the Purple Mask\'s real identity as foppish dancing master Rene...',9,8,8,9),(8,'The In-Between Age',1958,'A young couple expand their coffee bar to include a record shop and a recording outlet, to help a young singer, and to cash in on the start of the rock and roll era. ',2,2,0,2),(9,'Retreat, Hell!',1952,'During the Korean War, a U.S. Marine battalion must fight its way out of a frozen mountain pass despite diminishing supplies, freezing temperatures and constant attacks by overwhelming numbers of Chinese soldiers. ',5,0,4,5);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film-director`
--

DROP TABLE IF EXISTS `film-director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film-director` (
  `film-director_id` int unsigned NOT NULL AUTO_INCREMENT,
  `film_id` int DEFAULT NULL,
  `director_id` int DEFAULT NULL,
  PRIMARY KEY (`film-director_id`),
  UNIQUE KEY `film-director_id_UNIQUE` (`film-director_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film-director`
--

LOCK TABLES `film-director` WRITE;
/*!40000 ALTER TABLE `film-director` DISABLE KEYS */;
INSERT INTO `film-director` VALUES (1,1,1),(2,8,2),(3,2,3),(4,3,4),(5,9,5),(6,4,6),(7,5,7),(8,7,9),(9,6,8);
/*!40000 ALTER TABLE `film-director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film-genre`
--

DROP TABLE IF EXISTS `film-genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film-genre` (
  `film-genre_id` int unsigned NOT NULL AUTO_INCREMENT,
  `film_id` int unsigned NOT NULL,
  `genre_id` int unsigned NOT NULL,
  PRIMARY KEY (`film-genre_id`,`film_id`,`genre_id`),
  UNIQUE KEY `film-genre_id_UNIQUE` (`film-genre_id`),
  KEY `fk_film-genre_genre` (`genre_id`),
  KEY `fk_film-genre_film` (`film_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film-genre`
--

LOCK TABLES `film-genre` WRITE;
/*!40000 ALTER TABLE `film-genre` DISABLE KEYS */;
INSERT INTO `film-genre` VALUES (1,1,1),(2,1,9),(3,8,10),(4,2,5),(5,2,1),(6,2,4),(7,3,1),(8,3,6),(9,3,5),(10,3,11),(11,9,1),(12,9,12),(13,4,1),(14,5,1),(15,5,3),(16,5,4),(17,5,13),(18,6,2),(19,6,10),(20,6,11),(21,7,4);
/*!40000 ALTER TABLE `film-genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film-star`
--

DROP TABLE IF EXISTS `film-star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film-star` (
  `film-star_id` int unsigned NOT NULL AUTO_INCREMENT,
  `film_id` int unsigned NOT NULL,
  `star_id` int unsigned NOT NULL,
  PRIMARY KEY (`film-star_id`,`film_id`,`star_id`),
  UNIQUE KEY `film-star_id_UNIQUE` (`film-star_id`),
  KEY `fk_film-star_star` (`star_id`),
  KEY `fk_film-star_film` (`film_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film-star`
--

LOCK TABLES `film-star` WRITE;
/*!40000 ALTER TABLE `film-star` DISABLE KEYS */;
INSERT INTO `film-star` VALUES (1,1,1),(2,1,2),(3,1,3),(4,8,4),(5,8,5),(6,8,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,3,15),(16,3,16),(17,3,17),(18,3,18),(19,9,19),(20,9,20),(21,9,21),(22,9,22),(23,4,23),(24,4,24),(25,4,25),(26,4,26),(27,4,27),(28,4,28),(29,4,29),(30,5,30),(31,5,31),(32,5,32),(33,5,33),(34,5,34),(35,5,35),(36,5,36),(37,6,37),(38,6,38),(39,6,39),(40,6,40),(41,6,41),(42,6,42),(43,6,43),(44,7,44),(45,7,45),(46,7,46),(47,7,47),(48,7,48),(49,7,49),(50,7,50);
/*!40000 ALTER TABLE `film-star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int unsigned NOT NULL AUTO_INCREMENT,
  `genre_title` varchar(50) DEFAULT NULL,
  `genre_description` text,
  `GenreImage_file` varchar(25) NOT NULL,
  `GenreImage_location` varchar(20) DEFAULT NULL,
  `GenreImage_format` varchar(4) DEFAULT NULL,
  `GenreImage_size` int DEFAULT NULL,
  `GenreImage_dimensions` int DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_id_UNIQUE` (`genre_id`),
  UNIQUE KEY `GenreImage_file_UNIQUE` (`GenreImage_file`),
  UNIQUE KEY `genre_title_UNIQUE` (`genre_title`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Drama','Not quite melodramatic but close','001-001-083.jpg','/image/genre/','jpeg',0,0),(2,'Comedy','Really funny with ridiculous situations.','001-001-832.jpg','/images/genre/','jpeg',0,0),(3,'Family','Fun for the whole family with a wonderful lesson to learn.','001-001-084.jpg','/images/genre/','jpeg',0,0),(4,'Adventure','Exciting and exotic with a little fantastical whimsy.','001-001-094.jpg','/images/genre/','jpeg',0,0),(5,'Action','Let\'s get physical and blow things up with in between fight scenes.','001-001-023.jpg','/images/genre/','jpeg',0,0),(6,'Thriller','Heart racing intrigue.','001-001-025.jpg','/images/genre/','jpeg',0,0),(7,'Animation','Don\'t worry, it ain\'t real. It\'s drawn.','001-002-341.jpg','/images/genre/','jpeg',0,0),(8,'Horror','Frightening plots of death, undead, and monsters.','001-001-817.jpg','/images/genre/','jpeg',0,0),(9,'Crime','Somebody\'s doing wrong. Somebody\'s been don wrong. Who done it? Who\'s the body?','001-001-006.jpg','/images/genre/','jpeg',0,0),(10,'Romance','Falling in love isn\'t easy. There\'s twists, turns, rivalries, and misunderstandings that make the road to true love a gloriously bumpy ride.','001-001-098.jpg','/images/genre/','jpeg',0,0),(11,'War','Heroes fighting an enemy in combat.','001-001-068.jpg','/images/genre/','jpeg',0,0),(12,'Western','Horses, cowboys, and indians taming the wild west with guns, blazing saddles, and whiskey.','001-001-026.jpg','/images/genre/','jpeg',0,0),(13,'Science Fiction','Aliens, space travel, and The Future often clash with the inhabitants of the planet Earth.','001-002-074.jpg','/images/genre/','jpeg',0,0),(14,'Musical','Singing and dancing is perfectly normal for conversation as well as private thoughts.','001-001-091.jpg','/images/genre/','jpeg',0,0);
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster`
--

DROP TABLE IF EXISTS `poster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poster` (
  `poster_id` int unsigned NOT NULL AUTO_INCREMENT,
  `NSS` varchar(20) DEFAULT NULL,
  `poster_description` text,
  `poster_keywords` text,
  `poster_width` tinyint NOT NULL,
  `poster_height` tinyint NOT NULL,
  `poster_size` varchar(20) DEFAULT NULL,
  `PosterImage_caption` text,
  `PosterImage_alt` text,
  `PosterImage_dimensions` int DEFAULT NULL,
  `PosterImage_size` int DEFAULT NULL,
  `PosterImage_format` varchar(4) NOT NULL,
  `PosterImage_file` varchar(30) DEFAULT NULL,
  `style_id` int NOT NULL DEFAULT '0',
  `typo_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`poster_id`,`style_id`,`typo_id`),
  UNIQUE KEY `poster_id_UNIQUE` (`poster_id`),
  KEY `fk_poster_style` (`style_id`),
  KEY `fk_poster_typo` (`typo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster`
--

LOCK TABLES `poster` WRITE;
/*!40000 ALTER TABLE `poster` DISABLE KEYS */;
INSERT INTO `poster` VALUES (3,'58/16','A woman looks up in fear. Her hand covers her face revealing only her right eye. A braclet dangles from her wrist.  An inset image shows a man standing over a woman sitting on the ground in a torn red dress.  With his right fist clenched, he forcibly holds her right arm.  ','red dress, woman, man, fear, anger, bracelet, eye',27,41,'One sheet','\"I Don\'t Dare Show My Face!\"',NULL,2400,NULL,'JPEG','ustxauhrh-dc84-000463.jpg',12,1),(4,'58/368','Full of teenagers having fun, singing, dancing, and playing music.','rock & roll, singing, dancing, guitar, trumpet, record, teenagers, teenager, fun, music, musical, instruments, instruments, horn, jutterbug, ',27,41,'One sheet','The Big Platter Parade!',NULL,2400,NULL,'JPEG','ustxauhrh-dc84-000188.jpg',12,1),(5,'53/105','Action filled poster of a couple amidst a raging sea.  The man with ammo across his bare chest holds a rifle and a woman dressed in her finest tropical island chic. An inset image shows a man welding a whip next to a woman tied to a wooden cross.','volcano, man, woman, ship, destruction, lava, tropical, island, rifle, gun, ammo, ammunition, action, violence, sarong, sail, mast, sea vessel, sea, masted ship, whip, sailor, wave, waves, adventure',27,41,'One sheet','Greater than Wake of the Red Witch!',NULL,2400,NULL,'JPEG','ustxauhrh-dc84-000211.jpg',12,1),(6,'51/359','description to  come','machine gun, train, shooting, gun, violence, tommy gun, soldiers, battle, romance',27,41,'One sheet',NULL,NULL,2400,NULL,'JPEG','ustxauhrh-dc84-000378.jpg',13,1),(7,'52/58','description to  come','soldier, battle, war, gun, guns, rifle, spats, uniform, marine, marines, U.S. Marines, United States Marines, military, Korea, Korean War, children, running',27,41,'One sheet','The fightin\'est words in the whole fightin\' history of the U.S. Marines! Then a bunch of husky guys with star-spangled spunk took over!',NULL,2400,NULL,'JPEG','ustxauhrh-dc84-000241.jpg',13,1),(8,'57/149','description to  come','bachelors, skirt, objectifying, party',27,41,'One sheet','They\'ll live it up tonight!',NULL,2400,NULL,'JPEG','ustxauhrh-dc84-000295.jpg',13,2),(9,'74/112','description to  come','dog, family, gun, rifle, shotgun, children, child, ranch, fear, concern, anger',27,41,'One sheet','All the heart, all the excitement of a great frontier adventure!',NULL,2400,NULL,'JPEG','ustxauhrh-dc84-000340.jpg',12,2),(10,'53/609','description to  come','dancing, spanking, fan, legs, dancer, 3D, musical',27,41,'One sheet','Famed stage hit now big color musical!',NULL,2400,NULL,'JPEG','ustxauhrh-dc84-000446.jpg',12,2),(11,'55/215','description to  come','kiss, kissing, running, pistol, battle, neckless, romance, action, horses',27,41,'One sheet','The life and loves of adventure\'s greatest rogue!',NULL,2400,NULL,'JPEG','ustxauhrh-dc84-000488.jpg',12,2);
/*!40000 ALTER TABLE `poster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster-color`
--

DROP TABLE IF EXISTS `poster-color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poster-color` (
  `poster-color_id` int unsigned NOT NULL AUTO_INCREMENT,
  `poster_id` int unsigned NOT NULL,
  `color_id` int unsigned NOT NULL,
  PRIMARY KEY (`poster-color_id`,`poster_id`,`color_id`),
  UNIQUE KEY `poster-color_id_UNIQUE` (`poster-color_id`),
  KEY `fk_poster-color_color` (`color_id`),
  KEY `fk_poster-color_poster` (`poster_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster-color`
--

LOCK TABLES `poster-color` WRITE;
/*!40000 ALTER TABLE `poster-color` DISABLE KEYS */;
INSERT INTO `poster-color` VALUES (1,3,2),(2,3,4),(3,3,7),(4,3,8),(5,4,5),(6,4,4),(7,4,2),(8,4,3),(9,5,1),(10,5,7),(11,5,2),(12,6,1),(13,6,4),(14,6,2),(15,7,2),(16,7,6),(17,8,2),(18,8,1),(19,9,2),(20,9,3),(21,9,1),(22,10,2),(23,10,4),(24,10,7),(25,10,8),(26,11,2),(27,11,3),(28,11,5),(29,11,6);
/*!40000 ALTER TABLE `poster-color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster-film`
--

DROP TABLE IF EXISTS `poster-film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poster-film` (
  `poster-film_id` int unsigned NOT NULL AUTO_INCREMENT,
  `poster_id` int unsigned NOT NULL,
  `film_id` int unsigned NOT NULL,
  PRIMARY KEY (`poster-film_id`,`poster_id`,`film_id`),
  UNIQUE KEY `poster-film_id_UNIQUE` (`poster-film_id`),
  KEY `fk_poster-film_film` (`film_id`),
  KEY `fk_poster-film_poster` (`poster_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster-film`
--

LOCK TABLES `poster-film` WRITE;
/*!40000 ALTER TABLE `poster-film` DISABLE KEYS */;
INSERT INTO `poster-film` VALUES (1,3,1),(2,4,8),(3,5,2),(4,6,3),(5,7,9),(6,8,4),(7,9,5),(8,10,6),(9,11,7);
/*!40000 ALTER TABLE `poster-film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster-star`
--

DROP TABLE IF EXISTS `poster-star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poster-star` (
  `poster-star_id` int unsigned NOT NULL AUTO_INCREMENT,
  `poster_id` int unsigned NOT NULL,
  `star_id` int unsigned NOT NULL,
  PRIMARY KEY (`poster-star_id`,`poster_id`,`star_id`),
  KEY `fk_poster-star_star` (`star_id`),
  KEY `fk_poster-star_poster` (`poster_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster-star`
--

LOCK TABLES `poster-star` WRITE;
/*!40000 ALTER TABLE `poster-star` DISABLE KEYS */;
INSERT INTO `poster-star` VALUES (1,5,7),(2,5,8),(3,6,15),(4,6,16),(5,6,17),(6,6,18),(7,7,19),(8,7,20),(9,7,21),(10,7,22),(11,8,23),(12,8,24),(13,8,25),(14,8,26),(15,8,27),(16,9,30),(17,10,37),(18,10,38),(19,10,39),(20,11,44),(21,11,45),(22,11,47);
/*!40000 ALTER TABLE `poster-star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `producer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `producer_first` varchar(45) DEFAULT NULL,
  `producer_middle` varchar(45) DEFAULT NULL,
  `producer_last` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`producer_id`),
  UNIQUE KEY `producer_id_UNIQUE` (`producer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Bryan',NULL,'Foy'),(2,'W.','G.','Chalmers'),(3,'Herbert','J.','Yates'),(4,'Hal',NULL,'Willis'),(5,'Harold',NULL,'Hecht'),(6,'Bill',NULL,'Anderson'),(7,'Jack',NULL,'Cummings'),(8,'Howard',NULL,'Christie');
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productionco`
--

DROP TABLE IF EXISTS `productionco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productionco` (
  `productionco_id` int unsigned NOT NULL AUTO_INCREMENT,
  `productionco_name` varchar(100) NOT NULL,
  `ProductionImage_file` varchar(25) NOT NULL,
  `ProductionImage_location` varchar(20) NOT NULL,
  `ProductionImage_format` varchar(4) NOT NULL,
  `ProductionImage_dimensions` int DEFAULT '0',
  `ProductionImage_size` int DEFAULT '0',
  PRIMARY KEY (`productionco_id`),
  UNIQUE KEY `productionco_id_UNIQUE` (`productionco_id`),
  UNIQUE KEY `productionco_name_UNIQUE` (`productionco_name`),
  UNIQUE KEY `ProductionImage_file_UNIQUE` (`ProductionImage_file`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productionco`
--

LOCK TABLES `productionco` WRITE;
/*!40000 ALTER TABLE `productionco` DISABLE KEYS */;
INSERT INTO `productionco` VALUES (1,'Columbia Pictures Corporation','columbia.jpg','/images/production/','jpeg',0,0),(2,'Republic Pictures Corporation','republic.jpg','/images/production/','jpeg',0,0),(3,'Paramount Pictures','paramount.jpg','/images/production/','jpeg',0,0),(4,'Warner Brothers','warnerbros.jpg','/images/production/','jpeg',0,0),(5,'Norma Productions, Inc.','normaprod.jpg','/images/production/','jpeg',0,0),(6,'Walt Disney Production','disney.jpg','/images/production/','jpeg',0,0),(7,'Metro-Goldwyn-Mayer','mgm.jpg','/images/production/','jpeg',0,0),(8,'Universal-International','universal.jpg','/images/production/','jpeg',0,0);
/*!40000 ALTER TABLE `productionco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star` (
  `star_id` int unsigned NOT NULL AUTO_INCREMENT,
  `star_first` varchar(45) DEFAULT NULL,
  `star_middle` varchar(45) DEFAULT NULL,
  `star_last` varchar(45) DEFAULT NULL,
  `star_suffix` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`star_id`),
  UNIQUE KEY `star_id_UNIQUE` (`star_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` VALUES (1,'Betsy',NULL,'Palmer',NULL),(2,'Jack',NULL,'Lord',NULL),(3,'Barry',NULL,'Atwater',NULL),(4,'Lee',NULL,'Patterson',NULL),(5,'Mary',NULL,'Steel',NULL),(6,'Terry',NULL,'Dene',NULL),(7,'Fred',NULL,'MacMurray',NULL),(8,'Vera',NULL,'Ralston',NULL),(9,'Robert',NULL,'Douglas',NULL),(10,'Victor',NULL,'McLaglen',NULL),(11,'John',NULL,'Russell',NULL),(12,'Buddy',NULL,'Baer',NULL),(13,'Claude',NULL,'Jarman','Jr.'),(14,'Grant',NULL,'Withers',NULL),(15,'Joseph',NULL,'Cotton',NULL),(16,'Corinne',NULL,'Calvert',NULL),(17,'Edmund',NULL,'Gwenn',NULL),(18,'Marvin',NULL,'Miller',NULL),(19,'Frank',NULL,'Lovejoy',NULL),(20,'Richard',NULL,'Carlson',NULL),(21,'Rusty',NULL,'Tamblyn',NULL),(22,'Anita',NULL,'Louise',NULL),(23,'Don',NULL,'Murray',NULL),(24,'E.',NULL,'Marshall',NULL),(25,'Jack',NULL,'Warden',NULL),(26,'Phil',NULL,'Abbott',NULL),(27,'Larry',NULL,'Blyden',NULL),(28,'Patricia',NULL,'Smith',NULL),(29,'Carolyn',NULL,'Jones',NULL),(30,'Dorothy',NULL,'McGuire',NULL),(31,'Fess',NULL,'Parker',NULL),(32,'Jeff',NULL,'York',NULL),(33,'Tommy',NULL,'Kirk',NULL),(34,'Kevin',NULL,'Corcoran',NULL),(35,'Beverly',NULL,'Washburn',NULL),(36,'Chuck',NULL,'Connors',NULL),(37,'Kathryn',NULL,'Grayson',NULL),(38,'Howard',NULL,'Keel',NULL),(39,'Ann',NULL,'Miller',NULL),(40,'Keenan',NULL,'Wynn',NULL),(41,'Bobby',NULL,'Van',NULL),(42,'James',NULL,'Whitmore',NULL),(43,'Kurt',NULL,'Kasznar',NULL),(44,'Tony',NULL,'Curtis',NULL),(45,'Colleen',NULL,'Miller',NULL),(46,'Gene',NULL,'Barry',NULL),(47,'Dan',NULL,'O\'Herlihy',NULL),(48,'Angela',NULL,'Lansbury',NULL),(49,'George',NULL,'Dolenz',NULL),(50,'John',NULL,'Hoyt',NULL);
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `style` (
  `style_id` int unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(50) NOT NULL,
  `style_description` text,
  PRIMARY KEY (`style_id`),
  UNIQUE KEY `style_id_UNIQUE` (`style_id`),
  UNIQUE KEY `style_name_UNIQUE` (`style_name`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (13,'Photographic','The key art (main graphic) is based on a photographic image.'),(12,'Illustrated','The key art (main graphic) has the appearance of being drawn and colored.');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typo`
--

DROP TABLE IF EXISTS `typo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typo` (
  `typo_id` int unsigned NOT NULL AUTO_INCREMENT,
  `typo_name` varchar(20) NOT NULL,
  `typo_category` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`typo_id`),
  UNIQUE KEY `typo_id_UNIQUE` (`typo_id`),
  UNIQUE KEY `typo_name_UNIQUE` (`typo_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typo`
--

LOCK TABLES `typo` WRITE;
/*!40000 ALTER TABLE `typo` DISABLE KEYS */;
INSERT INTO `typo` VALUES (1,'San Serif',NULL),(2,'Serif',NULL);
/*!40000 ALTER TABLE `typo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-06 22:03:47
