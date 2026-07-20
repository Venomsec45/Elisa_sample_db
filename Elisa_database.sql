-- MySQL dump 10.13  Distrib 9.6.0, for macos26.4 (arm64)
--
-- Host: localhost    Database: Elisa_db_backup
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '0db555ee-049e-11f0-8e1d-c32e9d89d48f:1-9974';

--
-- Table structure for table `admissions`
--

DROP TABLE IF EXISTS `admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `payment_id` int DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `country_id` varchar(45) DEFAULT NULL,
  `admission_date` varchar(45) NOT NULL,
  `release_date` varchar(45) DEFAULT '"Unknown"',
  `diagnosis` varchar(45) DEFAULT NULL,
  `urgency_rate` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admissions`
--

LOCK TABLES `admissions` WRITE;
/*!40000 ALTER TABLE `admissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('ID','Indonesia'),('FR','France'),('RU','Russia'),('GR','Greece'),('CN','China'),('NP','Nepal'),('PH','Philippines'),('TH','Thailand'),('PL','Poland'),('KP','North Korea'),('AM','Armenia'),('CU','Cuba'),('PT','Portugal'),('NG','Nigeria'),('SV','El Salvador'),('IR','Iran'),('AF','Afghanistan'),('TZ','Tanzania'),('TL','East Timor'),('UA','Ukraine'),('EE','Estonia'),('CZ','Czech Republic'),('EG','Egypt'),('DO','Dominican Republic'),('VE','Venezuela'),('SE','Sweden'),('HR','Croatia'),('US','United States'),('CO','Colombia'),('PE','Peru'),('NL','Netherlands'),('JP','Japan'),('NZ','New Zealand'),('MG','Madagascar'),('VN','Vietnam'),('LK','Sri Lanka'),('SY','Syria'),('CA','Canada'),('CM','Cameroon');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL,
  `department` varchar(45) DEFAULT NULL,
  UNIQUE KEY `department_id_UNIQUE` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Business Development'),(2,'Support'),(3,'Marketing'),(4,'Legal'),(5,'Security'),(6,'Human Resources'),(7,'Engineering'),(8,'Technical'),(9,'Nurse'),(10,'Laboratory'),(11,'Cleaning'),(12,'Accounting'),(13,'Sales'),(14,'Training'),(15,'Cafeteria'),(16,'Transportation');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `doctor_id` int DEFAULT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `specialization` varchar(80) DEFAULT NULL,
  `hire_date` varchar(80) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `contact_number` bigint DEFAULT NULL,
  `attended_admissions_num` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Rosco','Mylan','Cardiologist','8/22/2024',29,4690663007,16),(2,'Corinna','Goldstraw','Dentist','9/17/2021',53,7290692153,5),(3,'Judie','Farndon','Allergist','12/17/2025',27,3573075865,5),(4,'Frayda','Corthes','Psychologist','2/11/2022',30,7775500711,13),(5,'Orrin','McNellis','Pediatrician','9/26/2024',34,6728043698,3),(6,'Jolynn','Fairy','Radiologist','8/15/2021',28,3945714971,13),(7,'Der','MacGrath','Neurologist','6/28/2020',55,3012407902,14),(8,'Konrad','Sollas','Optalmologist','12/15/2021',60,7187758943,15),(9,'Georgena','Lovekin','Nephralmologist','4/26/2024',43,2646864232,15),(10,'Katie','Maypole','Pulmonologist','10/6/2024',44,2350413636,2),(11,'Tonnie','Mitchel','Gastroenterologist','4/18/2019',28,6262319627,1),(12,'Crin','Balch','Endocrinologist','4/4/2024',28,6818825431,6),(13,'Peta','Provis','Obstetrician','7/12/2022',34,4127540176,4),(14,'Dinny','Bartelet','Dermatologist','6/26/2018',44,3181658655,11),(15,'Abagail','Muttock','Neonatologist','4/10/2020',49,7280097782,19),(16,'Baxter','Barbery','Surgeon','8/6/2025',37,4617965460,11);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `medicine_id` int NOT NULL,
  `medicine` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`medicine_id`),
  UNIQUE KEY `medicine_id_UNIQUE` (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (1,'Paracetamol'),(2,'Ibuprofen'),(3,'Amoxicillin'),(4,'Metformin'),(5,'Omeprazole'),(6,'Amlodipine'),(7,'Losartan'),(8,'Atorvastatin'),(9,'Cetirizine'),(10,'Loratadine'),(11,'Azithromycin'),(12,'Ciprofloxacin'),(13,'Doxycycline'),(14,'Clindamycin'),(15,'Cephalexin'),(16,'Prednisone'),(17,'Hydrocortisone'),(18,'Salbutamol'),(19,'Montelukast'),(20,'Insulin'),(21,'Aspirin'),(22,'Diclofenac'),(23,'Naproxen'),(24,'Mefenamic Acid'),(25,'Tramadol'),(26,'Codeine'),(27,'Morphine'),(28,'Lisinopril'),(29,'Enalapril'),(30,'Captopril'),(31,'Valsartan'),(32,'Telmisartan'),(33,'Hydrochlorothiazide'),(34,'Furosemide'),(35,'Spironolactone'),(36,'Carvedilol'),(37,'Bisoprolol'),(38,'Propranolol'),(39,'Simvastatin'),(40,'Rosuvastatin'),(41,'Fenofibrate'),(42,'Glimepiride'),(43,'Gliclazide'),(44,'Pioglitazone'),(45,'Sitagliptin'),(46,'Empagliflozin'),(47,'Linagliptin'),(48,'Pantoprazole'),(49,'Esomeprazole'),(50,'Rabeprazole'),(51,'Domperidone'),(52,'Metoclopramide'),(53,'Ondansetron'),(54,'Loperamide'),(55,'Lactulose'),(56,'Magnesium Hydroxide'),(57,'Aluminum Hydroxide'),(58,'Calcium Carbonate'),(59,'Ranitidine'),(60,'Famotidine'),(61,'Levothyroxine'),(62,'Methimazole'),(63,'Propylthiouracil'),(64,'Allopurinol'),(65,'Colchicine'),(66,'Febuxostat'),(67,'Alendronate'),(68,'Calcitriol'),(69,'Calcium Citrate'),(70,'Vitamin D3'),(71,'Ferrous Sulfate'),(72,'Folic Acid'),(73,'Vitamin B12'),(74,'Ascorbic Acid'),(75,'Multivitamins'),(76,'Zinc Sulfate'),(77,'Potassium Chloride'),(78,'Magnesium Sulfate'),(79,'Sodium Bicarbonate'),(80,'Clopidogrel'),(81,'Warfarin'),(82,'Heparin'),(83,'Enoxaparin'),(84,'Apixaban'),(85,'Rivaroxaban'),(86,'Nitroglycerin'),(87,'Isosorbide Mononitrate'),(88,'Digoxin'),(89,'Amiodarone'),(90,'Verapamil'),(91,'Diltiazem'),(92,'Nifedipine'),(93,'Clonidine'),(94,'Hydralazine'),(95,'Methyldopa'),(96,'Terbutaline'),(97,'Budesonide'),(98,'Fluticasone'),(99,'Beclomethasone'),(100,'Ipratropium Bromide');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `birthday` varchar(45) NOT NULL,
  `contact_number` bigint DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `temperature` decimal(2,0) DEFAULT NULL,
  `laboratory_test` varchar(45) DEFAULT NULL,
  UNIQUE KEY `patient_id_UNIQUE` (`patient_id`),
  KEY `first_name_idx` (`first_name`),
  KEY `last_name_idx` (`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `payment_method` varchar(45) DEFAULT NULL,
  `paid_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_id_UNIQUE` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int DEFAULT NULL,
  `first_name` varchar(512) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `contact_number` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Rikki','Malins',3,27,'rmalins0@bravesites.com',5447222354),(2,'Tomasina','Dulinty',7,33,'tdulinty1@ocn.ne.jp',6205593474),(3,'Matilda','Sewards',1,36,'msewards2@netvibes.com',7642006853),(4,'Shaine','Maskill',13,29,'smaskill3@gizmodo.com',7287269382),(5,'Ralph','Zanicchi',1,33,'rzanicchi4@merriam-webster.com',5365301338),(6,'Ole','Hadwin',6,33,'ohadwin5@bravesites.com',6917120608),(7,'Christophe','Sangwin',6,50,'csangwin6@mail.ru',7332663240),(8,'Chelsey','Rowcliffe',10,47,'crowcliffe7@baidu.com',6213747211),(9,'Giacinta','Keynes',4,42,'gkeynes8@npr.org',5216064496),(10,'Melina','Itzik',4,41,'mitzik9@imageshack.us',6510800604),(11,'Deedee','Shambroke',13,45,'dshambrokea@elegantthemes.com',7856430125),(12,'Francisco','Tuttiett',3,46,'ftuttiettb@ft.com',5195144427),(13,'Kenton','Trounson',10,38,'ktrounsonc@google.ca',7979568584),(14,'Concordia','Fazakerley',1,50,'cfazakerleyd@google.de',5951555511),(15,'Gery','Freyne',4,49,'gfreynee@tiny.cc',4874500763),(16,'Marinna','Bonifazio',5,49,'mbonifaziof@businessinsider.com',3307816250),(17,'Giacomo','Szymanowski',5,25,'gszymanowskig@time.com',7095044145),(18,'Stan','Francomb',15,34,'sfrancombh@mail.ru',4867018989),(19,'Averell','Moyes',10,35,'amoyesi@e-recht24.de',6536557616),(20,'Danell','Klimashevich',14,26,'dklimashevichj@wiley.com',5741935246),(21,'Malanie','Bramsom',12,48,'mbramsomk@independent.co.uk',7537424082),(22,'Noll','Brack',8,34,'nbrackl@admin.ch',7117293764),(23,'Quintilla','Gaskin',2,46,'qgaskinm@harvard.edu',5023235090),(24,'Wake','Ninnis',14,42,'wninnisn@fc2.com',5633007247),(25,'Gayle','Coggon',2,50,'gcoggono@hp.com',6215016777),(26,'Lenore','Parffrey',6,44,'lparffreyp@psu.edu',5725391012),(27,'Rae','Eicheler',14,47,'reichelerq@dagondesign.com',3687929499),(28,'Norby','Fairham',16,28,'nfairhamr@csmonitor.com',4103880971),(29,'Hieronymus','Robben',15,36,'hrobbens@hp.com',6020351530),(30,'Stesha','Craggs',7,50,'scraggst@cam.ac.uk',6564334833),(31,'Eustacia','Dibble',16,37,'edibbleu@networkadvertising.org',3586870285),(32,'Giovanni','Grigoroni',16,42,'ggrigoroniv@reddit.com',5178604200),(33,'Tandie','Scheffel',14,35,'tscheffelw@reverbnation.com',5096744312),(34,'Aloisia','Devanney',6,37,'adevanneyx@pbs.org',3696326060),(35,'Raven','Reddington',7,49,'rreddingtony@sitemeter.com',7750906231),(36,'Giraud','Tugman',10,39,'gtugmanz@netscape.com',3951111592),(37,'Merrick','McIlriach',11,32,'mmcilriach10@fotki.com',6270341497),(38,'Odey','Bunclark',1,32,'obunclark11@blogspot.com',5715365620),(39,'Concordia','Lawrie',9,25,'clawrie12@hibu.com',7999276495),(40,'Flore','Casillas',8,41,'fcasillas13@goo.ne.jp',4032696770),(41,'Enrique','Sneath',11,25,'esneath14@apple.com',6060007627),(42,'Randie','Columbine',7,32,'rcolumbine15@dyndns.org',4123852482),(43,'Laverna','Proffitt',1,31,'lproffitt16@elegantthemes.com',7017722241),(44,'Cobby','Versey',10,32,'cversey17@loc.gov',4288605098),(45,'Grover','Abrahams',12,30,'gabrahams18@squidoo.com',5576234348),(46,'Sibylla','Pelling',1,26,'spelling19@addtoany.com',3204818336),(47,'Mathe','Gunnell',8,32,'mgunnell1a@ifeng.com',3046817267),(48,'Beverlie','Brayshay',14,47,'bbrayshay1b@webmd.com',6239485563),(49,'Felita','Iacofo',15,37,'fiacofo1c@intel.com',3674772951),(50,'Rae','Bowman',3,39,'rbowman1d@yellowpages.com',5833662702),(51,'Nickolas','Besson',13,34,'nbesson1e@seesaa.net',6904889967),(52,'Ricky','Pretor',5,29,'rpretor1f@si.edu',4204156426),(53,'Cthrine','Blakes',3,32,'cblakes1g@who.int',4298793100),(54,'Jae','Teffrey',6,26,'jteffrey1h@google.co.jp',6504467145),(55,'Dallas','Wontner',11,47,'dwontner1i@dmoz.org',7156652763),(56,'Germain','Nell',12,46,'gnell1j@mozilla.org',5425874403),(57,'Randie','Burchill',10,43,'rburchill1k@webmd.com',6347203069),(58,'Emmerich','Leahy',12,35,'eoleahy1l@creativecommons.org',4128512695),(59,'Alonso','Klosterman',8,26,'aklosterman1m@bloglovin.com',3230318737),(60,'Kippy','Boddie',12,25,'kboddie1n@liveinternet.ru',3956611861),(61,'Ernestine','Sapey',11,42,'esapey1o@abc.net.au',3219862075),(62,'Junie','Spirritt',14,38,'jspirritt1p@imdb.com',5840610546),(63,'Teodorico','Mowsdill',1,38,'tmowsdill1q@adobe.com',5746521677),(64,'Sander','Lambal',13,45,'slambal1r@smugmug.com',3661696482),(65,'Wylma','Reay',7,32,'wreay1s@ustream.tv',4487947896),(66,'Violetta','Barlee',8,25,'vbarlee1t@dell.com',6161768680),(67,'Bryna','Mountney',15,39,'bmountney1u@toplist.cz',6407071335),(68,'Daffie','Arckoll',12,44,'darckoll1v@cocolog-nifty.com',7495685383),(69,'Tatiana','Spinas',6,44,'tspinas1w@mtv.com',4167428797),(70,'Yetty','Abrahart',15,35,'yabrahart1x@cdc.gov',4967387490),(71,'Rustie','Eacott',8,48,'reacott1y@ucsd.edu',6321745658),(72,'Hana','Lebbon',14,35,'hlebbon1z@spotify.com',3749631376),(73,'Hussein','Baudon',16,47,'hbaudon20@elegantthemes.com',3463276514),(74,'Sigismond','Rimington',4,33,'srimington21@hubpages.com',7356802482),(75,'Adeline','Ahlf',16,42,'aahlf22@imdb.com',6492093862),(76,'Catie','Itscowicz',5,38,'citscowicz23@census.gov',3256130842),(77,'Celine','Spry',9,37,'cspry24@macromedia.com',6432573696),(78,'Carter','Poure',7,48,'cpoure25@nba.com',5064836009),(79,'Florette','Hughes',6,31,'fhughes26@comsenz.com',7842158792),(80,'Lavinia','Kondratyuk',4,37,'lkondratyuk27@purevolume.com',6000662462),(81,'Ethelbert','Coyne',4,47,'ecoyne28@mapquest.com',4383829073),(82,'Candy','Devo',7,48,'cdevo29@godaddy.com',6567643828),(83,'Nickolaus','Paradin',10,38,'nparadin2a@nsw.gov.au',5921855418),(84,'Adrian','Varker',10,40,'avarker2b@about.com',6392724110),(85,'Dilly','Asel',4,49,'dasel2c@blinklist.com',4767524883),(86,'Antonia','Lavalde',5,31,'alavalde2d@apache.org',6356261516),(87,'Umberto','Duddell',9,28,'ududdell2e@devhub.com',7392328463),(88,'Jock','Alflatt',12,27,'jalflatt2f@cargocollective.com',4886716176),(89,'Terri','Minshall',11,35,'tminshall2g@un.org',7712070172),(90,'Burnaby','Burgess',8,28,'bburgess2h@cbslocal.com',7631089141),(91,'Ema','Vasenin',11,26,'evasenin2i@oakley.com',6595378403),(92,'Orlan','Kimpton',8,49,'okimpton2j@webs.com',6379933404),(93,'Ted','Urquhart',6,29,'turquhart2k@meetup.com',6699331627),(94,'Trumann','Sergean',15,25,'tsergean2l@mashable.com',3058697169),(95,'Steffane','Crinson',14,36,'scrinson2m@businessweek.com',4766277441),(96,'Agata','Rockingham',15,41,'arockingham2n@illinois.edu',6473660970),(97,'Delmor','Dyshart',4,34,'ddyshart2o@chronoengine.com',3273560619),(98,'Lorrayne','Ridgewell',10,50,'lridgewell2p@redcross.org',4016745709),(99,'Sherwood','Keaysell',16,34,'skeaysell2q@skyrock.com',6606844329),(100,'Friedrick','Puddephatt',12,31,'fpuddephatt2r@arizona.edu',5147991607),(101,'Lucien','Tredgold',12,40,'ltredgold2s@blinklist.com',6333705181),(102,'Briney','Burgin',5,25,'bburgin2t@usa.gov',4808633439),(103,'Joana','Rowthorn',12,25,'jrowthorn2u@jalbum.net',5417134085),(104,'Conn','Van Der Walt',4,30,'cvanderwalt2v@rakuten.co.jp',6633154339),(105,'Gisele','Sheaf',2,29,'gsheaf2w@foxnews.com',4916124717),(106,'Annice','McGlue',1,38,'amcglue2x@microsoft.com',7937191413),(107,'Kristien','Cearley',6,36,'kcearley2y@oakley.com',7408422146),(108,'Willard','Gianneschi',8,45,'wgianneschi2z@imdb.com',4447752406),(109,'Josselyn','Beisley',9,44,'jbeisley30@jimdo.com',7314711047),(110,'Augie','Suffield',10,39,'asuffield31@wisc.edu',4772278256),(111,'Fey','McCluskey',15,49,'fmccluskey32@census.gov',7464453812),(112,'Lyn','Harcus',10,31,'lharcus33@wix.com',7957761932),(113,'Maurie','Eadon',11,33,'meadon34@un.org',6588190850),(114,'Scotti','Hinks',1,31,'shinks35@ehow.com',4615743032),(115,'Sampson','Brindle',8,49,'sbrindle36@timesonline.co.uk',5598956220),(116,'Reinald','Jozwik',9,34,'rjozwik37@furl.net',7326496815),(117,'Betteann','Cornau',1,41,'bcornau38@msu.edu',5010326161),(118,'Barret','Urpeth',2,42,'burpeth39@drupal.org',3380457353),(119,'Georas','Ready',6,45,'gready3a@jiathis.com',4240442179),(120,'Linette','Garthside',9,43,'lgarthside3b@t.co',4160737381),(121,'Huntington','Ivanovic',16,35,'hivanovic3c@tinyurl.com',3633575297),(122,'Cornelle','Marcone',6,39,'cmarcone3d@nyu.edu',3813745349),(123,'Dick','Tytherton',15,36,'dtytherton3e@shareasale.com',6117138144),(124,'Thurstan','Marchand',15,32,'tmarchand3f@dropbox.com',4394644879),(125,'Budd','Mosedill',7,48,'bmosedill3g@vk.com',5997159992),(126,'Tonye','MacIlhagga',12,32,'tmacilhagga3h@shareasale.com',5078606196),(127,'Francisco','Simcox',1,42,'fsimcox3i@yolasite.com',4952306273),(128,'Marina','Ambrogelli',1,36,'mambrogelli3j@bloglines.com',5426891774);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-20 16:53:51
