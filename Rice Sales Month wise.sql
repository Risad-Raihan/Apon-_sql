SELECT 
  subquery.Outlet,
  subquery.Month,
  SUM(subquery."Total Sales Amount") AS "Monthly Total Sales Amount"
FROM (
    SELECT 
      h.strWarehouseName AS Outlet,
      MONTH(h.dteDeliveryDate) AS Month,
      r.numDeliveryValue AS "Total Sales Amount",
      CASE
	    WHEN r.strItemCode IN ('15552859', '15552858', '15552255', '15551322', '15552256', '15552271', '15553941', '15552352', '15554097', '15552491', '15552492', '15554110', '15552493', '15552494', '15552542', '15554074', '15554094', '15552761', '15554212', '15553794', '15553053', '15553054', '15553061', '15553065', '15553259', '15553310', '15553311', '15553312', '15553489', '15552677', '15552644') THEN 'Perishable'
	    WHEN i.strItemSubCategoryName = 'Rice' THEN 'Rice'
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
      AND h.dteDeliveryDate BETWEEN '2023-1-01' AND GETDATE()
      AND h.strWarehouseName = 'Beximco Industrial Park'
) as subquery
WHERE 
  subquery."Item Group" = 'Rice'
GROUP BY 
  subquery.Outlet,
  subquery.Month
ORDER BY 
  subquery.Outlet,
  subquery.Month
