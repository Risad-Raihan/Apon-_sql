SELECT 
  h.strWarehouseName as Outlet, 
  h.strDeliveryCode as Challan, 
  h.strSoldToPartnerCode as "Customer Code",
  h.strSoldToPartnerName as "Customer Name",
  h.dteDeliveryDate as Date, 
  r.strItemCode as "Item Code", 
  r.strItemName as "Item Name", 
  SUM(numQuantity) as "Total Quantity", 
  r.numMRP as MRP, 
  r.numItemPrice as "Sales Price", 
  SUM(r.numDeliveryValue) as "Total Sales Amount", 
  SUM(r.numTotalDiscountValue) as "Total Discount", 
  r.numCogs as COGS
FROM 
  [APON].[pos].[tblPosDeliveryHeader] h 
  JOIN [APON].[pos].[tblPosDeliveryRow] r ON h.intDeliveryId = r.intDeliveryId 
WHERE 
  h.isActive = 1 
  AND r.isActive = 1 
  AND h.dteDeliveryDate = '2024-02-03'
GROUP BY
  h.dteDeliveryDate,
  h.strWarehouseName,
  h.strDeliveryCode,
  h.strSoldToPartnerCode,
  h.strSoldToPartnerName,
  r.strItemCode,
  r.strItemName,
  r.numMRP,
  r.numItemPrice,
  r.numCogs
ORDER BY 
  h.dteDeliveryDate DESC;
