-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: empreiteira
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colaborador` (
  `id_colaborador` int NOT NULL AUTO_INCREMENT,
  `funcao` varchar(25) DEFAULT NULL,
  `matricula` varchar(20) NOT NULL,
  `salario` decimal(8,2) DEFAULT NULL,
  `tipo_contrato` varchar(15) NOT NULL,
  `situacao` char(1) NOT NULL,
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_colaborador`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `colaborador_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador`
--

LOCK TABLES `colaborador` WRITE;
/*!40000 ALTER TABLE `colaborador` DISABLE KEYS */;
INSERT INTO `colaborador` VALUES (1,'Pedreiro','MTR001',2500.00,'CLT','A',1),(2,'Arquiteta','MTR002',3500.00,'CLT','A',2),(3,'Técnico de Segurança','MTR003',2800.00,'CLT','A',3),(4,'Arquiteta','MTR004',3600.00,'CLT','A',4),(5,'Gerente de Projetos','MTR005',4000.00,'CLT','A',5),(6,'Ajudante','MTR006',2000.00,'CLT','A',6),(7,'Mestre de Obras','MTR007',3200.00,'CLT','A',7),(8,'Assistente Administrativo','MTR008',2200.00,'CLT','A',8),(9,'Supervisor de Obras','MTR009',3700.00,'CLT','A',9),(10,'Designer de Interiores','MTR010',3300.00,'CLT','A',10);
/*!40000 ALTER TABLE `colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empreiteira`
--

DROP TABLE IF EXISTS `empreiteira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empreiteira` (
  `id_empreiteira` int NOT NULL AUTO_INCREMENT,
  `area_atuacao` varchar(25) DEFAULT NULL,
  `tipo_contrato` varchar(20) DEFAULT NULL,
  `situacao` char(1) NOT NULL,
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_empreiteira`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `empreiteira_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empreiteira`
--

LOCK TABLES `empreiteira` WRITE;
/*!40000 ALTER TABLE `empreiteira` DISABLE KEYS */;
INSERT INTO `empreiteira` VALUES (1,'Construção Civil','CLT','A',11),(2,'Engenharia','CLT','A',12),(3,'Reformas e Manutenção','CLT','A',13),(4,'Obras Públicas','CLT','A',14),(5,'Construção Residencial','CLT','A',15);
/*!40000 ALTER TABLE `empreiteira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `rua` varchar(35) DEFAULT NULL,
  `cidade` varchar(20) NOT NULL,
  `uf` char(2) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `cep` char(9) DEFAULT NULL,
  `situacao` char(1) NOT NULL,
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Rua das Flores','São Paulo','SP','Jardim das Rosas','01234-567','A',1),(2,'Avenida Paulista','São Paulo','SP','Bela Vista','01310-000','A',2),(3,'Rua da Independência','São Paulo','SP','Centro','01045-678','A',3),(4,'Rua das Acácias','São Paulo','SP','Vila Mariana','04100-000','A',4),(5,'Avenida Brigadeiro Faria Lima','São Paulo','SP','Itaim Bibi','01452-000','A',5),(6,'Rua dos Curiós','São Paulo','SP','Lapa','05060-000','A',6),(7,'Rua São Vicente','São Paulo','SP','Vila Madalena','05410-000','A',7),(8,'Rua dos Três Irmãos','São Paulo','SP','Pinheiros','05422-000','A',8),(9,'Rua da Esperança','São Paulo','SP','Mooca','03170-000','A',9),(10,'Rua do Comércio','São Paulo','SP','Bom Retiro','01140-000','A',10),(11,'Rua dos Trabalhadores','São Paulo','SP','Vila Leopoldina','05023-000','A',11),(12,'Avenida dos Negócios','São Paulo','SP','Centro','01314-000','A',12),(13,'Rua da Engenharia','São Paulo','SP','Vila Maria','02090-000','A',13),(14,'Rua das Obras','São Paulo','SP','Itaquera','08280-000','A',14),(15,'Avenida da Construção','São Paulo','SP','Bela Vista','01320-000','A',15);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obra`
--

DROP TABLE IF EXISTS `obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra` (
  `id_obra` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `data_inicio` date NOT NULL,
  `previsao` varchar(15) DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `id_empreiteira` int NOT NULL,
  `id_projeto` int NOT NULL,
  `id_colaborador` int NOT NULL,
  PRIMARY KEY (`id_obra`),
  KEY `id_empreiteira` (`id_empreiteira`),
  KEY `id_projeto` (`id_projeto`),
  KEY `id_colaborador` (`id_colaborador`),
  CONSTRAINT `obra_ibfk_1` FOREIGN KEY (`id_empreiteira`) REFERENCES `empreiteira` (`id_empreiteira`),
  CONSTRAINT `obra_ibfk_2` FOREIGN KEY (`id_projeto`) REFERENCES `projeto` (`id_projeto`),
  CONSTRAINT `obra_ibfk_3` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra`
--

LOCK TABLES `obra` WRITE;
/*!40000 ALTER TABLE `obra` DISABLE KEYS */;
INSERT INTO `obra` VALUES (1,150000.00,'2024-01-01','2024-06-30','2024-07-15','Em Andamento',1,1,5),(2,200000.00,'2024-02-01','2024-07-31','2024-08-15','Planejado',2,2,2),(3,300000.00,'2024-03-01','2024-12-15','2025-01-15','Planejado',4,3,4),(4,180000.00,'2024-02-15','2024-09-30','2024-10-15','Em Andamento',1,4,1),(5,120000.00,'2024-03-15','2024-10-30','2024-11-15','Planejado',3,4,6),(6,250000.00,'2024-04-01','2024-08-15','2024-09-30','Em Andamento',2,1,7);
/*!40000 ALTER TABLE `obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `id_pessoa` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `cnpj_cpf` varchar(18) NOT NULL,
  `nome_fantasia` varchar(40) DEFAULT NULL,
  `telefone` varchar(16) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `situacao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'João da Silva','123.456.789-00','João Construções','(11) 98765-4321','joao.silva@construcao.com','Ativo'),(2,'Maria Oliveira','234.567.890-11','Maria Engenharia','(11) 97654-3210','maria.oliveira@engenharia.com','Ativo'),(3,'Carlos Pereira','345.678.901-22','Carlos Reformas','(11) 96543-2109','carlos.pereira@reformas.com','Ativo'),(4,'Ana Souza','456.789.012-33','Ana Projetos','(11) 95432-1098','ana.souza@projetos.com','Ativo'),(5,'Pedro Santos','567.890.123-44','Pedro Construção','(11) 94321-0987','pedro.santos@construcao.com','Ativo'),(6,'Juliana Lima','678.901.234-55','Juliana Obras','(11) 93210-9876','juliana.lima@obras.com','Ativo'),(7,'Roberto Costa','789.012.345-66','Roberto Arquitetura','(11) 92109-8765','roberto.costa@arquitetura.com','Ativo'),(8,'Fernanda Alves','890.123.456-77','Fernanda Construção','(11) 91098-7654','fernanda.alves@construcao.com','Ativo'),(9,'Marcos Lima','901.234.567-88','Marcos Projetos','(11) 90987-6543','marcos.lima@projetos.com','Ativo'),(10,'Tatiane Rocha','012.345.678-99','Tatiane Engenharia','(11) 89876-5432','tatiane.rocha@engenharia.com','Ativo'),(11,'Construtora A','12.345.678/0001-90','A Construções LTDA','(11) 3000-0001','contato@construtoraA.com','Ativo'),(12,'Construtora B','23.456.789/0001-01','B Engenharia S/A','(11) 3000-0002','contato@construtoraB.com','Ativo'),(13,'Construtora C','34.567.890/0001-12','C Reformas ME','(11) 3000-0003','contato@construtoraC.com','Ativo'),(14,'Construtora D','45.678.901/0001-23','D Obras LTDA','(11) 3000-0004','contato@construtoraD.com','Ativo'),(15,'Construtora E','56.789.012/0001-34','E Engenharia S/A','(11) 3000-0005','contato@construtoraE.com','Ativo');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `id_projeto` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `tipo_projeto` varchar(15) NOT NULL,
  `nome_projeto` varchar(35) DEFAULT NULL,
  `data_inicio` date NOT NULL,
  `previsao` varchar(20) DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `id_colaborador` int NOT NULL,
  PRIMARY KEY (`id_projeto`),
  KEY `id_colaborador` (`id_colaborador`),
  CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,150000.00,'Residencial','Construção de Residência A','2024-01-01','2024-06-30','2024-07-15','Em Andamento',5),(2,200000.00,'Comercial','Reforma do Prédio B','2024-02-01','2024-07-31','2024-08-15','Planejado',2),(3,300000.00,'Público','Construção de Escola C','2024-03-01','2024-12-15','2025-01-15','Planejado',4),(4,180000.00,'Comercial','Construção de Loja D','2024-02-15','2024-09-30','2024-10-15','Em Andamento',5);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-16 18:53:30
