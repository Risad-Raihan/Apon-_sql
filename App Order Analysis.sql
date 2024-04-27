SELECT 
  h.strWarehouseName as Outlet, 
  h.strDeliveryCode as Challan,  
  h.strSoldToPartnerCode as "Customer Code",
  h.strSoldToPartnerName as "Customer Name",
  h.dteDeliveryDate as Date,  
  SUM(r.numQuantity) as "Total Quantity",
  SUM(r.numMRP) as MRP,
  SUM(r.numItemPrice) as "Sales Price",
  SUM(r.numDeliveryValue) as "Total Sales Amount", 
  SUM(r.numTotalDiscountValue) as "Total Discount",
  SUM(r.numCogs) as COGS,
  h.numCashAmount as "Cash Amount",
  h.numCreditAmount as "Credit Amount",
  h.numCardAmount as "Card Amount",
  h.numMFSAmount as "MFS Amount",
  CASE p.intGenderId
        WHEN 1 THEN 'Male'
        WHEN 2 THEN 'Female'
    END AS Gender

FROM 
  [APON].[pos].[tblPosDeliveryHeader] h
  JOIN [APON].[pos].[tblPosDeliveryRow] r on h.intDeliveryId = r.intDeliveryId
  JOIN [APON].[prt].[tblBusinessPartner] p on h.strSoldToPartnerCode = p.strBusinessPartnerCode
WHERE 
  h.isActive = 1 
  AND r.isActive = 1 
  AND h.dteDeliveryDate BETWEEN '2023-12-01' AND GETDATE()
  AND h.strWarehouseName = 'Interfab Shirt Manufacturing Limited Unit-01'
GROUP BY 
  h.intWarehouseId,
  h.strWarehouseName,
  h.strDeliveryCode,
  h.strSoldToPartnerName,
  h.strSoldToPartnerCode,
  h.dteDeliveryDate,
  h.numCashAmount,
  h.numCreditAmount,
  h.numCardAmount,
  h.numMFSAmount,
  p.intGenderId
  
ORDER BY 
  h.intWarehouseId,
  h.dteDeliveryDate;