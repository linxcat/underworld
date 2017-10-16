-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Characters'
-- I have a concept for a ex-prince draconian half-demon
-- ---

DROP TABLE IF EXISTS `Characters`;
		
CREATE TABLE `Characters` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `player` INTEGER NOT NULL,
  `homeguild` INTEGER NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `truename` VARCHAR(14) NULL DEFAULT NULL,
  `race` INTEGER NOT NULL,
  `occuptation` INTEGER NOT NULL,
  `vocation` INTEGER NULL DEFAULT NULL,
  `blanketsapplied` SMALLINT NOT NULL DEFAULT 0,
  `level` TINYINT NOT NULL DEFAULT 1,
  `maxHP` SMALLINT NOT NULL DEFAULT 2,
  `deaths` TINYINT NOT NULL DEFAULT 0,
  `dead` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) COMMENT 'I have a concept for a ex-prince draconian half-demon';

-- ---
-- Table 'players'
-- Run Fight Hide
-- ---

DROP TABLE IF EXISTS `players`;
		
CREATE TABLE `players` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` CHAR(128) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `birthday` DATE NULL DEFAULT NULL,
  `signedwaivers` SET ('jericho', 'kalidor', 'ralinwood', 'havenhollow', 'ashendael', 'stormlands', 'salemruin', 'tempestgrove', 'zenithstrand', 'bryzanthea') NOT NULL,
  `blankets` SMALLINT NOT NULL,
  `xprecord` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`username`),
  UNIQUE KEY (`email`)
) COMMENT 'Run Fight Hide';

-- ---
-- Table 'classes'
-- Occupations and Vocations
-- ---

DROP TABLE IF EXISTS `classes`;
		
CREATE TABLE `classes` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `type` INTEGER NOT NULL,
  `skill1` VARCHAR(255) NOT NULL,
  `skill2` VARCHAR(255) NOT NULL,
  `skill3` VARCHAR(255) NOT NULL,
  `skill4` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
) COMMENT 'Occupations and Vocations';

-- ---
-- Table 'Guilds'
-- Hail Hydra
-- ---

DROP TABLE IF EXISTS `Guilds`;
		
CREATE TABLE `Guilds` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `logopen` TINYINT(1) NOT NULL DEFAULT 0,
  `price` TINYINT NOT NULL DEFAULT 0,
  `costofliving` TINYINT NOT NULL DEFAULT 0,
  `splashpath` MEDIUMTEXT NULL DEFAULT NULL,
  `logmail` VARCHAR(255) NULL DEFAULT NULL,
  `shapermail` VARCHAR(255) NULL DEFAULT NULL,
  `nplmail` VARCHAR(255) NULL DEFAULT NULL,
  `mappath` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
) COMMENT 'Hail Hydra';

-- ---
-- Table 'skills'
-- 
-- ---

DROP TABLE IF EXISTS `skills`;
		
CREATE TABLE `skills` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `selftaught` TINYINT(1) NOT NULL DEFAULT 1,
  `multipurchase` TINYINT NOT NULL DEFAULT -1,
  `tag` TINYINT(1) NOT NULL DEFAULT 0,
  `fragcost` SMALLINT NOT NULL DEFAULT 0,
  `racelimit` INTEGER NULL DEFAULT NULL,
  `typelimit` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
);

-- ---
-- Table 'mortigeist'
-- Mother Loves Us
-- ---

DROP TABLE IF EXISTS `mortigeist`;
		
CREATE TABLE `mortigeist` (
  `remaining` INT NOT NULL,
  PRIMARY KEY (`remaining`)
) COMMENT 'Mother Loves Us';

-- ---
-- Table 'weapons'
-- Say hello to my little friend
-- ---

DROP TABLE IF EXISTS `weapons`;
		
CREATE TABLE `weapons` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `class` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`, `class`)
) COMMENT 'Say hello to my little friend';

-- ---
-- Table 'spells'
-- Don''t gotta explain shit
-- ---

DROP TABLE IF EXISTS `spells`;
		
CREATE TABLE `spells` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `sphere` INTEGER NOT NULL,
  `level` TINYINT NOT NULL,
  `incant` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
) COMMENT 'Don''t gotta explain shit';

-- ---
-- Table 'production'
-- How to get rich but not die trying
-- ---

DROP TABLE IF EXISTS `production`;
		
