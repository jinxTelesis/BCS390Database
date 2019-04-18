CREATE TABLE BUILDINGS(
bID INT NOT NULL IDENTITY(1,1),
bName varchar(150),
bStreet varchar(60),
bCity varchar(40),
bState varchar(2),
bZip Int,
bPrimaryAdmin varchar(50)
CONSTRAINT bID_PK PRIMARY KEY(bID));

INSERT INTO BUILDINGS VALUES('Memorial Sloan Kettering Cancer Center','1275 York Ave','New York City','NY',10065,'Malcom pizel'),
('Schwartz Research Building','1250 1st Avenue','New York City','NY',10065,'Peter gaberial'),
('Memorial Sloan Kettering Breast Examination Center of Harlem','163 West 125th','New York City','NY',10027,'Gumby jim'),
('Memorial Sloan Kettering Evelyn H. Lauder Breast Center','300 East 66th Street floors 1-4','New York City','NY',10065,'Bobby jean'),
('Mortimer B. Zuckerman Research Center','417 E 68th St', 'New York City','NY',10065,'Chris tragier'),
('Memorial Sloan Kettering Josie Robertson Surgery Center','1133 York Ave','New York City','NY',10065,'Billy Bob'),
('Memorial Sloan Kettering 60th Street Outpatient Center','16E 60th St', 'New York City','NY',10022,'Jim Gross'),
('Sidney Kimmer Center for Prostage and Urologic Cancers','353 E 68th', 'New York City','NY',10065,'Bread Johnson'),
('Rockerfeller Research Laboratories','430 E 67th St','New York City', 'NY',10065,'Mr Bean');

CREATE TABLE SERVICE_PROVIDERS(
sProviderID INT NOT NULL IDENTITY(1,1),
sProviderName varchar(50),
sProviderDescription varchar(250),
sProviderPrimaryContact varchar(50),
sProviderNumber varchar(15),
sProviderRating varchar(2),
CONSTRAINT sProviderID_PK PRIMARY KEY(sProviderID)
);

INSERT INTO SERVICE_PROVIDERS VALUES(
'GE','GENERAL ELECTRIC HEALTH SERVICES','Franky gym','128-121-1211','AA'),
('ABIOMED','Medical Implant Devices','ross toss','199-199-9991','AB'),
('Boston Scientific','Transforming lives through innovation','timmy timmy','188-188-1880','AA'),
('Medtronic','Worlds Largest medical Device company','George fluke','102-200-1919','AA'),
('Edwards Lifesciences','American medical equipment company','Michael a Mussallem','103-207-1818','AB'),
('Hill-Rom Holdings','Makes hosptial beds','John Greisch','999-999-1212','CC'),
('The Cooper Companies','Quality of life company','Brain G Andrews','121-111-1912','AB'),
('McKesson','Ambulatory and post-acute care company','Bert Lopper','855-571-2100','AC'),
('MedLine','On the frontlines of healthcare','Moaath Alrajab','191-121-2222','AB'),
('AvaCare Medical','We care, Were here to help','Gregory Bith','199-111-1212','AB'),
('J&B Medical Supply', 'INSURANCE COVERED SUPPLIES','Mith rosswork','118-999-1212','AA');

CREATE TABLE SERVICE_CONTRACT(
sCID int NOT NULL IDENTITY(1,1),
sCProvider int,
sContractCostPY int,
sCtimeToHonor int,
sCRating varchar(10)
CONSTRAINT sCID_PK PRIMARY KEY(sCID)
CONSTRAINT sCID_FK1 FOREIGN KEY(sCProvider) 
REFERENCES SERVICE_PROVIDERS(sProviderID)
ON DELETE NO ACTION
ON UPDATE NO ACTION);

INSERT INTO SERVICE_CONTRACT VALUES
(1,10000,3,'AAA'),
(1,12500,7,'AAB'),
(1,100000,14,'AAA'),
(1,750,1,'ABB'),
(2,17000,8,'BAA'),
(2,28000,9,'BAA'),
(3,1000,14,'CBA'),
(3,7000,14,'BBA'),
(3,34000,14,'BAA'),
(3,900,14,'AAA'),
(4,1200,2,'AAA'),
(4,12800,3,'AAB'),
(4,39000,4,'AAA'),
(5,190000,15,'AAB'),
(5,50000,5,'ACB');




