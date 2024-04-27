SELECT 
  h.strWarehouseName AS Outlet,
  r.intItemId AS "ItemID",
  r.strItemCode AS "Item Code",
  r.strItemName AS "Item Name",
  i.strItemCategoryName AS "Item Category",
  i.strItemSubCategoryName AS "Item Sub Category",
  h.dteDeliveryDate As "Date",
  FORMAT(dteDeliveryDate, 'MMMM') as "Month",
  AVG(r.numMRP) AS MRP,
  AVG(r.numItemPrice) AS "Sales Price",
  SUM(numQuantity) AS "Total Quantity",
  SUM(r.numDeliveryValue) AS "Total Sales Amount",
  SUM(r.numTotalDiscountValue) AS "Total Discount"
FROM 
  [APON].[pos].[tblPosDeliveryRow] r
JOIN 
  [APON].[pos].[tblPosDeliveryHeader] h ON h.intDeliveryId = r.intDeliveryId
JOIN
	[APON].[itm].[tblItem] i ON r.intItemId = i.intItemId
WHERE 
  h.isActive = 1 
  AND r.isActive = 1 
  AND h.dteDeliveryDate Between '2023-01-1' AND '2023-12-17'
  AND r.strItemCode = 15553941
GROUP BY 
  h.strWarehouseName, 
  r.intItemId,
  r.strItemCode, 
  r.strItemName,
  i.strItemCategoryName,
  i.strItemSubCategoryName,
  h.dteDeliveryDate
ORDER BY 
  h.strWarehouseName,
  r.strItemCode;