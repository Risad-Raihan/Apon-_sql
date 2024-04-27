SELECT * 
	FROM(
		SELECT 
	  h.strWarehouseName AS Outlet,
	  r.intItemId AS "ItemID",
	  r.strItemCode AS "Item Code",
	  r.strItemName AS "Item Name",
	  i.strItemCategoryName AS "Item Category",
	  i.strItemSubCategoryName AS "Item Sub Category",
	  h.dteDeliveryDate As "Date",
	  AVG(r.numMRP) AS MRP,
	  AVG(r.numItemPrice) AS "Sales Price",
	  SUM(numQuantity) AS "Total Quantity",
	  SUM(r.numDeliveryValue) AS "Tot al Sales Amount",
	  SUM(r.numTotalDiscountValue) AS "Total Discount",
	  CASE
		WHEN r.strItemCode IN ('15553259', '15553054', '15553053','15554094', '15554074', '15552494', '15552493', '15554110', '15552492', '15552491', '15554097', '15552256', '15551322', '15552255', '15552858', '15552859','15553172','15554627','15552505' ) THEN 'Fruits and Vegetables'
		WHEN r.strItemCode IN('15552352','15553941') THEN 'Meat'
		WHEN r.strItemCode IN('15552644','15552677','15553489','15553312','15553311','15553310','15553065','15553061','15554212','15552761','15552271') THEN 'Fish'
		WHEN r.strItemCode IN('15552542','15553794') THEN 'Egg'
		ELSE 'Others'
		END AS 'Item Group'
	FROM 
	  [APON].[pos].[tblPosDeliveryRow] r
	JOIN 
	  [APON].[pos].[tblPosDeliveryHeader] h ON h.intDeliveryId = r.intDeliveryId
	JOIN
		[APON].[itm].[tblItem] i ON r.intItemId = i.intItemId
	WHERE 
	  --h.isActive = 1 
	  --r.isActive = 1 
	  h.dteDeliveryDate BETWEEN '2022-1-01' AND '2022-12-31'
  
	GROUP BY 
	  h.strWarehouseName,
	  h.dteDeliveryDate,
	  r.intItemId,
	  r.strItemCode, 
	  r.strItemName,
	  i.strItemCategoryName,
	  i.strItemSubCategoryName	
	) As Subquery
 Where "Item Group" <> 'Others'
