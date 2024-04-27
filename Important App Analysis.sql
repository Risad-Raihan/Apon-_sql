SELECT  [intOTPID],
        [intUserTableID],
        [intOTP],
        [dteOTPCreateDateTime],
        [intOTPValidateTime],
        [intOTPTypeId],
        [strOTPTypeName],
			CASE u.intUserType
			WHEN 1 THEN 'Employee'
			WHEN 2 THEN 'Supplier'
			WHEN 3 THEN 'Customer'
			WHEN 4 THEN 'Other'

		END AS Type
		

		
  FROM [APON].[prt].[tblUserOTP] o
  JOIN [APON].[dco].[tblUser]u ON  o.intUserTableID = u.intUserId 
  WHERE --[dteOTPCreateDateTime] > '2023-12-1'
   [strOTPTypeName] = 'Registration' AND u.isActive =1
  
  ;


