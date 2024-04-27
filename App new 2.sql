SELECT TOP (1000) [intUserId]
      ,[strUserName]
      ,[intAccountId]
      ,[intDefaultBusinessUnit]
      ,[strLoginId]
      ,[strPassword]
      ,[strEmailAddress]
      ,[isDefaultPassword]
      ,[strContact]
      ,[intCountryId]
      ,[strCountryName]
      ,[dtePasswordExpDate]
      ,[intUserType]
      ,[intUserReferenceId]
      ,[strUserReferenceNo]
      ,[isSuperUser]
      ,[isOfficeAdmin]
      ,[intActionBy]
      ,[dteLastActionDateTime]
      ,[dteServerDateTime]
      ,[isActive]
      ,[dteOTPDateTime]
      ,[intUserOTP]
      ,[strDeviceId]
  FROM [APON].[dco].[tblUser]
  where isActive = 1
  and intUserType = 3
  and intUserReferenceId = 19449


 