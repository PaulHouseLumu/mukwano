CREATE DATABASE if not exists mukwanoHouseHoldsdb;

use mukwanoHouseHoldsdb;

/* Check the existence of the role table */
drop table if exists tblRole;

/*Create role table*/
CREATE TABLE `tblRole` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `role_name` varchar(64) NOT NULL,

                           PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

/* Insert Default Constant Values */
INSERT INTO `tblRole` (`id`,`role_name`) VALUES (1,'manager');
INSERT INTO `tblRole` (`id`,`role_name`) VALUES (2,'employee');



/* Check the existence of the employee table */
drop table if exists tblEmployee;

/*Create employee table*/
CREATE TABLE `tblEmployee` (
                              `id` INT(11) NOT NULL AUTO_INCREMENT,
                              `tblRole_id` INT(11) NOT NULL,
                              `first_name` VARCHAR(64) NOT NULL,
                              `last_name` VARCHAR(64) NOT NULL,

                              PRIMARY KEY (`id`),
                              CONSTRAINT FK_tblRole_id FOREIGN KEY (`tblRole_id`) REFERENCES tblRole(`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `tblEmployee` (`id`,`tblRole_id`,`first_name`,`last_name`) VALUES (1,'1','Paul','Lumu');
/*INSERT INTO `tblEmployee` (`id`,`role_id`,`first_name`,`last_name`) VALUES (2,'1','Khalid','Luwaki');*/


/* Check the existence of the ProductLine table */
drop table if exists tblProductLine;

/*Create ProductLine table*/
CREATE TABLE `tblProductLine` (
                                  `id` INT(11) NOT NULL AUTO_INCREMENT,
                                  `product_line_name` VARCHAR(64) NOT NULL,
                                  `product_line_staff_allocation` INT(11) NOT NULL,
                                  `product_line_total_sales` INT(11) NOT NULL,

                                  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

/* Insert Default Values*/
INSERT INTO `tblProductLine` (`id`,`product_line_name`,`product_line_staff_allocation`, `product_line_total_sales`) VALUES (1,'Bakery',1, 1);
INSERT INTO `tblProductLine` (`id`,`product_line_name`,`product_line_staff_allocation`, `product_line_total_sales`) VALUES (2,'Pastery',1, 1);
INSERT INTO `tblProductLine` (`id`,`product_line_name`,`product_line_staff_allocation`, `product_line_total_sales`) VALUES (3,'Dairy',1, 1);
INSERT INTO `tblProductLine` (`id`,`product_line_name`,`product_line_staff_allocation`, `product_line_total_sales`) VALUES (4,'Beverages',1, 1);


/* Check the existence of the ProductLineLineCategory table */
drop table if exists tblProductLineCategory;

/*Create ProductLine table*/
CREATE TABLE `tblProductLineCategory` (
                                  `id` INT(11) NOT NULL AUTO_INCREMENT,
                                  `tblProductLine_id` INT(11) NOT NULL ,
                                  `product_line_category_name` VARCHAR(64) NOT NULL,
                                  `product_line_category_staff_allocation` INT(11) NOT NULL,

                                  PRIMARY KEY (`id`),
                                  CONSTRAINT FK_tblProductLine_id FOREIGN KEY (`tblProductLine_id`) REFERENCES tblProductLine(`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


/* Check the existence of the Product table */
drop table if exists tblProduct;

/*Create Product table*/
CREATE TABLE `tblProduct` (
                                  `id` INT(11) NOT NULL AUTO_INCREMENT,
                                  `tblProductLine_id` INT(11) NOT NULL,
                                  `tblProductLineCategory_id` INT(11) NOT NULL,
                                  `product_total_likings` INT(11) NOT NULL,

                                  PRIMARY KEY (`id`),
                                  CONSTRAINT FK_tblProductLines_id FOREIGN KEY (`tblProductLine_id`) REFERENCES tblProductLine(`id`),
                                  CONSTRAINT FK_tblProductLineCategory_id FOREIGN KEY (`tblProductLineCategory_id`) REFERENCES tblProductLineCategory(`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


/* Check the existence of the Likings table */
drop table if exists tblLikings;

/*Create Likings table*/
CREATE TABLE `tblLikings` (
                              `id` INT(11) NOT NULL AUTO_INCREMENT,
                              `tblProduct_id` INT(11) NOT NULL,

                              PRIMARY KEY (`id`),
                              CONSTRAINT FK_tblProduct_id FOREIGN KEY (`tblProduct_id`) REFERENCES tblProduct(`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



/* Check the existence of the Customer table */
drop table if exists tblCustomer;

/*Create Customer table*/
CREATE TABLE `tblCustomer` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `full_name` varchar(64) NOT NULL,
                              `gender` varchar(64) NOT NULL,
                              `location` varchar(64) NOT NULL,

                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


/* Check the existence of the Sales table */
drop table if exists tblSales;

/*Create Sales table*/
CREATE TABLE `tblSales` (
                              `id` INT(11) NOT NULL AUTO_INCREMENT,
                              `tblProduct_id` INT(11) NOT NULL,
                              `number_of_pieces_sold` INT(11) NOT NULL,
                              `date` TIMESTAMP NOT NULL,

                              PRIMARY KEY (`id`),
                              CONSTRAINT FK_tblProductSales_id FOREIGN KEY (`tblProduct_id`) REFERENCES tblProduct(`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;




