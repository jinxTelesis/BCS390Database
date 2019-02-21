Select op.PropertyName, ggs.ServiceDescription, ggs.StartDate
FROM OWNER_PROPERTY as op
INNER JOIN PROPERTY_SERVICE as ps
ON ps.PropertyID = OP.PropertyID
INNER JOIN GG_SERVICE as ggs
ON ps.ServiceID = ggs.ServiceID;

Select e.FirstName, e.LastName, ps.DateofService
FROM EMPLOYEE as e 
INNER JOIN PROPERTY_SERVICE as PS
ON e.EmployeeID = ps.EmployeeID
WHERE ps.HoursWorked > 2.5

Select o.FirstName, o.LastName, o.OwnerEmail, op.PropertyName, op.City + ', ' + op.[State] + ', ' + op.StreetNum + ', ' +  op.ZIP as FUllADDRESS
FROM OWNER as o
INNER JOIN OWNER_PROPERTY as op
ON o.OwnerID = op.OwnerID
WHERE o.OwnerType != 'Corporation' AND op.PropertyType = 'Private Residence'
ORDER BY o.lastName desc;

Select DISTINCT op.PropertyName, A2.Appt_Date
FROM GG_APPOINTMENTS2 as A2
INNER JOIN OWNER_PROPERTY as op
ON A2.PropertyID = op.PropertyID
ORDER BY op.PropertyName;
