SELECT TOP (1000) 
    [intId],
    [intInventoryReference],
    [strInventoryReferenceCode],
    [dteInventoryReferenceDate],
    IRS.[intWarehouseId],
    IRS.[intItemId],
    [numItemQty],
    [dteExpiredDate],
    [monRate],
    [monValue],
    [monSalesRate],
    [monMRP],
    [numBalance],
    IRS.[isAvailable],
    INF.strItemName,
    INF.strItemCode,
	wr.strWarehouseName
FROM 
    [APON].[dbo].[tblInventoryRecordForSales] IRS
LEFT JOIN 
    [APON].[itm].[tblItem] INF ON IRS.intItemId = INF.intItemId
LEFT JOIN wms.tblWarehouse wr on wr.intWarehouseId = IRS.intWarehouseId
WHERE 
    --IRS.intWarehouseId = 10216 AND
    IRS.dteInventoryReferenceDate BETWEEN '2024-01-01' AND '2024-01-10' AND
	IRS.isAvailable = 0
    --AND INF.strItemCode = '15554518'
GROUP BY 
    [intId],
    [intInventoryReference],
    [strInventoryReferenceCode],
    [dteInventoryReferenceDate],
    IRS.[intWarehouseId],
    IRS.[intItemId],
    [numItemQty],
    [dteExpiredDate],
    [monRate],
    [monValue],
    [monSalesRate],
    [monMRP],
    [numBalance],
    [isAvailable],
    INF.strItemName,
    INF.strItemCode,
	wr.strWarehouseName
