-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.22-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para aula_1
CREATE DATABASE IF NOT EXISTS `aula_1` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `aula_1`;

-- Copiando estrutura para tabela aula_1.alunos
CREATE TABLE IF NOT EXISTS `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `contato` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela aula_1.alunos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` (`id`, `nome`, `contato`) VALUES
	(1, 'FACEBOOKSON', '(19)99999-9988'),
	(2, 'WEBSON', '(19)98719-9458'),
	(3, 'MARIA DO BAIRRO', '(19)97711-1354');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;

-- Copiando estrutura para tabela aula_1.disciplinas
CREATE TABLE IF NOT EXISTS `disciplinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `cargahoraria` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela aula_1.disciplinas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
INSERT INTO `disciplinas` (`id`, `nome`, `cargahoraria`) VALUES
	(1, 'BANCO DE DADOS', 80),
	(2, 'MATEMATICA', 80),
	(3, 'DESENVOLVIMENTO WEB', 80);
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;

-- Copiando estrutura para tabela aula_1.historico
CREATE TABLE IF NOT EXISTS `historico` (
  `idAluno` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL,
  `frequencia` decimal(10,2) NOT NULL,
  `mediafinal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idAluno`,`idDisciplina`),
  KEY `idDisciplina` (`idDisciplina`),
  CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`idAluno`) REFERENCES `alunos` (`id`),
  CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplinas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela aula_1.historico: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` (`idAluno`, `idDisciplina`, `frequencia`, `mediafinal`) VALUES
	(1, 1, 78.00, 8.00),
	(1, 2, 100.00, 9.00),
	(1, 3, 100.00, 10.00),
	(2, 1, 100.00, 10.00),
	(2, 2, 100.00, 8.00),
	(2, 3, 99.00, 7.50),
	(3, 1, 85.00, 8.80),
	(3, 2, 95.00, 5.50),
	(3, 3, 100.00, 9.00);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
