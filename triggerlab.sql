CREATE TRIGGER tOWNER_INSERT_UPDATE
on dbo.OWNER
AFTER INSERT

AS

	UPDATE dbo.OWNER
	SET FirstName = UPPER(FirstName),
	LastName = UPPER(LastName)
	WHERE OwnerID in (select OwnerID from inserted);

-- want to automatically bill customer
-- 

CREATE TRIGGER tPROPERTY_SERVICE_INSERT_UPDATE
on dbo.Property_Service
AFTeR INSERT

AS 
	INSERT dbo.PROPERTY_SERVICE VALUES(2,(select dbo.PROPERTY_SERVICE.PropertyServiceID from inserted),7,4,GetDate());


CREATE TRIGGER tPROPSVC_INVOICE_INSERT
ON dbo.propertyService
AFTER INSERT

AS 
	INSERT INTO dbo.ggINVOICE
	VALUES(select DATEADD(day, 15,GETDATE(),(SELECT PROPERTY_SERVICE.PropertyID from inserted.0.8625,152,23,'m');
