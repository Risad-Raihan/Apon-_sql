WITH RankedInventory AS (
    SELECT 
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
        inv.[dteInventoryReferenceDate],
        ROW_NUMBER() OVER (PARTITION BY wr.[intItemId] ORDER BY inv.[dteInventoryReferenceDate] DESC) AS rn
    FROM 
        [APON].[wms].[tblItemPlantWarehouse] wr
    JOIN 
        [APON].[dbo].[tblInventoryRecordForSales] inv ON wr.intItemId = inv.intItemId
    WHERE 
        strWareHouseName = 'MG Niche Stitch Limited'
        AND wr.numCurrentStock > 0
        AND inv.dteInventoryReferenceDate BETWEEN '2024-01-1' AND GETDATE()
)
SELECT 
    [intConfigId],
    [intItemId],
    [strItemName],
    [intAccountId],
    [intBusinessUnitId],
    [strBusinessUnitName],
    [intPlantId],
    [strPlantName],
    [intWarehouseId],
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
    [dteInventoryReferenceDate]
FROM RankedInventory
WHERE rn = 1
ORDER BY [dteServerDateTime] DESC;
