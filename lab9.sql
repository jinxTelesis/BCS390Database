SELECT (DATEADD(DAY,15,Appt_Date)) as ModifiedAppointmentDate, op.PropertyName as PropertyName, o.FirstName + ' ' + o.LastName as OwnersName,
o.OwnerEmail as OwnersEmailAddress, Appt_Date as CurrentAppointmentDate
FROM GG_APPOINTMENTS2 as ggA
JOIN OWNER_PROPERTY as op
ON gga.PropertyID = op.PropertyID
JOIN OWNER as o
ON o.OwnerID = op.OwnerID

SELECT op.PropertyName as propName, pps.HoursWorked as HoursWork, ggs.CostPerHour as HourlyCost,(ggs.CostPerHour * pps.HoursWorked) as totalServiceCost
FROM GG_SERVICE as ggs 
JOIN PROPERTY_SERVICE as pps
ON ggs.ServiceID = pps.ServiceID
JOIN OWNER_PROPERTY as op
ON pps.PropertyID = op.PropertyID
