SELECT DISTINCT 
    [intConfigId],
    wr.[intItemId],
    [strItemName],
    [intAccountId],
    [intBusinessUnitId],
    [strBusinessUnitName],
    [intPlantId],
    [strPlantName],
    wr.[intWarehouseId],
    [strWareHouseName],
    [IntInventoryLocationId],
    [intBaseUOMId],
    [strBaseUOM],
    [strBinNumber],
    [numGrossWeight],
    [numNetWeight],
    [intActionBy],
    [numCurrentStock],
    [numBlockStock],
    [numCOGS],
    [isManualCOGS],
    [intInventoryStockTypeId],
    [dteLastActionDateTime],
    [dteServerDateTime],
    [isActive],
    [isMultipleUOM],
    [numDemandPercentage],
    [numDamageQty],
    [isAppItem],
	inv.[dteInventoryReferenceDate]
FROM 
    [APON].[wms].[tblItemPlantWarehouse] wr
JOIN 
    [APON].[dbo].[tblInventoryRecordForSales] inv ON wr.intItemId = inv.intItemId
WHERE 
    strWareHouseName = 'MG Niche Stitch Limited'
    AND wr.numCurrentStock > 0
	AND inv.dteInventoryReferenceDate between '2024-01-1' and GETDATE()

ORDER BY 
    dteServerDateTime DESC;