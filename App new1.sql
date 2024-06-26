SELECT TOP (1000) [intBusinessPartnerId]
      ,[intAccountId]
      ,[intBusinessUnitId]
      ,[strBusinessPartnerCode]
      ,[strBusinessPartnerName]
      ,[strBusinessPartnerNameBangla]
      ,[strBusinessPartnerAddress]
      ,[intOdooReferenceId]
      ,[numDistributorCreditLimit]
      ,[strContactNumber]
      ,[strBIN]
      ,[strLicenseNo]
      ,[strEmail]
      ,[strNID]
      ,[DteDateOfBirth]
      ,[intGenderId]
      ,[intBusinessPartnerTypeID]
      ,[strPartnerSalesType]
      ,[intTaxBracketId]
      ,[strAttachmentLink]
      ,[intActionBy]
      ,[dteLastActionDateTime]
      ,[dteServerDateTime]
      ,[isActive]
      ,[intMfsId]
      ,[IntMfsNumber]
      ,[intTotalPrintCount]
      ,[strFactoryName]
      ,[intFactoryId]
      ,[isAppUser]
      ,[isTermAndCondition]
      ,[strImageUrl]
      ,[dteLastDeliveryDate]
      ,[isBulkUpdate]
      ,[numPoint]
  FROM [APON].[prt].[tblBusinessPartner]
  where intBusinessPartnerTypeID = 2 

