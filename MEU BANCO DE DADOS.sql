-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.24-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para atividade_1
CREATE DATABASE IF NOT EXISTS `atividade_1` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `atividade_1`;

-- Copiando estrutura para tabela atividade_1.cargos
CREATE TABLE IF NOT EXISTS `cargos` (
  `idCargos` int(11) NOT NULL,
  `descricao` varchar(60) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idCargos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela atividade_1.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id`) REFERENCES `cargos` (`idCargos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura do banco de dados para aula_1
CREATE DATABASE IF NOT EXISTS `aula_1` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `aula_1`;

-- Copiando estrutura para tabela aula_1.alunos
CREATE TABLE IF NOT EXISTS `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `contato` varchar(15) NOT NULL,
  `sobrenome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela aula_1.disciplinas
CREATE TABLE IF NOT EXISTS `disciplinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `cargahoraria` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.


-- Copiando estrutura do banco de dados para empresa2
CREATE DATABASE IF NOT EXISTS `empresa2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `empresa2`;

-- Copiando estrutura para tabela empresa2.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela empresa2.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(40) NOT NULL,
  `municipio` varchar(40) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `estado` char(2) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `idrepresentante` int(11) NOT NULL,
  `idregiao` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FRK_CLIENTE_REPRESENTANTE` (`idrepresentante`),
  KEY `FRK_CLIENTE_REGIAO` (`idregiao`),
  CONSTRAINT `FRK_CLIENTE_REGIAO` FOREIGN KEY (`idregiao`) REFERENCES `regiao` (`id`),
  CONSTRAINT `FRK_CLIENTE_REPRESENTANTE` FOREIGN KEY (`idrepresentante`) REFERENCES `representante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela empresa2.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela empresa2.empregado
CREATE TABLE IF NOT EXISTS `empregado` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(40) NOT NULL,
  `municipio` varchar(40) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `pais` varchar(40) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `escolaridade` int(11) NOT NULL,
  `cargo` varchar(40) NOT NULL,
  `salario` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela empresa2.formapagto
CREATE TABLE IF NOT EXISTS `formapagto` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela empresa2.item
CREATE TABLE IF NOT EXISTS `item` (
  `idpedido` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `precounitario` decimal(10,3) NOT NULL,
  PRIMARY KEY (`idpedido`,`idproduto`),
  KEY `FRK_ITENS_PRODUTO` (`idproduto`),
  CONSTRAINT `FRK_ITENS_PEDIDO` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FRK_ITENS_PRODUTO` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela empresa2.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `datemissao` date NOT NULL,
  `datentrega` date DEFAULT NULL,
  `idformapagto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FRK_PEDIDO_CLIENTE` (`idcliente`),
  KEY `FRK_PEDIDO_FORMAPAGTO` (`idformapagto`),
  CONSTRAINT `FRK_PEDIDO_CLIENTE` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FRK_PEDIDO_FORMAPAGTO` FOREIGN KEY (`idformapagto`) REFERENCES `formapagto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela empresa2.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  `precodecompra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precodevenda` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estoque` decimal(10,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela empresa2.regiao
CREATE TABLE IF NOT EXISTS `regiao` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `estado` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela empresa2.representante
CREATE TABLE IF NOT EXISTS `representante` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(40) NOT NULL,
  `municipio` varchar(40) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura do banco de dados para information_schema
CREATE DATABASE IF NOT EXISTS `information_schema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `information_schema`;

-- Copiando estrutura para tabela information_schema.ALL_PLUGINS
CREATE TEMPORARY TABLE IF NOT EXISTS `ALL_PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL,
  `PLUGIN_VERSION` varchar(20) NOT NULL,
  `PLUGIN_STATUS` varchar(16) NOT NULL,
  `PLUGIN_TYPE` varchar(80) NOT NULL,
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL,
  `PLUGIN_LIBRARY` varchar(64),
  `PLUGIN_LIBRARY_VERSION` varchar(20),
  `PLUGIN_AUTHOR` varchar(64),
  `PLUGIN_DESCRIPTION` longtext,
  `PLUGIN_LICENSE` varchar(80) NOT NULL,
  `LOAD_OPTION` varchar(64) NOT NULL,
  `PLUGIN_MATURITY` varchar(12) NOT NULL,
  `PLUGIN_AUTH_VERSION` varchar(80)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.APPLICABLE_ROLES
CREATE TEMPORARY TABLE IF NOT EXISTS `APPLICABLE_ROLES` (
  `GRANTEE` varchar(190) NOT NULL,
  `ROLE_NAME` varchar(128) NOT NULL,
  `IS_GRANTABLE` varchar(3) NOT NULL,
  `IS_DEFAULT` varchar(3)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.CHARACTER_SETS
CREATE TEMPORARY TABLE IF NOT EXISTS `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(32) NOT NULL,
  `DEFAULT_COLLATE_NAME` varchar(32) NOT NULL,
  `DESCRIPTION` varchar(60) NOT NULL,
  `MAXLEN` bigint(3) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.CHECK_CONSTRAINTS
CREATE TEMPORARY TABLE IF NOT EXISTS `CHECK_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `CONSTRAINT_NAME` varchar(64) NOT NULL,
  `CHECK_CLAUSE` longtext NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.CLIENT_STATISTICS
CREATE TEMPORARY TABLE IF NOT EXISTS `CLIENT_STATISTICS` (
  `CLIENT` varchar(64) NOT NULL,
  `TOTAL_CONNECTIONS` bigint(21) NOT NULL,
  `CONCURRENT_CONNECTIONS` bigint(21) NOT NULL,
  `CONNECTED_TIME` bigint(21) NOT NULL,
  `BUSY_TIME` double NOT NULL,
  `CPU_TIME` double NOT NULL,
  `BYTES_RECEIVED` bigint(21) NOT NULL,
  `BYTES_SENT` bigint(21) NOT NULL,
  `BINLOG_BYTES_WRITTEN` bigint(21) NOT NULL,
  `ROWS_READ` bigint(21) NOT NULL,
  `ROWS_SENT` bigint(21) NOT NULL,
  `ROWS_DELETED` bigint(21) NOT NULL,
  `ROWS_INSERTED` bigint(21) NOT NULL,
  `ROWS_UPDATED` bigint(21) NOT NULL,
  `SELECT_COMMANDS` bigint(21) NOT NULL,
  `UPDATE_COMMANDS` bigint(21) NOT NULL,
  `OTHER_COMMANDS` bigint(21) NOT NULL,
  `COMMIT_TRANSACTIONS` bigint(21) NOT NULL,
  `ROLLBACK_TRANSACTIONS` bigint(21) NOT NULL,
  `DENIED_CONNECTIONS` bigint(21) NOT NULL,
  `LOST_CONNECTIONS` bigint(21) NOT NULL,
  `ACCESS_DENIED` bigint(21) NOT NULL,
  `EMPTY_QUERIES` bigint(21) NOT NULL,
  `TOTAL_SSL_CONNECTIONS` bigint(21) unsigned NOT NULL,
  `MAX_STATEMENT_TIME_EXCEEDED` bigint(21) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.COLLATIONS
CREATE TEMPORARY TABLE IF NOT EXISTS `COLLATIONS` (
  `COLLATION_NAME` varchar(32) NOT NULL,
  `CHARACTER_SET_NAME` varchar(32) NOT NULL,
  `ID` bigint(11) NOT NULL,
  `IS_DEFAULT` varchar(3) NOT NULL,
  `IS_COMPILED` varchar(3) NOT NULL,
  `SORTLEN` bigint(3) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.COLLATION_CHARACTER_SET_APPLICABILITY
CREATE TEMPORARY TABLE IF NOT EXISTS `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(32) NOT NULL,
  `CHARACTER_SET_NAME` varchar(32) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.COLUMNS
CREATE TEMPORARY TABLE IF NOT EXISTS `COLUMNS` (
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `COLUMN_NAME` varchar(64) NOT NULL,
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL,
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL,
  `DATA_TYPE` varchar(64) NOT NULL,
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned,
  `NUMERIC_PRECISION` bigint(21) unsigned,
  `NUMERIC_SCALE` bigint(21) unsigned,
  `DATETIME_PRECISION` bigint(21) unsigned,
  `CHARACTER_SET_NAME` varchar(32),
  `COLLATION_NAME` varchar(32),
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL,
  `EXTRA` varchar(30) NOT NULL,
  `PRIVILEGES` varchar(80) NOT NULL,
  `COLUMN_COMMENT` varchar(1024) NOT NULL,
  `IS_GENERATED` varchar(6) NOT NULL,
  `GENERATION_EXPRESSION` longtext
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.COLUMN_PRIVILEGES
CREATE TEMPORARY TABLE IF NOT EXISTS `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(190) NOT NULL,
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `COLUMN_NAME` varchar(64) NOT NULL,
  `PRIVILEGE_TYPE` varchar(64) NOT NULL,
  `IS_GRANTABLE` varchar(3) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.ENABLED_ROLES
CREATE TEMPORARY TABLE IF NOT EXISTS `ENABLED_ROLES` (
  `ROLE_NAME` varchar(128)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.ENGINES
CREATE TEMPORARY TABLE IF NOT EXISTS `ENGINES` (
  `ENGINE` varchar(64) NOT NULL,
  `SUPPORT` varchar(8) NOT NULL,
  `COMMENT` varchar(160) NOT NULL,
  `TRANSACTIONS` varchar(3),
  `XA` varchar(3),
  `SAVEPOINTS` varchar(3)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.EVENTS
CREATE TEMPORARY TABLE IF NOT EXISTS `EVENTS` (
  `EVENT_CATALOG` varchar(64) NOT NULL,
  `EVENT_SCHEMA` varchar(64) NOT NULL,
  `EVENT_NAME` varchar(64) NOT NULL,
  `DEFINER` varchar(189) NOT NULL,
  `TIME_ZONE` varchar(64) NOT NULL,
  `EVENT_BODY` varchar(8) NOT NULL,
  `EVENT_DEFINITION` longtext NOT NULL,
  `EVENT_TYPE` varchar(9) NOT NULL,
  `EXECUTE_AT` datetime,
  `INTERVAL_VALUE` varchar(256),
  `INTERVAL_FIELD` varchar(18),
  `SQL_MODE` varchar(8192) NOT NULL,
  `STARTS` datetime,
  `ENDS` datetime,
  `STATUS` varchar(18) NOT NULL,
  `ON_COMPLETION` varchar(12) NOT NULL,
  `CREATED` datetime NOT NULL,
  `LAST_ALTERED` datetime NOT NULL,
  `LAST_EXECUTED` datetime,
  `EVENT_COMMENT` varchar(64) NOT NULL,
  `ORIGINATOR` bigint(10) NOT NULL,
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL,
  `COLLATION_CONNECTION` varchar(32) NOT NULL,
  `DATABASE_COLLATION` varchar(32) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.FILES
CREATE TEMPORARY TABLE IF NOT EXISTS `FILES` (
  `FILE_ID` bigint(4) NOT NULL,
  `FILE_NAME` varchar(512),
  `FILE_TYPE` varchar(20) NOT NULL,
  `TABLESPACE_NAME` varchar(64),
  `TABLE_CATALOG` varchar(64) NOT NULL,
  `TABLE_SCHEMA` varchar(64),
  `TABLE_NAME` varchar(64),
  `LOGFILE_GROUP_NAME` varchar(64),
  `LOGFILE_GROUP_NUMBER` bigint(4),
  `ENGINE` varchar(64) NOT NULL,
  `FULLTEXT_KEYS` varchar(64),
  `DELETED_ROWS` bigint(4),
  `UPDATE_COUNT` bigint(4),
  `FREE_EXTENTS` bigint(4),
  `TOTAL_EXTENTS` bigint(4),
  `EXTENT_SIZE` bigint(4) NOT NULL,
  `INITIAL_SIZE` bigint(21) unsigned,
  `MAXIMUM_SIZE` bigint(21) unsigned,
  `AUTOEXTEND_SIZE` bigint(21) unsigned,
  `CREATION_TIME` datetime,
  `LAST_UPDATE_TIME` datetime,
  `LAST_ACCESS_TIME` datetime,
  `RECOVER_TIME` bigint(4),
  `TRANSACTION_COUNTER` bigint(4),
  `VERSION` bigint(21) unsigned,
  `ROW_FORMAT` varchar(10),
  `TABLE_ROWS` bigint(21) unsigned,
  `AVG_ROW_LENGTH` bigint(21) unsigned,
  `DATA_LENGTH` bigint(21) unsigned,
  `MAX_DATA_LENGTH` bigint(21) unsigned,
  `INDEX_LENGTH` bigint(21) unsigned,
  `DATA_FREE` bigint(21) unsigned,
  `CREATE_TIME` datetime,
  `UPDATE_TIME` datetime,
  `CHECK_TIME` datetime,
  `CHECKSUM` bigint(21) unsigned,
  `STATUS` varchar(20) NOT NULL,
  `EXTRA` varchar(255)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.GEOMETRY_COLUMNS
CREATE TEMPORARY TABLE IF NOT EXISTS `GEOMETRY_COLUMNS` (
  `F_TABLE_CATALOG` varchar(512) NOT NULL,
  `F_TABLE_SCHEMA` varchar(64) NOT NULL,
  `F_TABLE_NAME` varchar(64) NOT NULL,
  `F_GEOMETRY_COLUMN` varchar(64) NOT NULL,
  `G_TABLE_CATALOG` varchar(512) NOT NULL,
  `G_TABLE_SCHEMA` varchar(64) NOT NULL,
  `G_TABLE_NAME` varchar(64) NOT NULL,
  `G_GEOMETRY_COLUMN` varchar(64) NOT NULL,
  `STORAGE_TYPE` tinyint(2) NOT NULL,
  `GEOMETRY_TYPE` int(7) NOT NULL,
  `COORD_DIMENSION` tinyint(2) NOT NULL,
  `MAX_PPR` tinyint(2) NOT NULL,
  `SRID` smallint(5) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.GLOBAL_STATUS
CREATE TEMPORARY TABLE IF NOT EXISTS `GLOBAL_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL,
  `VARIABLE_VALUE` varchar(2048) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.GLOBAL_VARIABLES
CREATE TEMPORARY TABLE IF NOT EXISTS `GLOBAL_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL,
  `VARIABLE_VALUE` varchar(2048) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INDEX_STATISTICS
CREATE TEMPORARY TABLE IF NOT EXISTS `INDEX_STATISTICS` (
  `TABLE_SCHEMA` varchar(192) NOT NULL,
  `TABLE_NAME` varchar(192) NOT NULL,
  `INDEX_NAME` varchar(192) NOT NULL,
  `ROWS_READ` bigint(21) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_BUFFER_PAGE
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_BUFFER_PAGE` (
  `POOL_ID` bigint(21) unsigned NOT NULL,
  `BLOCK_ID` bigint(21) unsigned NOT NULL,
  `SPACE` bigint(21) unsigned NOT NULL,
  `PAGE_NUMBER` bigint(21) unsigned NOT NULL,
  `PAGE_TYPE` varchar(64),
  `FLUSH_TYPE` bigint(21) unsigned NOT NULL,
  `FIX_COUNT` bigint(21) unsigned NOT NULL,
  `IS_HASHED` varchar(3),
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL,
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL,
  `ACCESS_TIME` bigint(21) unsigned NOT NULL,
  `TABLE_NAME` varchar(1024),
  `INDEX_NAME` varchar(1024),
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL,
  `DATA_SIZE` bigint(21) unsigned NOT NULL,
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL,
  `PAGE_STATE` varchar(64),
  `IO_FIX` varchar(64),
  `IS_OLD` varchar(3),
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_BUFFER_PAGE_LRU
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_BUFFER_PAGE_LRU` (
  `POOL_ID` bigint(21) unsigned NOT NULL,
  `LRU_POSITION` bigint(21) unsigned NOT NULL,
  `SPACE` bigint(21) unsigned NOT NULL,
  `PAGE_NUMBER` bigint(21) unsigned NOT NULL,
  `PAGE_TYPE` varchar(64),
  `FLUSH_TYPE` bigint(21) unsigned NOT NULL,
  `FIX_COUNT` bigint(21) unsigned NOT NULL,
  `IS_HASHED` varchar(3),
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL,
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL,
  `ACCESS_TIME` bigint(21) unsigned NOT NULL,
  `TABLE_NAME` varchar(1024),
  `INDEX_NAME` varchar(1024),
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL,
  `DATA_SIZE` bigint(21) unsigned NOT NULL,
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL,
  `COMPRESSED` varchar(3),
  `IO_FIX` varchar(64),
  `IS_OLD` varchar(3),
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_BUFFER_POOL_STATS
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_BUFFER_POOL_STATS` (
  `POOL_ID` bigint(21) unsigned NOT NULL,
  `POOL_SIZE` bigint(21) unsigned NOT NULL,
  `FREE_BUFFERS` bigint(21) unsigned NOT NULL,
  `DATABASE_PAGES` bigint(21) unsigned NOT NULL,
  `OLD_DATABASE_PAGES` bigint(21) unsigned NOT NULL,
  `MODIFIED_DATABASE_PAGES` bigint(21) unsigned NOT NULL,
  `PENDING_DECOMPRESS` bigint(21) unsigned NOT NULL,
  `PENDING_READS` bigint(21) unsigned NOT NULL,
  `PENDING_FLUSH_LRU` bigint(21) unsigned NOT NULL,
  `PENDING_FLUSH_LIST` bigint(21) unsigned NOT NULL,
  `PAGES_MADE_YOUNG` bigint(21) unsigned NOT NULL,
  `PAGES_NOT_MADE_YOUNG` bigint(21) unsigned NOT NULL,
  `PAGES_MADE_YOUNG_RATE` double NOT NULL,
  `PAGES_MADE_NOT_YOUNG_RATE` double NOT NULL,
  `NUMBER_PAGES_READ` bigint(21) unsigned NOT NULL,
  `NUMBER_PAGES_CREATED` bigint(21) unsigned NOT NULL,
  `NUMBER_PAGES_WRITTEN` bigint(21) unsigned NOT NULL,
  `PAGES_READ_RATE` double NOT NULL,
  `PAGES_CREATE_RATE` double NOT NULL,
  `PAGES_WRITTEN_RATE` double NOT NULL,
  `NUMBER_PAGES_GET` bigint(21) unsigned NOT NULL,
  `HIT_RATE` bigint(21) unsigned NOT NULL,
  `YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL,
  `NOT_YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL,
  `NUMBER_PAGES_READ_AHEAD` bigint(21) unsigned NOT NULL,
  `NUMBER_READ_AHEAD_EVICTED` bigint(21) unsigned NOT NULL,
  `READ_AHEAD_RATE` double NOT NULL,
  `READ_AHEAD_EVICTED_RATE` double NOT NULL,
  `LRU_IO_TOTAL` bigint(21) unsigned NOT NULL,
  `LRU_IO_CURRENT` bigint(21) unsigned NOT NULL,
  `UNCOMPRESS_TOTAL` bigint(21) unsigned NOT NULL,
  `UNCOMPRESS_CURRENT` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_CMP
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMP` (
  `page_size` int(5) NOT NULL,
  `compress_ops` int(11) NOT NULL,
  `compress_ops_ok` int(11) NOT NULL,
  `compress_time` int(11) NOT NULL,
  `uncompress_ops` int(11) NOT NULL,
  `uncompress_time` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_CMPMEM
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMPMEM` (
  `page_size` int(5) NOT NULL,
  `buffer_pool_instance` int(11) NOT NULL,
  `pages_used` int(11) NOT NULL,
  `pages_free` int(11) NOT NULL,
  `relocation_ops` bigint(21) NOT NULL,
  `relocation_time` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_CMPMEM_RESET
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMPMEM_RESET` (
  `page_size` int(5) NOT NULL,
  `buffer_pool_instance` int(11) NOT NULL,
  `pages_used` int(11) NOT NULL,
  `pages_free` int(11) NOT NULL,
  `relocation_ops` bigint(21) NOT NULL,
  `relocation_time` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_CMP_PER_INDEX
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMP_PER_INDEX` (
  `database_name` varchar(192) NOT NULL,
  `table_name` varchar(192) NOT NULL,
  `index_name` varchar(192) NOT NULL,
  `compress_ops` int(11) NOT NULL,
  `compress_ops_ok` int(11) NOT NULL,
  `compress_time` int(11) NOT NULL,
  `uncompress_ops` int(11) NOT NULL,
  `uncompress_time` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_CMP_PER_INDEX_RESET
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMP_PER_INDEX_RESET` (
  `database_name` varchar(192) NOT NULL,
  `table_name` varchar(192) NOT NULL,
  `index_name` varchar(192) NOT NULL,
  `compress_ops` int(11) NOT NULL,
  `compress_ops_ok` int(11) NOT NULL,
  `compress_time` int(11) NOT NULL,
  `uncompress_ops` int(11) NOT NULL,
  `uncompress_time` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_CMP_RESET
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMP_RESET` (
  `page_size` int(5) NOT NULL,
  `compress_ops` int(11) NOT NULL,
  `compress_ops_ok` int(11) NOT NULL,
  `compress_time` int(11) NOT NULL,
  `uncompress_ops` int(11) NOT NULL,
  `uncompress_time` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_FT_BEING_DELETED
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_BEING_DELETED` (
  `DOC_ID` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_FT_CONFIG
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_CONFIG` (
  `KEY` varchar(193) NOT NULL,
  `VALUE` varchar(193) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_FT_DEFAULT_STOPWORD
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_DEFAULT_STOPWORD` (
  `value` varchar(18) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_FT_DELETED
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_DELETED` (
  `DOC_ID` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_FT_INDEX_CACHE
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_INDEX_CACHE` (
  `WORD` varchar(337) NOT NULL,
  `FIRST_DOC_ID` bigint(21) unsigned NOT NULL,
  `LAST_DOC_ID` bigint(21) unsigned NOT NULL,
  `DOC_COUNT` bigint(21) unsigned NOT NULL,
  `DOC_ID` bigint(21) unsigned NOT NULL,
  `POSITION` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_FT_INDEX_TABLE
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_INDEX_TABLE` (
  `WORD` varchar(337) NOT NULL,
  `FIRST_DOC_ID` bigint(21) unsigned NOT NULL,
  `LAST_DOC_ID` bigint(21) unsigned NOT NULL,
  `DOC_COUNT` bigint(21) unsigned NOT NULL,
  `DOC_ID` bigint(21) unsigned NOT NULL,
  `POSITION` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_LOCKS
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_LOCKS` (
  `lock_id` varchar(81) NOT NULL,
  `lock_trx_id` varchar(18) NOT NULL,
  `lock_mode` varchar(32) NOT NULL,
  `lock_type` varchar(32) NOT NULL,
  `lock_table` varchar(1024) NOT NULL,
  `lock_index` varchar(1024),
  `lock_space` bigint(21) unsigned,
  `lock_page` bigint(21) unsigned,
  `lock_rec` bigint(21) unsigned,
  `lock_data` varchar(8192)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_LOCK_WAITS
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_LOCK_WAITS` (
  `requesting_trx_id` varchar(18) NOT NULL,
  `requested_lock_id` varchar(81) NOT NULL,
  `blocking_trx_id` varchar(18) NOT NULL,
  `blocking_lock_id` varchar(81) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_METRICS
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_METRICS` (
  `NAME` varchar(193) NOT NULL,
  `SUBSYSTEM` varchar(193) NOT NULL,
  `COUNT` bigint(21) NOT NULL,
  `MAX_COUNT` bigint(21),
  `MIN_COUNT` bigint(21),
  `AVG_COUNT` double,
  `COUNT_RESET` bigint(21) NOT NULL,
  `MAX_COUNT_RESET` bigint(21),
  `MIN_COUNT_RESET` bigint(21),
  `AVG_COUNT_RESET` double,
  `TIME_ENABLED` datetime,
  `TIME_DISABLED` datetime,
  `TIME_ELAPSED` bigint(21),
  `TIME_RESET` datetime,
  `STATUS` varchar(193) NOT NULL,
  `TYPE` varchar(193) NOT NULL,
  `COMMENT` varchar(193) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_MUTEXES
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_MUTEXES` (
  `NAME` varchar(4000) NOT NULL,
  `CREATE_FILE` varchar(4000) NOT NULL,
  `CREATE_LINE` int(11) unsigned NOT NULL,
  `OS_WAITS` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_COLUMNS
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_COLUMNS` (
  `TABLE_ID` bigint(21) unsigned NOT NULL,
  `NAME` varchar(193) NOT NULL,
  `POS` bigint(21) unsigned NOT NULL,
  `MTYPE` int(11) NOT NULL,
  `PRTYPE` int(11) NOT NULL,
  `LEN` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_DATAFILES
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_DATAFILES` (
  `SPACE` int(11) unsigned NOT NULL,
  `PATH` varchar(4000) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_FIELDS
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_FIELDS` (
  `INDEX_ID` bigint(21) unsigned NOT NULL,
  `NAME` varchar(193) NOT NULL,
  `POS` int(11) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_FOREIGN
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_FOREIGN` (
  `ID` varchar(193) NOT NULL,
  `FOR_NAME` varchar(193) NOT NULL,
  `REF_NAME` varchar(193) NOT NULL,
  `N_COLS` int(11) unsigned NOT NULL,
  `TYPE` int(11) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_FOREIGN_COLS
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_FOREIGN_COLS` (
  `ID` varchar(193) NOT NULL,
  `FOR_COL_NAME` varchar(193) NOT NULL,
  `REF_COL_NAME` varchar(193) NOT NULL,
  `POS` int(11) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_INDEXES
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_INDEXES` (
  `INDEX_ID` bigint(21) unsigned NOT NULL,
  `NAME` varchar(193) NOT NULL,
  `TABLE_ID` bigint(21) unsigned NOT NULL,
  `TYPE` int(11) NOT NULL,
  `N_FIELDS` int(11) NOT NULL,
  `PAGE_NO` int(11) NOT NULL,
  `SPACE` int(11) NOT NULL,
  `MERGE_THRESHOLD` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_SEMAPHORE_WAITS
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_SEMAPHORE_WAITS` (
  `THREAD_ID` bigint(21) unsigned NOT NULL,
  `OBJECT_NAME` varchar(4000),
  `FILE` varchar(4000),
  `LINE` int(11) unsigned NOT NULL,
  `WAIT_TIME` bigint(21) unsigned NOT NULL,
  `WAIT_OBJECT` bigint(21) unsigned NOT NULL,
  `WAIT_TYPE` varchar(16),
  `HOLDER_THREAD_ID` bigint(21) unsigned NOT NULL,
  `HOLDER_FILE` varchar(4000),
  `HOLDER_LINE` int(11) unsigned NOT NULL,
  `CREATED_FILE` varchar(4000),
  `CREATED_LINE` int(11) unsigned NOT NULL,
  `WRITER_THREAD` bigint(21) unsigned NOT NULL,
  `RESERVATION_MODE` varchar(16),
  `READERS` int(11) unsigned NOT NULL,
  `WAITERS_FLAG` bigint(21) unsigned NOT NULL,
  `LOCK_WORD` bigint(21) unsigned NOT NULL,
  `LAST_WRITER_FILE` varchar(4000),
  `LAST_WRITER_LINE` int(11) unsigned NOT NULL,
  `OS_WAIT_COUNT` int(11) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_TABLES
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_TABLES` (
  `TABLE_ID` bigint(21) unsigned NOT NULL,
  `NAME` varchar(655) NOT NULL,
  `FLAG` int(11) NOT NULL,
  `N_COLS` int(11) NOT NULL,
  `SPACE` int(11) NOT NULL,
  `ROW_FORMAT` varchar(12),
  `ZIP_PAGE_SIZE` int(11) unsigned NOT NULL,
  `SPACE_TYPE` varchar(10)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_TABLESPACES
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_TABLESPACES` (
  `SPACE` int(11) unsigned NOT NULL,
  `NAME` varchar(655) NOT NULL,
  `FLAG` int(11) unsigned NOT NULL,
  `ROW_FORMAT` varchar(22),
  `PAGE_SIZE` int(11) unsigned NOT NULL,
  `ZIP_PAGE_SIZE` int(11) unsigned NOT NULL,
  `SPACE_TYPE` varchar(10),
  `FS_BLOCK_SIZE` int(11) unsigned NOT NULL,
  `FILE_SIZE` bigint(21) unsigned NOT NULL,
  `ALLOCATED_SIZE` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_TABLESTATS
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_TABLESTATS` (
  `TABLE_ID` bigint(21) unsigned NOT NULL,
  `NAME` varchar(193) NOT NULL,
  `STATS_INITIALIZED` varchar(193) NOT NULL,
  `NUM_ROWS` bigint(21) unsigned NOT NULL,
  `CLUST_INDEX_SIZE` bigint(21) unsigned NOT NULL,
  `OTHER_INDEX_SIZE` bigint(21) unsigned NOT NULL,
  `MODIFIED_COUNTER` bigint(21) unsigned NOT NULL,
  `AUTOINC` bigint(21) unsigned NOT NULL,
  `REF_COUNT` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_SYS_VIRTUAL
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_VIRTUAL` (
  `TABLE_ID` bigint(21) unsigned NOT NULL,
  `POS` int(11) unsigned NOT NULL,
  `BASE_POS` int(11) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_TABLESPACES_ENCRYPTION
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_TABLESPACES_ENCRYPTION` (
  `SPACE` int(11) unsigned NOT NULL,
  `NAME` varchar(655),
  `ENCRYPTION_SCHEME` int(11) unsigned NOT NULL,
  `KEYSERVER_REQUESTS` int(11) unsigned NOT NULL,
  `MIN_KEY_VERSION` int(11) unsigned NOT NULL,
  `CURRENT_KEY_VERSION` int(11) unsigned NOT NULL,
  `KEY_ROTATION_PAGE_NUMBER` bigint(21) unsigned,
  `KEY_ROTATION_MAX_PAGE_NUMBER` bigint(21) unsigned,
  `CURRENT_KEY_ID` int(11) unsigned NOT NULL,
  `ROTATING_OR_FLUSHING` int(1) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_TABLESPACES_SCRUBBING
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_TABLESPACES_SCRUBBING` (
  `SPACE` bigint(21) unsigned NOT NULL,
  `NAME` varchar(655),
  `COMPRESSED` int(1) unsigned NOT NULL,
  `LAST_SCRUB_COMPLETED` datetime,
  `CURRENT_SCRUB_STARTED` datetime,
  `CURRENT_SCRUB_ACTIVE_THREADS` int(11) unsigned,
  `CURRENT_SCRUB_PAGE_NUMBER` bigint(21) unsigned NOT NULL,
  `CURRENT_SCRUB_MAX_PAGE_NUMBER` bigint(21) unsigned NOT NULL,
  `ON_SSD` int(1) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.INNODB_TRX
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_TRX` (
  `trx_id` varchar(18) NOT NULL,
  `trx_state` varchar(13) NOT NULL,
  `trx_started` datetime NOT NULL,
  `trx_requested_lock_id` varchar(81),
  `trx_wait_started` datetime,
  `trx_weight` bigint(21) unsigned NOT NULL,
  `trx_mysql_thread_id` bigint(21) unsigned NOT NULL,
  `trx_query` varchar(1024),
  `trx_operation_state` varchar(64),
  `trx_tables_in_use` bigint(21) unsigned NOT NULL,
  `trx_tables_locked` bigint(21) unsigned NOT NULL,
  `trx_lock_structs` bigint(21) unsigned NOT NULL,
  `trx_lock_memory_bytes` bigint(21) unsigned NOT NULL,
  `trx_rows_locked` bigint(21) unsigned NOT NULL,
  `trx_rows_modified` bigint(21) unsigned NOT NULL,
  `trx_concurrency_tickets` bigint(21) unsigned NOT NULL,
  `trx_isolation_level` varchar(16) NOT NULL,
  `trx_unique_checks` int(1) NOT NULL,
  `trx_foreign_key_checks` int(1) NOT NULL,
  `trx_last_foreign_key_error` varchar(256),
  `trx_is_read_only` int(1) NOT NULL,
  `trx_autocommit_non_locking` int(1) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.KEYWORDS
CREATE TEMPORARY TABLE IF NOT EXISTS `KEYWORDS` (
  `WORD` varchar(64)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.KEY_CACHES
CREATE TEMPORARY TABLE IF NOT EXISTS `KEY_CACHES` (
  `KEY_CACHE_NAME` varchar(192) NOT NULL,
  `SEGMENTS` int(3) unsigned,
  `SEGMENT_NUMBER` int(3) unsigned,
  `FULL_SIZE` bigint(21) unsigned NOT NULL,
  `BLOCK_SIZE` bigint(21) unsigned NOT NULL,
  `USED_BLOCKS` bigint(21) unsigned NOT NULL,
  `UNUSED_BLOCKS` bigint(21) unsigned NOT NULL,
  `DIRTY_BLOCKS` bigint(21) unsigned NOT NULL,
  `READ_REQUESTS` bigint(21) unsigned NOT NULL,
  `READS` bigint(21) unsigned NOT NULL,
  `WRITE_REQUESTS` bigint(21) unsigned NOT NULL,
  `WRITES` bigint(21) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.KEY_COLUMN_USAGE
CREATE TEMPORARY TABLE IF NOT EXISTS `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL,
  `CONSTRAINT_NAME` varchar(64) NOT NULL,
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `COLUMN_NAME` varchar(64) NOT NULL,
  `ORDINAL_POSITION` bigint(10) NOT NULL,
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10),
  `REFERENCED_TABLE_SCHEMA` varchar(64),
  `REFERENCED_TABLE_NAME` varchar(64),
  `REFERENCED_COLUMN_NAME` varchar(64)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.OPTIMIZER_TRACE
CREATE TEMPORARY TABLE IF NOT EXISTS `OPTIMIZER_TRACE` (
  `QUERY` longtext NOT NULL,
  `TRACE` longtext NOT NULL,
  `MISSING_BYTES_BEYOND_MAX_MEM_SIZE` int(20) NOT NULL,
  `INSUFFICIENT_PRIVILEGES` tinyint(1) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.PARAMETERS
CREATE TEMPORARY TABLE IF NOT EXISTS `PARAMETERS` (
  `SPECIFIC_CATALOG` varchar(512) NOT NULL,
  `SPECIFIC_SCHEMA` varchar(64) NOT NULL,
  `SPECIFIC_NAME` varchar(64) NOT NULL,
  `ORDINAL_POSITION` int(21) NOT NULL,
  `PARAMETER_MODE` varchar(5),
  `PARAMETER_NAME` varchar(64),
  `DATA_TYPE` varchar(64) NOT NULL,
  `CHARACTER_MAXIMUM_LENGTH` int(21),
  `CHARACTER_OCTET_LENGTH` int(21),
  `NUMERIC_PRECISION` int(21),
  `NUMERIC_SCALE` int(21),
  `DATETIME_PRECISION` bigint(21) unsigned,
  `CHARACTER_SET_NAME` varchar(64),
  `COLLATION_NAME` varchar(64),
  `DTD_IDENTIFIER` longtext NOT NULL,
  `ROUTINE_TYPE` varchar(9) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.PARTITIONS
CREATE TEMPORARY TABLE IF NOT EXISTS `PARTITIONS` (
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `PARTITION_NAME` varchar(64),
  `SUBPARTITION_NAME` varchar(64),
  `PARTITION_ORDINAL_POSITION` bigint(21) unsigned,
  `SUBPARTITION_ORDINAL_POSITION` bigint(21) unsigned,
  `PARTITION_METHOD` varchar(18),
  `SUBPARTITION_METHOD` varchar(12),
  `PARTITION_EXPRESSION` longtext,
  `SUBPARTITION_EXPRESSION` longtext,
  `PARTITION_DESCRIPTION` longtext,
  `TABLE_ROWS` bigint(21) unsigned NOT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned NOT NULL,
  `DATA_LENGTH` bigint(21) unsigned NOT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned,
  `INDEX_LENGTH` bigint(21) unsigned NOT NULL,
  `DATA_FREE` bigint(21) unsigned NOT NULL,
  `CREATE_TIME` datetime,
  `UPDATE_TIME` datetime,
  `CHECK_TIME` datetime,
  `CHECKSUM` bigint(21) unsigned,
  `PARTITION_COMMENT` varchar(80) NOT NULL,
  `NODEGROUP` varchar(12) NOT NULL,
  `TABLESPACE_NAME` varchar(64)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.PLUGINS
CREATE TEMPORARY TABLE IF NOT EXISTS `PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL,
  `PLUGIN_VERSION` varchar(20) NOT NULL,
  `PLUGIN_STATUS` varchar(16) NOT NULL,
  `PLUGIN_TYPE` varchar(80) NOT NULL,
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL,
  `PLUGIN_LIBRARY` varchar(64),
  `PLUGIN_LIBRARY_VERSION` varchar(20),
  `PLUGIN_AUTHOR` varchar(64),
  `PLUGIN_DESCRIPTION` longtext,
  `PLUGIN_LICENSE` varchar(80) NOT NULL,
  `LOAD_OPTION` varchar(64) NOT NULL,
  `PLUGIN_MATURITY` varchar(12) NOT NULL,
  `PLUGIN_AUTH_VERSION` varchar(80)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.PROCESSLIST
CREATE TEMPORARY TABLE IF NOT EXISTS `PROCESSLIST` (
  `ID` bigint(4) NOT NULL,
  `USER` varchar(128) NOT NULL,
  `HOST` varchar(64) NOT NULL,
  `DB` varchar(64),
  `COMMAND` varchar(16) NOT NULL,
  `TIME` int(7) NOT NULL,
  `STATE` varchar(64),
  `INFO` longtext,
  `TIME_MS` decimal(22,3) NOT NULL,
  `STAGE` tinyint(2) NOT NULL,
  `MAX_STAGE` tinyint(2) NOT NULL,
  `PROGRESS` decimal(7,3) NOT NULL,
  `MEMORY_USED` bigint(7) NOT NULL,
  `MAX_MEMORY_USED` bigint(7) NOT NULL,
  `EXAMINED_ROWS` int(7) NOT NULL,
  `QUERY_ID` bigint(4) NOT NULL,
  `INFO_BINARY` blob,
  `TID` bigint(4) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.PROFILING
CREATE TEMPORARY TABLE IF NOT EXISTS `PROFILING` (
  `QUERY_ID` int(20) NOT NULL,
  `SEQ` int(20) NOT NULL,
  `STATE` varchar(30) NOT NULL,
  `DURATION` decimal(9,6) NOT NULL,
  `CPU_USER` decimal(9,6),
  `CPU_SYSTEM` decimal(9,6),
  `CONTEXT_VOLUNTARY` int(20),
  `CONTEXT_INVOLUNTARY` int(20),
  `BLOCK_OPS_IN` int(20),
  `BLOCK_OPS_OUT` int(20),
  `MESSAGES_SENT` int(20),
  `MESSAGES_RECEIVED` int(20),
  `PAGE_FAULTS_MAJOR` int(20),
  `PAGE_FAULTS_MINOR` int(20),
  `SWAPS` int(20),
  `SOURCE_FUNCTION` varchar(30),
  `SOURCE_FILE` varchar(20),
  `SOURCE_LINE` int(20)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.REFERENTIAL_CONSTRAINTS
CREATE TEMPORARY TABLE IF NOT EXISTS `REFERENTIAL_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL,
  `CONSTRAINT_NAME` varchar(64) NOT NULL,
  `UNIQUE_CONSTRAINT_CATALOG` varchar(512) NOT NULL,
  `UNIQUE_CONSTRAINT_SCHEMA` varchar(64) NOT NULL,
  `UNIQUE_CONSTRAINT_NAME` varchar(64),
  `MATCH_OPTION` varchar(64) NOT NULL,
  `UPDATE_RULE` varchar(64) NOT NULL,
  `DELETE_RULE` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `REFERENCED_TABLE_NAME` varchar(64) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.ROUTINES
CREATE TEMPORARY TABLE IF NOT EXISTS `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL,
  `ROUTINE_CATALOG` varchar(512) NOT NULL,
  `ROUTINE_SCHEMA` varchar(64) NOT NULL,
  `ROUTINE_NAME` varchar(64) NOT NULL,
  `ROUTINE_TYPE` varchar(13) NOT NULL,
  `DATA_TYPE` varchar(64) NOT NULL,
  `CHARACTER_MAXIMUM_LENGTH` int(21),
  `CHARACTER_OCTET_LENGTH` int(21),
  `NUMERIC_PRECISION` int(21),
  `NUMERIC_SCALE` int(21),
  `DATETIME_PRECISION` bigint(21) unsigned,
  `CHARACTER_SET_NAME` varchar(64),
  `COLLATION_NAME` varchar(64),
  `DTD_IDENTIFIER` longtext,
  `ROUTINE_BODY` varchar(8) NOT NULL,
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64),
  `EXTERNAL_LANGUAGE` varchar(64),
  `PARAMETER_STYLE` varchar(8) NOT NULL,
  `IS_DETERMINISTIC` varchar(3) NOT NULL,
  `SQL_DATA_ACCESS` varchar(64) NOT NULL,
  `SQL_PATH` varchar(64),
  `SECURITY_TYPE` varchar(7) NOT NULL,
  `CREATED` datetime NOT NULL,
  `LAST_ALTERED` datetime NOT NULL,
  `SQL_MODE` varchar(8192) NOT NULL,
  `ROUTINE_COMMENT` longtext NOT NULL,
  `DEFINER` varchar(189) NOT NULL,
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL,
  `COLLATION_CONNECTION` varchar(32) NOT NULL,
  `DATABASE_COLLATION` varchar(32) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.SCHEMATA
CREATE TEMPORARY TABLE IF NOT EXISTS `SCHEMATA` (
  `CATALOG_NAME` varchar(512) NOT NULL,
  `SCHEMA_NAME` varchar(64) NOT NULL,
  `DEFAULT_CHARACTER_SET_NAME` varchar(32) NOT NULL,
  `DEFAULT_COLLATION_NAME` varchar(32) NOT NULL,
  `SQL_PATH` varchar(512)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.SCHEMA_PRIVILEGES
CREATE TEMPORARY TABLE IF NOT EXISTS `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(190) NOT NULL,
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `PRIVILEGE_TYPE` varchar(64) NOT NULL,
  `IS_GRANTABLE` varchar(3) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.SESSION_STATUS
CREATE TEMPORARY TABLE IF NOT EXISTS `SESSION_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL,
  `VARIABLE_VALUE` varchar(2048) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.SESSION_VARIABLES
CREATE TEMPORARY TABLE IF NOT EXISTS `SESSION_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL,
  `VARIABLE_VALUE` varchar(2048) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.SPATIAL_REF_SYS
CREATE TEMPORARY TABLE IF NOT EXISTS `SPATIAL_REF_SYS` (
  `SRID` smallint(5) NOT NULL,
  `AUTH_NAME` varchar(512) NOT NULL,
  `AUTH_SRID` int(5) NOT NULL,
  `SRTEXT` varchar(2048) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.SQL_FUNCTIONS
CREATE TEMPORARY TABLE IF NOT EXISTS `SQL_FUNCTIONS` (
  `FUNCTION` varchar(64)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.STATISTICS
CREATE TEMPORARY TABLE IF NOT EXISTS `STATISTICS` (
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `NON_UNIQUE` bigint(1) NOT NULL,
  `INDEX_SCHEMA` varchar(64) NOT NULL,
  `INDEX_NAME` varchar(64) NOT NULL,
  `SEQ_IN_INDEX` bigint(2) NOT NULL,
  `COLUMN_NAME` varchar(64) NOT NULL,
  `COLLATION` varchar(1),
  `CARDINALITY` bigint(21),
  `SUB_PART` bigint(3),
  `PACKED` varchar(10),
  `NULLABLE` varchar(3) NOT NULL,
  `INDEX_TYPE` varchar(16) NOT NULL,
  `COMMENT` varchar(16),
  `INDEX_COMMENT` varchar(1024) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.SYSTEM_VARIABLES
CREATE TEMPORARY TABLE IF NOT EXISTS `SYSTEM_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL,
  `SESSION_VALUE` varchar(2048),
  `GLOBAL_VALUE` varchar(2048),
  `GLOBAL_VALUE_ORIGIN` varchar(64) NOT NULL,
  `DEFAULT_VALUE` varchar(2048),
  `VARIABLE_SCOPE` varchar(64) NOT NULL,
  `VARIABLE_TYPE` varchar(64) NOT NULL,
  `VARIABLE_COMMENT` varchar(2048) NOT NULL,
  `NUMERIC_MIN_VALUE` varchar(21),
  `NUMERIC_MAX_VALUE` varchar(21),
  `NUMERIC_BLOCK_SIZE` varchar(21),
  `ENUM_VALUE_LIST` longtext,
  `READ_ONLY` varchar(3) NOT NULL,
  `COMMAND_LINE_ARGUMENT` varchar(64)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.TABLES
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLES` (
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `TABLE_TYPE` varchar(64) NOT NULL,
  `ENGINE` varchar(64),
  `VERSION` bigint(21) unsigned,
  `ROW_FORMAT` varchar(10),
  `TABLE_ROWS` bigint(21) unsigned,
  `AVG_ROW_LENGTH` bigint(21) unsigned,
  `DATA_LENGTH` bigint(21) unsigned,
  `MAX_DATA_LENGTH` bigint(21) unsigned,
  `INDEX_LENGTH` bigint(21) unsigned,
  `DATA_FREE` bigint(21) unsigned,
  `AUTO_INCREMENT` bigint(21) unsigned,
  `CREATE_TIME` datetime,
  `UPDATE_TIME` datetime,
  `CHECK_TIME` datetime,
  `TABLE_COLLATION` varchar(32),
  `CHECKSUM` bigint(21) unsigned,
  `CREATE_OPTIONS` varchar(2048),
  `TABLE_COMMENT` varchar(2048) NOT NULL,
  `MAX_INDEX_LENGTH` bigint(21) unsigned,
  `TEMPORARY` varchar(1)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.TABLESPACES
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLESPACES` (
  `TABLESPACE_NAME` varchar(64) NOT NULL,
  `ENGINE` varchar(64) NOT NULL,
  `TABLESPACE_TYPE` varchar(64),
  `LOGFILE_GROUP_NAME` varchar(64),
  `EXTENT_SIZE` bigint(21) unsigned,
  `AUTOEXTEND_SIZE` bigint(21) unsigned,
  `MAXIMUM_SIZE` bigint(21) unsigned,
  `NODEGROUP_ID` bigint(21) unsigned,
  `TABLESPACE_COMMENT` varchar(2048)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.TABLE_CONSTRAINTS
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL,
  `CONSTRAINT_NAME` varchar(64) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `CONSTRAINT_TYPE` varchar(64) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.TABLE_PRIVILEGES
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(190) NOT NULL,
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `PRIVILEGE_TYPE` varchar(64) NOT NULL,
  `IS_GRANTABLE` varchar(3) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.TABLE_STATISTICS
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLE_STATISTICS` (
  `TABLE_SCHEMA` varchar(192) NOT NULL,
  `TABLE_NAME` varchar(192) NOT NULL,
  `ROWS_READ` bigint(21) NOT NULL,
  `ROWS_CHANGED` bigint(21) NOT NULL,
  `ROWS_CHANGED_X_INDEXES` bigint(21) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.TRIGGERS
CREATE TEMPORARY TABLE IF NOT EXISTS `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) NOT NULL,
  `TRIGGER_SCHEMA` varchar(64) NOT NULL,
  `TRIGGER_NAME` varchar(64) NOT NULL,
  `EVENT_MANIPULATION` varchar(6) NOT NULL,
  `EVENT_OBJECT_CATALOG` varchar(512) NOT NULL,
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL,
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL,
  `ACTION_ORDER` bigint(4) NOT NULL,
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL,
  `ACTION_TIMING` varchar(6) NOT NULL,
  `ACTION_REFERENCE_OLD_TABLE` varchar(64),
  `ACTION_REFERENCE_NEW_TABLE` varchar(64),
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL,
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL,
  `CREATED` datetime(2),
  `SQL_MODE` varchar(8192) NOT NULL,
  `DEFINER` varchar(189) NOT NULL,
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL,
  `COLLATION_CONNECTION` varchar(32) NOT NULL,
  `DATABASE_COLLATION` varchar(32) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.USER_PRIVILEGES
CREATE TEMPORARY TABLE IF NOT EXISTS `USER_PRIVILEGES` (
  `GRANTEE` varchar(190) NOT NULL,
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `PRIVILEGE_TYPE` varchar(64) NOT NULL,
  `IS_GRANTABLE` varchar(3) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.USER_STATISTICS
CREATE TEMPORARY TABLE IF NOT EXISTS `USER_STATISTICS` (
  `USER` varchar(128) NOT NULL,
  `TOTAL_CONNECTIONS` int(11) NOT NULL,
  `CONCURRENT_CONNECTIONS` int(11) NOT NULL,
  `CONNECTED_TIME` int(11) NOT NULL,
  `BUSY_TIME` double NOT NULL,
  `CPU_TIME` double NOT NULL,
  `BYTES_RECEIVED` bigint(21) NOT NULL,
  `BYTES_SENT` bigint(21) NOT NULL,
  `BINLOG_BYTES_WRITTEN` bigint(21) NOT NULL,
  `ROWS_READ` bigint(21) NOT NULL,
  `ROWS_SENT` bigint(21) NOT NULL,
  `ROWS_DELETED` bigint(21) NOT NULL,
  `ROWS_INSERTED` bigint(21) NOT NULL,
  `ROWS_UPDATED` bigint(21) NOT NULL,
  `SELECT_COMMANDS` bigint(21) NOT NULL,
  `UPDATE_COMMANDS` bigint(21) NOT NULL,
  `OTHER_COMMANDS` bigint(21) NOT NULL,
  `COMMIT_TRANSACTIONS` bigint(21) NOT NULL,
  `ROLLBACK_TRANSACTIONS` bigint(21) NOT NULL,
  `DENIED_CONNECTIONS` bigint(21) NOT NULL,
  `LOST_CONNECTIONS` bigint(21) NOT NULL,
  `ACCESS_DENIED` bigint(21) NOT NULL,
  `EMPTY_QUERIES` bigint(21) NOT NULL,
  `TOTAL_SSL_CONNECTIONS` bigint(21) unsigned NOT NULL,
  `MAX_STATEMENT_TIME_EXCEEDED` bigint(21) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.user_variables
CREATE TEMPORARY TABLE IF NOT EXISTS `user_variables` (
  `VARIABLE_NAME` varchar(64) NOT NULL,
  `VARIABLE_VALUE` varchar(2048),
  `VARIABLE_TYPE` varchar(64) NOT NULL,
  `CHARACTER_SET_NAME` varchar(32)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela information_schema.VIEWS
CREATE TEMPORARY TABLE IF NOT EXISTS `VIEWS` (
  `TABLE_CATALOG` varchar(512) NOT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL,
  `IS_UPDATABLE` varchar(3) NOT NULL,
  `DEFINER` varchar(189) NOT NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL,
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL,
  `COLLATION_CONNECTION` varchar(32) NOT NULL,
  `ALGORITHM` varchar(10) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura do banco de dados para joins
CREATE DATABASE IF NOT EXISTS `joins` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `joins`;

-- Copiando estrutura para tabela joins.tabelaa
CREATE TABLE IF NOT EXISTS `tabelaa` (
  `nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela joins.tabelab
CREATE TABLE IF NOT EXISTS `tabelab` (
  `Nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
