CREATE PROC spPropertyAPPT
	@propID INT
AS 
BEGIN
	IF EXISTS(SELECT * from dbo.OWNER_PROPERTY as op
		WHERE PROPERTYID = @propID)
		BEGIN
		INSERT into dbo.GG_APPOINTMENTS2
		VALUES (DATEADD(DAY,10,GETDATE()),@propID)

		-- display that record -- need the record that was just created 
		SELECT op.PropertyName, gg.Appt_Date, gg.PropertyID
		from dbo.GG_APPOINTMENTS2 as gg
		JOIN dbo.OWNER_PROPERTY op
		ON gg.PropertyID = op.PropertyID
		WHERE gg.AppointmentsID = @@IDENTITY -- the just created record

		RETURN;
		END
	Else
		PRINT 'Property ID ' + convert(varchar,@propID) + ' does not exist';
	-- print the message
END

EXEC spPropertyAPPT 200;

CREATE PROC spServiceOrder2
	@propertyId int,
	@serviceId int,
	@employeID int,
	@appointmentID int,
	@hoursWorked Decimal

AS
BEGIN

	IF EXISTS(SELECT * from dbo.EMPLOYEE as e
		WHERE e.EmployeeID = @employeID)
		BEGIN
			PRINT 'Employee ID' + convert(varchar,@employeID) + 'Exists!';
		END
	ELSE
		BEGIN
		PRINT 'Employee ID' + convert(varchar,@employeId) + 'does not exist';
		RETURN
		END

	IF(@hoursWorked = null)
	BEGIN
		PRINT 'Hours cant be null, zero or negative'
	END

	IF(@hoursWorked <= 0)
	BEGIN
		PRINT 'Hours cant be null, zero or negative'
	END
	
	IF EXISTS(SELECT * from dbo.OWNER_PROPERTY as op
		WHERE op.PropertyID = @propertyId)
		BEGIN
			PRINT 'Property ID' + convert(varchar,@propertyId) + 'Exists!';
		END
	ELSE
		BEGIN
		PRINT 'Property ID' + convert(varchar,@propertyId) + 'does not exist';
		RETURN
		END

	IF EXISTS(SELECT * from dbo.GG_SERVICE as ggs
		WHERE ggs.ServiceID = @serviceId)
		BEGIN
			PRINT 'Service ID' + convert(varchar,@serviceID) + 'Exists!';
			-- place code to insert new service record 
			--PropertyServiceID	PropertyID	ServiceID	EmployeeID	AppointmentID	HoursWorked	DateofService4
			INSERT into dbo.PROPERTY_SERVICE
			VALUES (@propertyId,@serviceId,@employeID,@appointmentID,@hoursWorked,GETDATE());

		END
	ELSE
		PRINT 'Service ID' + convert(varchar,@serviceID) + ' does not exist';

END

EXEC spServiceOrder2 1,1,1,1,3;
