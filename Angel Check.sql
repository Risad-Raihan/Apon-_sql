WITH CustomerSales AS (
  SELECT 
    h.strWarehouseName as Outlet,
    bp.strBusinessPartnerCode as "Customer Code",
    h.strSoldToPartnerName as "Name",
    bp.strContactNumber as "Contact Number",
    FORMAT(h.dteDeliveryDate, 'MMM') as "Purchased Month",
    MAX(h.dteDeliveryDate) as "Date",
    CASE bp.intGenderId
      WHEN 1 THEN 'Male'
      WHEN 2 THEN 'Female'
    END as Gender,
    cinfo.dteJoiningDate as 'Joining Date',
    cinfo.monGrossSalary as 'Gross Salary',
    SUM(r.numDeliveryValue) as "Total Sales Amount",
    bp.isActive as Active
  FROM 
    [APON].[pos].[tblPosDeliveryHeader] h
    JOIN [APON].[pos].[tblPosDeliveryRow] r on h.intDeliveryId = r.intDeliveryId
    JOIN [APON].[prt].[tblBusinessPartner] bp on h.strSoldToPartnerCode = bp.strBusinessPartnerCode
    JOIN [APON].[dbo].[CustomerAdditionalInformation] cinfo on bp.intBusinessPartnerId = cinfo.intCustomerId
    JOIN [APON].[prt].[tblBusinessPartnerSalesCreditLimit] cl on bp.intBusinessPartnerId = cl.intBusinessPartnerId
  WHERE 
    h.isActive = 1 AND
	bp.isActive = 1
    --AND r.isActive = 1 
    AND h.dteDeliveryDate BETWEEN '2023-10-01' AND GETDATE()
  GROUP BY 
    h.strWarehouseName,
    h.strSoldToPartnerName,
    bp.strBusinessPartnerName,
    bp.strBusinessPartnerCode,
    bp.strBusinessPartnerAddress,
    bp.strContactNumber,
    bp.strEmail,
    bp.strNID,
    bp.DteDateOfBirth,
    bp.intGenderId,
    bp.isActive,
    cl.numCreditLimit,
    cinfo.strDepartment,
    cinfo.strDesignation,
    cinfo.dteJoiningDate,
    cinfo.monGrossSalary,
    FORMAT(h.dteDeliveryDate, 'MMM')
)

SELECT
  "Customer Code",
  "Name",
  "Contact Number",
  "Joining Date",
  "Gross Salary",
  outlet,
 
 
  SUM("Total Sales Amount") AS "Total Sales Amount"
FROM
  CustomerSales
WHERE
  "Total Sales Amount" > 1200
GROUP BY
   Outlet,
  "Customer Code",
  "Name",
  "Contact Number",
  "Joining Date",
  "Gross Salary"
 
HAVING
  COUNT(DISTINCT "Purchased Month") >= 2;
