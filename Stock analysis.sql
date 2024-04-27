SELECT  [intId]
      ,[intInventoryReference]
      ,[strInventoryReferenceCode]
      ,[dteInventoryReferenceDate]
      ,I.[intWarehouseId]
      ,I.[intItemId]
      ,[numItemQty]
      ,[dteExpiredDate]
      ,[monRate]
      ,[monValue]
      ,[monSalesRate]
      ,[monMRP]
      ,[numBalance]
      ,[isAvailable]
	  ,P.strItemCode
	  --,C.numTotalQty
  FROM [APON].[dbo].[tblInventoryRecordForSales] I
  JOIN [APON].[dtm].[tblItemInventoryInfo20211230] P ON I.intItemId = P.intItemId
  --JOIN [APON].[dbo].[tblInventoryTransactionClosing] C ON I.intItemId = C.intItemId
  Where I.intWarehouseId = '10178' And
  --P.strItemCode = '15552898' AND
  I.dteInventoryReferenceDate between '2024-1-1' and '2024-1-6'
  ORDER BY dteExpiredDate DESC
  

