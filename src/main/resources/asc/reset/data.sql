
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS product; 

CREATE TABLE account (
  accountId int NOT NULL ,
  userId int NOT NULL ,
  amt_paid int NOT NULL ,
  amt_owed int NOT NULL ,
  opened date NOT NULL ,
  active int NOT NULL ,
  comments varchar(255) NOT NULL,
  PRIMARY KEY  (accountId)
);


CREATE TABLE product (
  productId int NOT NULL ,
  name varchar(255) NOT NULL ,
  shortDescription varchar(255) NOT NULL ,
  longDescription varchar(255) NOT NULL ,
  imageFile varchar(255) NOT NULL ,
  available int default NULL,
  PRIMARY KEY  (productId)
);


CREATE TABLE user (
  userId int NOT NULL ,
  login varchar(255) NOT NULL ,
  pass varchar(255) NOT NULL ,
  name varchar(255) NOT NULL ,
  email varchar(255) NOT NULL ,
  admin int default NULL,
  PRIMARY KEY  (userId)
);

INSERT INTO product VALUES (1000,'Seasonal Product','Seasonal Product','Fall product','product1000.jpg',0);
INSERT INTO product VALUES (1001,'First Product','Premier Product','Flagship Product','product1001.jpg',10);
INSERT INTO product VALUES (1002,'Second Product','Regular Product','Best Value Product','product1002.jpg',5);
INSERT INTO product VALUES (1003,'Third Product','Entry Product','Entry-level product','product1003.jpg',4);

INSERT INTO user VALUES (1,'admin','secret','Administrator','admin@mail.com',1);
INSERT INTO user VALUES (2,'asmith','andy','Andy Smith','andy@mail.com',0);
INSERT INTO user VALUES (3,'bmoody','beth','Beth Moody','beth@mail.com',0);
INSERT INTO user VALUES (4,'cjones','chris','Chris Jones','chris@mail.com',0);

INSERT INTO account VALUES (-1,0,0,0,'1981-01-01',0,'Internal Test Account');
INSERT INTO account VALUES (201,2,10,110,'1991-01-01',1,'');
INSERT INTO account VALUES (202,2,20,20,'1991-01-01',1,'');
INSERT INTO account VALUES (301,3,220,220,'1992-02-02',0,'Account Closed 1/1/1998.');
INSERT INTO account VALUES (302,3,220,220,'1992-02-02',0,'Account Closed 1/1/1998.');
INSERT INTO account VALUES (401,4,30,330,'1993-03-03',1,'');
INSERT INTO account VALUES (402,4,5,5,'1993-03-03',1,'');