CREATE TABLE `production` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `modifier` VARCHAR(255) NULL DEFAULT NULL,
  `skill` VARCHAR(255) NOT NULL,
  `levelrestriction` TINYINT NOT NULL DEFAULT 0,
  `ppcost` SMALLINT NOT NULL DEFAULT 2,
  `rmcost` SMALLINT NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`, `modifier`)
) COMMENT 'How to get rich but not die trying';

-- ---
-- Table 'races'
-- Looks like a wild elf
-- ---

DROP TABLE IF EXISTS `races`;
		
CREATE TABLE `races` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `multipurchase` TINYINT NOT NULL DEFAULT 1,
  `fragcost` SMALLINT NOT NULL DEFAULT 0,
  `onsale` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
) COMMENT 'Looks like a wild elf';

-- ---
-- Table 'frags'
-- Imaginary Money
-- ---

DROP TABLE IF EXISTS `frags`;
		
CREATE TABLE `frags` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `player` INTEGER NOT NULL,
  `jericho` SMALLINT NOT NULL DEFAULT 0,
  `kalidor` SMALLINT NOT NULL DEFAULT 0,
  `ralinwood` SMALLINT NOT NULL DEFAULT 0,
  `havenhollow` SMALLINT NOT NULL DEFAULT 0,
  `ashendael` SMALLINT NOT NULL DEFAULT 0,
  `stormlands` SMALLINT NOT NULL DEFAULT 0,
  `salemruin` SMALLINT NOT NULL DEFAULT 0,
  `tempestgrove` SMALLINT NOT NULL DEFAULT 0,
  `zenithstrand` SMALLINT NOT NULL DEFAULT 0,
  `bryzanthea` SMALLINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `player`)
) COMMENT 'Imaginary Money';

-- ---
-- Table 'skillcosts'
-- Everyone is unique
-- ---

DROP TABLE IF EXISTS `skillcosts`;
		
CREATE TABLE `skillcosts` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `skill` INTEGER NOT NULL,
  `mercenary` SMALLINT NOT NULL,
  `ranger` SMALLINT NOT NULL,
  `templar` SMALLINT NOT NULL,
  `nightblade` SMALLINT NOT NULL,
  `assassin` SMALLINT NOT NULL,
  `witchhunter` SMALLINT NOT NULL,
  `mage` SMALLINT NOT NULL,
  `druid` SMALLINT NOT NULL,
  `bard` SMALLINT NOT NULL,
  `champion` SMALLINT NOT NULL,
  `demagogue` SMALLINT NOT NULL,
  PRIMARY KEY (`id`, `skill`)
) COMMENT 'Everyone is unique';

-- ---
-- Table 'spheres'
-- Wizard Business... WizNess
-- ---

DROP TABLE IF EXISTS `spheres`;
		
CREATE TABLE `spheres` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
) COMMENT 'Wizard Business... WizNess';

-- ---
-- Table 'classtypes'
-- Muscle, Mysticality, Moxie
-- ---

DROP TABLE IF EXISTS `classtypes`;
		
CREATE TABLE `classtypes` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`type`)
) COMMENT 'Muscle, Mysticality, Moxie';

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Characters` ADD FOREIGN KEY (player) REFERENCES `players` (`id`);
ALTER TABLE `Characters` ADD FOREIGN KEY (homeguild) REFERENCES `Guilds` (`id`);
ALTER TABLE `Characters` ADD FOREIGN KEY (race) REFERENCES `races` (`id`);
ALTER TABLE `Characters` ADD FOREIGN KEY (occuptation) REFERENCES `classes` (`id`);
ALTER TABLE `Characters` ADD FOREIGN KEY (vocation) REFERENCES `classes` (`id`);
ALTER TABLE `classes` ADD FOREIGN KEY (type) REFERENCES `classtypes` (`id`);
ALTER TABLE `skills` ADD FOREIGN KEY (racelimit) REFERENCES `races` (`id`);
ALTER TABLE `skills` ADD FOREIGN KEY (typelimit) REFERENCES `classtypes` (`id`);
ALTER TABLE `spells` ADD FOREIGN KEY (sphere) REFERENCES `spheres` (`id`);
ALTER TABLE `frags` ADD FOREIGN KEY (player) REFERENCES `players` (`id`);
ALTER TABLE `skillcosts` ADD FOREIGN KEY (skill) REFERENCES `skills` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Characters` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `players` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `classes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Guilds` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `skills` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `mortigeist` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `weapons` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `spells` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `production` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `races` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `frags` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `skillcosts` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `spheres` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `classtypes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Characters` (`id`,`player`,`homeguild`,`name`,`trueName`,`race`,`occuptation`,`vocation`,`blanketsApplied`,`level`,`maxHP`,`deaths`,`dead`) VALUES
-- ('','','','','','','','','','','','','');
-- INSERT INTO `players` (`id`,`username`,`password`,`name`,`email`,`birthday`,`signedwaivers`,`blankets`,`xprecord`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `classes` (`id`,`name`,`type`,`skill1`,`skill2`,`skill3`,`skill4`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Guilds` (`id`,`name`,`logopen`,`price`,`costofliving`,`splashpath`) VALUES
-- ('','','','','','');
-- INSERT INTO `skills` (`id`,`name`,`selftaught`,`multipurchase`,`tag`,`fragcost`,`racelimit`,`typelimit`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `mortigeist` (`remaining`) VALUES
-- ('');
-- INSERT INTO `weapons` (`id`,`name`,`class`) VALUES
-- ('','','');
-- INSERT INTO `spells` (`id`,`name`,`sphere`,`level`,`incant`) VALUES
-- ('','','','','');
-- INSERT INTO `production` (`id`,`name`,`modifier`,`skill`,`levelrestriction`,`ppcost`,`rmcost`) VALUES
-- ('','','','','','','');
-- INSERT INTO `races` (`id`,`name`,`multipurchase`,`fragcost`,`onsale`) VALUES
-- ('','','','','');
-- INSERT INTO `frags` (`id`,`player`,`jericho`,`kalidor`,`ralinwood`,`havenhollow`,`ashendael`,`stormlands`,`salemruin`,`tempestgrove`,`zenithstrand`,`bryzanthea`) VALUES
-- ('','','','','','','','','','','','');
-- INSERT INTO `skillcosts` (`id`,`skill`,`mercenary`,`ranger`,`templar`,`nightblade`,`assassin`,`witchhunter`,`mage`,`druid`,`bard`,`champion`,`demagogue`) VALUES
-- ('','','','','','','','','','','','','');
-- INSERT INTO `spheres` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `classtypes` (`id`,`type`) VALUES
-- ('','');
