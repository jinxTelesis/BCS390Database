CREATE TRIGGER tPROPSVC_INVOICE_INSERT
ON dbo.propertyService
AFTER INSERT

AS 
	INSERT INTO dbo.ggINVOICE
	VALUES((SELECT DATEADD(day, 15, GETDATE()),
	(Select propertyserviceId from inserted),
	0.8625,
	(select costperhour from dbo.GG_SERVICE
	where ServiceID = (select ServiceID from inserted)
	*(select hoursworked from inserted))),'n');