CREATE TABLE LARGE_SITE_EQUID_MED
(
LargeEID int NOT NULL IDENTITY(1,1),
LEName varchar(50),
LELoc varchar(10),
LEOwnershipDate DATE,
LECondition varchar(10),
LEAverageUsePerYear int,
LDescription varchar(250),
LCostPerYear money,
sCID int, -- fk
bID int, -- fk
CONSTRAINT LargeEID_PK PRIMARY KEY(LargeEID),
CONSTRAINT bID_FK_LSEM FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT LServContractID_FK FOREIGN KEY(sCID) 
REFERENCES SERVICE_CONTRACT(sCID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

INSERT INTO LARGE_SITE_EQUID_MED VALUES(
'MRI','ARD',GETDATE(),'good',800,'Advanced MRI machine',50000,1,1),
('CENTERFUGE','ARC',GETDATE() +1,'great',10,'Radiological seperation',300000,1,2),
('Radiological locker','RRC',GETDATE() +10,'used',0,'Safe storage',30000,1,3),
('Robogic Surgen Machine','DADD',GETDATE() +15,'NEW',700,'Remote surgical arm and chamber',17000,3,1),
('Laser for sepectral seperation','ABB',GETDATE() +1,'NEW',2000,'Laser for spectromitry',100000,5,2),
('Nuclear Cardiology','AHB',GETDATE() -100,'OLD',700,'Nuclear cardiology machine',100000,2,2),
('Cardiovascular Ultrasound','AHd',GETDATE() -70,'Used',500,'High sensativity Cardiovascular Ultrasound',10000,2,3),
('AI Digonostic Machine','ARP',GETDATE() +120,'NEW',2000,'AI that takes in symptoms and delivers most likely cause',1000000,5,7),
('4D voxel visualsation','ABA',GETDATE() +150,'NEW',1200,'Machine that looks a tumors in higher dimensions',5000,7,7),
('AVANCE','DRP',GETDATE() +120,'NEW',2000,'Aethesia Machine',70000,7,7);


CREATE TABLE MEDIUM_EQUIP_MED
(
mEID int NOT NULL IDENTITY(1,1),
mEName varchar(50),
mELoc varchar(10),
mEOwnershipDate DATE,
mECondition varchar(10),
mEAverageUsePerYear int,
mDescription varchar(250),
mCostPerYear money,
sCID int, -- fk
bID int --fk
CONSTRAINT mEID_PK PRIMARY KEY(mEID),
CONSTRAINT bID_FK_MEM FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT SERVICE_CONTRACT_FK_MEM FOREIGN KEY(sCID) 
REFERENCES SERVICE_CONTRACT(sCID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

INSERT INTO MEDIUM_EQUIP_MED VALUES
('Aisys Carestation','AAB',GETDATE() -1000,'Great',100,'A mobile care station',1000,3,3),
('ecoFlow','CCC',GETDATE() -700,'Great',100,'Breathing aid',5000,3,1),
('Aespire','CDC',GETDATE() -500,'USED',1700,'Monitoring station',5000,3,8),
('Aestiva','CDd',GETDATE() -100,'USED',17000,'Advanced Monitoring staion',5000,9,1),
('Aestiva','CDd',GETDATE() -100,'USED',17000,'Advanced Monitoring staion',5000,9,1),
('Tomography Station','RRR',GETDATE() -1200,'USED',100,'State of the art Tomography station',3000,1,1),
('Dianostic ECG','RRR',GETDATE() -1700,'USED',80,'old ECG machine',1900,1,2),
('1.5 T','DGF', GETDATE() -1000,'USED',150,'smaller MRI machine',200000,3,4),
('3.0 T','DDD',GETDATE() -3000,'OLD',200,'large MRI Machine',200000,5,5),
('AIR TECH', 'EFD',GETDATE() - 200,'NEW',1000,'Less enclosed MRI',125000,7,7);

CREATE TABLE SMALL_EQUIP_MED
(
sEID int NOT NULL IDENTITY(1,1),
sEName varchar(50),
sELoc varchar(10),
sEOwnershipDate Date,
sEAverageUserPerYear int,
sDescription varchar(250),
sCostPer money,
sCurrentLoc varchar(10),
sCID int, --fk
bID int -- fk
CONSTRAINT sEID_PK PRIMARY KEY(sEID),
CONSTRAINT bID_FK_SEM FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT SERVICE_CONTRACT_FK_SEM FOREIGN KEY(sCID) 
REFERENCES SERVICE_CONTRACT(sCID)
ON DELETE NO ACTION
ON UPDATE NO ACTION 
);

CREATE TABLE COMPUTERS
(
computerID int NOT NULL IDENTITY(1,1),
[type] varchar(2),
cost money,
softwareID1 int,
softwareID2 int,
softwareID3 int,
softwareID4 int,
softwareID5 int,
cCurrentLoc varchar(10),
cPurchaseDate Date,
sCID int, --fk
bID int -- fk
CONSTRAINT computerID_PK PRIMARY KEY(computerID),
CONSTRAINT bID_FK_C FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT SERVICE_CONTRACT_FK_c FOREIGN KEY(sCID) 
REFERENCES SERVICE_CONTRACT(sCID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);


CREATE TABLE OFFICE_EQUIPMENT
(
oEID int NOT NULL IDENTITY(1,1),
oEName varchar(50),
oELoc varchar(10),
oEOwnershipDate Date,
oECondition varchar(10),
oEDescription varchar(250),
oCurrentLoc varchar(10),
bID int -- fk
CONSTRAINT oEID PRIMARY KEY(oEID),
CONSTRAINT bID_FK_OE FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
);

CREATE TABLE OFFICE_SUPPLIES
(
oSID int NOT NULL IDENTITY(1,1),
oSName varchar(50),
oSBuilding int,
oSHistoricUse int,
oSCost money,
oSCurrentSupplier varchar(50),
oSnumber int,
oSReorderID int, --fk -- not done
bID int -- fk
CONSTRAINT oSID_PK PRIMARY KEY(oSID),
CONSTRAINT bID_FK_OS1 FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
);

-- this needs those two fk inserted
CREATE TABLE SUPPLY_REORDER_LEVELS
(
sReorderID int NOT NULL IDENTITY(1,1),
sRORDERLEVEL int,
sRestockTime int,
oSID int, -- one or the other
oEID int, -- one or the other
CONSTRAINT sReorderID_PK PRIMARY KEY(sReorderID),
CONSTRAINT oEID_FK1 FOREIGN KEY(oEID)
REFERENCES OFFICE_EQUIPMENT(oEID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT oSID_FK1 FOREIGN KEY(oSID)
REFERENCES OFFICE_SUPPLIES(oSID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
);

CREATE TABLE BUILDING_OFFICE_INVENTORY
(
inventoryID int NOT NULL IDENTITY(1,1),
bID int, -- fk
sROrderID int --fk with SUPPLY_REODER_LEVELS
CONSTRAINT inventoryID PRIMARY KEY(inventoryID),
CONSTRAINT bID_FK_BOI FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT sROrderIDFK FOREIGN KEY(sROrderID)
REFERENCES SUPPLY_REORDER_LEVELS(sReorderID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
);

CREATE TABLE DISPOSABLE_MEDICIAL_SUPPLIES
(
dMSID int NOT NULL IDENTITY(1,1),
dMSNAME varchar(50),
dMSBuilding int,
dMSHistoricUSE int,
dMSCost money,
dMSCurrentSupplier int,
dMSNumber int,
bID int
CONSTRAINT dMSID_PK PRIMARY KEY(dMSID)
CONSTRAINT bID_FK_DMS FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
);


CREATE TABLE RadioLogical
(
rLID int NOT NULL IDENTITY(1,1),
rLName varchar(50),
rLBuilding int,
rLStateInspection varchar(10),
rLLisence varchar(10),
rLDispoal varchar(50),
rLCostPerUnit money,
bID int -- fk
CONSTRAINT rLID_PK PRIMARY KEY(rLID),
CONSTRAINT bID_FK_R FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE TABLE MedicalWaste
(
mWID int NOT NULL IDENTITY(1,1),
mWType varchar(10),
mWBuilding int,
mWLimit int,
mWCurrent int,
mwRegularRemoval date,
bID int -- fk 
CONSTRAINT mWID_PK PRIMARY KEY(mWID),
CONSTRAINT bID_FK_MW1 FOREIGN KEY(bID) 
REFERENCES BUILDINGS(bID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
);
