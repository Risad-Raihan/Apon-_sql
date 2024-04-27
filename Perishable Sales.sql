SELECT *
FROM (
    SELECT 
      h.strWarehouseName AS Outlet,
      r.intItemId AS "ItemID",
      r.strItemCode AS "Item Code",
      r.strItemName AS "Item Name",
      i.strItemCategoryName AS "Item Category",
      i.strItemSubCategoryName AS "Item Sub Category",
	  h.dteDeliveryDate AS "Date",
      AVG(r.numMRP) AS MRP,
      AVG(r.numItemPrice) AS "Sales Price",
      SUM(numQuantity) AS "Total Quantity",
      SUM(r.numDeliveryValue) AS "Total Sales Amount",
      SUM(r.numTotalDiscountValue) AS "Total Discount",
      CASE
        WHEN r.strItemCode IN ('15552859', '15552858', '15552255', '15551322', '15552256', '15552271', '15553941', '15552352', '15554097', '15552491', '15552492', '15554110', '15552493', '15552494', '15552542', '15554074', '15554094', '15552761', '15554212', '15553794', '15553053', '15553054', '15553061', '15553065', '15553259', '15553310', '15553311', '15553312', '15553489', '15552677', '15552644') THEN 'Perishable'
        WHEN i.strItemSubCategoryName = 'Rice' THEN 'Rice'
        WHEN i.strItemSubCategoryName = 'Soybean Oil' THEN 'Soybean Oil'
        WHEN i.strItemSubCategoryName IN ('Tiffin Item -1' , 'Tiffin Item -2', 'Combo Pack', 'Family Pack') THEN 'Snacks'
        ELSE 'Others'
      END AS 'Item Group'
    FROM 
      [APON].[pos].[tblPosDeliveryRow] r
    JOIN 
      [APON].[pos].[tblPosDeliveryHeader] h ON h.intDeliveryId = r.intDeliveryId
    JOIN
      [APON].[itm].[tblItem] i ON r.intItemId = i.intItemId
    WHERE 
      h.isActive = 1 
      AND r.isActive = 1 
      AND h.dteDeliveryDate BETWEEN '2023-01-01' AND GETDATE()
    GROUP BY 
      h.strWarehouseName, 
      r.intItemId,
      r.strItemCode, 
      r.strItemName,
      i.strItemCategoryName,
      i.strItemSubCategoryName,
	  h.dteDeliveryDate
) AS subquery
WHERE 
  "Item Group" <> 'Others'
ORDER BY 
  Outlet,
  "Item Code";
