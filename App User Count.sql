SELECT [intUserId]
      ,[strUserName]
      ,[strLoginId]
      ,[strPassword]
      ,CASE intUserType
			WHEN 1 THEN 'Employee'
			WHEN 2 THEN 'Supplier'
			WHEN 3 THEN 'Customer'
			WHEN 4 THEN 'Other'
		END AS Type
      ,[strContact]
      ,[intUserReferenceId]
      ,[isActive]
      ,[dteOTPDateTime]
      ,[intUserOTP]
	  
  FROM [APON].[dco].[tblUser]
  Where intUserType = 3

  AND isActive = 1 
 --AND dteOTPDateTime = '2024-2-11'
  --order by dteOTPDateTime desc
  
  
  
  