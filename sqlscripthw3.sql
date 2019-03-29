USE lussar;
GO

DECLARE @GG_INVOICE table
(InvoiceID int,
TotalInvoiceAmt float,
InvoiceDate datetime default GETDATE(),
PropertyId int,
PropertyServiceId int,
TaxAmount float)

DECLARE @fakeIterator int;
SET @fakeIterator=0;
WHILE @fakeIterator < 13
BEGIN
	INSERT INTO @GG_INVOICE (InvoiceID, TotalInvoiceAmt,InvoiceDate,PropertyId,PropertyServiceId,TaxAmount)
	VALUES (@fakeIterator, (SELECT (pps.hoursworked * ggs.CostPerHour * 1.0825) as TotalInvoiceAmt
	FROM dbo.property_service as pps
	JOIN dbo.GG_SERVICE as ggs
	ON pps.ServiceID = ggs.ServiceID WHERE pps.PropertyServiceID = @fakeIterator),
	(SELECT pps.DateofService as InvoiceDate
	FROM dbo.property_service as pps
	WHERE pps.PropertyServiceID = @fakeIterator),
	(SELECT pps.PropertyID as PropertyID
	FROM dbo.property_service as pps
	WHERE pps.PropertyServiceID = @fakeIterator),
	(SELECT pps.PropertyServiceID as PropertyServiceId FROM dbo.property_service as pps
	WHERE pps.PropertyServiceID = @fakeIterator),
	(SELECT (pps.HoursWorked * ggs.CostPerHour * 0.0825) as TaxAmount
	FROM dbo.property_service as pps
	JOIN dbo.GG_SERVICE as ggs
	ON pps.ServiceID = ggs.ServiceID WHERE pps.PropertyServiceID = @fakeIterator))
	SET @fakeIterator = @fakeIterator +1;
END
