USE lussar;
GO
DECLARE @ResultVar int 
SET @ResultVar = (Select COUNT(*)
FROM GG_APPOINTMENTS2)

--Steo 1: Declare the variable
DECLARE @svcCount int;
-- Step2: assign the total number of services to the variable
SET @svcCount = (Select count(8) from dbo.GG_SERVICE)
-- Step3: Check for greater than 0 condition
IF @svcCount > 0
	Print 'COUNT = ' + CONVERT(varchar,@svcCount) -- print statement can only use string values
ELSE
	print 'Count is less than 0'

-- step 1 join
USE lussar;
GO

DECLARE @GG_INVOICE table
(InvoiceID int,
TotalInvoiceAmt float,
InvoiceDate datetime default GETDATE(),
PropertyId int,
PropertyServiceId int,
TaxAmount float)

INSERT @GG_INVOICE 
SELECT pps.PropertyID, (pps.hoursworked * ggs.CostPerHour * 1.0825) as TotalInvoiceAmt,pps.DateofService, pps.PropertyID as propID, pps.PropertyServiceID, (pps.HoursWorked * ggs.CostPerHour * 0.0825) as TaxAmount
FROM dbo.property_service as pps
JOIN dbo.GG_SERVICE as ggs
ON pps.ServiceID = ggs.ServiceID;

Declare @gginvoiceOver100 int;
set @gginvoiceOver100 = (select count(*) from @GG_INVOICE
WHERE TotalInvoiceAmt > 100)

if @gginvoiceOver100 > 0
	PRINT ' there are ' + CONVERT(varchar,@gginvoiceOver100,1)
ELSE
	PRINT ' All invoices are less than 100'

Declare @countServices int;
Declare @averageCostPerHourSev float;

SET @countServices = (select count(ggs.ServiceID) from dbo.GG_SERVICE as ggs)
SET @averageCostPerHourSev = (select count(ggs2.ServiceID) from dbo.GG_SERVICE as ggs2)

if @countServices >= 7
	PRINT ' Services count is ' + CONVERT(varchar, @countServices,1) + ' Average Cost Per Hour is ' + CONCERT(varchar, @averageCostPerHourSev)
ELSE
	PRINT 'The number of svices is less than 7'
