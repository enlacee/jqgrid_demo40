CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL auto_increment,
  `name` char(120) default NULL,
  PRIMARY KEY  (`client_id`)
) ENGINE=MyISAM;


insert  into `clients`(`client_id`,`name`) values (1,'Client 1'),(2,'Client 2'),(3,'Client 3');


CREATE TABLE `invheader` (
  `id` int(11) NOT NULL auto_increment,
  `invdate` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL default '0.00',
  `tax` decimal(10,2) NOT NULL default '0.00',
  `total` decimal(10,2) NOT NULL default '0.00',
  `note` char(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM ;


insert  into `invheader`(`id`,`invdate`,`client_id`,`amount`,`tax`,`total`,`note`) values (1,'2007-10-01',1,'100.00','20.00','120.00','note 1'),(2,'2007-10-03',1,'200.00','40.00','240.00','note 2'),(3,'2007-10-02',2,'300.00','60.00','360.00','note for invoice 3'),(4,'2007-10-04',3,'150.00','0.00','150.00','no tax'),(5,'2007-10-05',3,'100.00','0.00','100.00','no tax'),(6,'2007-10-05',1,'50.00','10.00','60.00',NULL),(7,'2007-10-05',2,'120.00','12.00','134.00',NULL),(8,'2007-10-06',3,'200.00','0.00','200.00',NULL),(9,'2007-10-06',1,'200.00','40.00','240.00',NULL),(10,'2007-10-06',2,'100.00','20.00','120.00',NULL),(11,'2007-10-06',1,'600.00','120.00','720.00',NULL),(12,'2007-10-06',2,'700.00','140.00','840.00',NULL),(13,'2007-10-06',3,'1000.00','0.00','1000.00',NULL);


CREATE TABLE `invlines` (
  `id` int(11) NOT NULL,
  `num` int(11) NOT NULL auto_increment,
  `item` char(20) default NULL,
  `qty` decimal(8,2) NOT NULL default '0.00',
  `unit` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`id`,`num`)
) ENGINE=MyISAM ;


insert  into `invlines`(`id`,`num`,`item`,`qty`,`unit`) values (1,1,'item 1','1.00','20.00'),(1,2,'item 2','2.00','40.00'),(2,1,'item 1','2.00','20.00'),(2,2,'item 2','4.00','40.00'),(3,1,'item 3','1.00','100.00'),(3,2,'item 4','1.00','200.00'),(4,1,'item 1','1.00','100.00'),(4,2,'item 2','1.00','50.00'),(5,1,'item 3','1.00','100.00'),(6,1,'item 4','1.00','50.00'),(7,1,'item 5','2.00','10.00'),(7,2,'item 1','1.00','100.00'),(8,1,'item 3','1.00','50.00'),(8,2,'item 2','1.00','120.00'),(8,3,'item 3','1.00','30.00'),(9,1,'item 6','1.00','140.00'),(9,2,'item 3','1.00','60.00'),(10,1,'item 5','3.00','10.00'),(10,2,'item 4','1.00','70.00'),(11,1,'item 1','2.00','100.00'),(11,2,'item 2','3.00','50.00'),(11,3,'item 3','1.00','50.00'),(11,4,'item 4','1.00','200.00'),(12,1,'item 4','1.00','300.00'),(12,2,'item 2','1.00','400.00'),(13,1,'item 13','1.00','1000.00');

CREATE TABLE items (item_id INT UNSIGNED not null AUTO_INCREMENT,item VARCHAR (200),item_cd VARCHAR (15),PRIMARY KEY ( item_id ));

alter table `invheader` add column `closed` char (3) DEFAULT 'No' NULL  after `note`, add column `ship_via` char (3)  NULL  after `closed`;


-- TABLA NO EXISTE EN EL DEMO JQGRID 3.6
-- @url http://www.trirand.com/blog/?page_id=393/treegrid/tree-grid-database-sql-demo-bug/
CREATE TABLE IF NOT EXISTS `accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `acc_num` varchar(128) NOT NULL,
  `debit` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`account_id`)
) ;


INSERT INTO accounts VALUES(1,NULL,'A1'   ,100001,11,12,13,0,1,14);
INSERT INTO accounts VALUES(2,1,   'A11'  ,100011,111,112,113,1,2,3);
INSERT INTO accounts VALUES(3,1,   'A12'  ,100012,121,122,123,1,4,11);
INSERT INTO accounts VALUES(4,1,   'A13'  ,100013,131,132,133,1,12,13);
INSERT INTO accounts VALUES(5,3,   'A121' ,100121,1211,1212,1213,2,5,8);
INSERT INTO accounts VALUES(6,3,   'A122' ,100122,1221,1222,1223,2,9,10);
INSERT INTO accounts VALUES(7,5,   'A1211',101211,12111,12112,12113,3,6,7);