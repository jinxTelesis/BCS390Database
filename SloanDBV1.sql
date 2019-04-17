CREATE TABLE BUILDINGS(
bID INT NOT NULL IDENTITY(1,1),
bName varchar(50),
bStreet varchar(60),
bCity varchar(40),
bState varchar(2),
bZip Int,
bPrimaryAdmin varchar(50)
CONSTRAINT bID_PK PRIMARY KEY(bID));

CREATE TABLE SERVICE_CONTRACT(
sCID int NOT NULL IDENTITY(1,1),
sCProvider varchar(50),
sContractCostPY int,
sCtimeToHonor DATE,
sCRating varchar(10)
CONSTRAINT sCID_PK PRIMARY KEY(sCID));

CREATE TABLE SERVICE_PROVIDERS(
sProviderID INT NOT NULL IDENTITY(1,1),
sProviderName varchar(50),
sProviderDescription varchar(250),
sProviderPrimaryContact varchar(50),
sProviderNumber varchar(15),
sProviderRating varchar(2),
CONSTRAINT sProviderID_PK PRIMARY KEY(sProviderID)
);

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
LCurrentLoc varchar(10),
LSerContractID int
CONSTRAINT LargeEID_PK PRIMARY KEY(LargeEID)
);

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
mCurrentLoc varchar(10),
mSerContractID int
CONSTRAINT mEID_PK PRIMARY KEY(mEID)
);

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
sSerContractID int
CONSTRAINT sEID_PK PRIMARY KEY(sEID) 
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
cServiceContractID int,
CONSTRAINT computerID_PK PRIMARY KEY(computerID)
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
oSReorderID int
CONSTRAINT oSID_PK PRIMARY KEY(oSID)
);

CREATE TABLE BUILDING_OFFICE_INVENTORY
(
inventoryID int NOT NULL IDENTITY(1,1),
buildingID int,
sROrderID int
CONSTRAINT inventoryID PRIMARY KEY(inventoryID)
);

CREATE TABLE SUPPLY_REORDER_LEVELS
(
sReorderID int NOT NULL IDENTITY(1,1),
sRORDERLEVEL int,
sRestockTime int,
oSID int,
oEID int,
CONSTRAINT sReorderID_PK PRIMARY KEY(sReorderID)
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
dMSReorderID int,
CONSTRAINT dMSID_PK PRIMARY KEY(dMSID)
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
rLReorderID int
CONSTRAINT rLID_PK PRIMARY KEY(rLID)
);

CREATE TABLE MedicalWaste
(
mWID int NOT NULL IDENTITY(1,1),
mWType varchar(10),
mWBuilding int,
mWLimit int,
mWCurrent int,
mwRegularRemoval date,
CONSTRAINT mWID_PK PRIMARY KEY(mWID)
);
