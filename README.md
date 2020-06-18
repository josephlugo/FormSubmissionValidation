## FormSubmissionValidation 

FormSubmissionValidation is an open source sample solution for managing [containerized applications]
across multiple hosts. It provides basic mechanisms for bootstrap validations, maintenance,
and scaling of applications, while registering data using web forms.

FormSubmissionValidation calls a jQuery Modal Confirmation Dialog when data has been validated,
submitting the Form and redirecting the user to a confirmation page, where it can start another request.

## Requirements

1. [Visual Studio 2015 or later](https://visualstudio.microsoft.com/downloads/).
2. [SQL Server 2016 or later](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).
3. [SSMS](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15).

## To start testing FormSubmissionValidation

1. Download and restore locally Nortwind database following the [available instructions](https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/northwind-pubs).
2. Create the following stored procedure:

```sql
USE [Northwind]
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerIDByContactName]    Script Date: 6/18/2020 11:40:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[GetCustomerIDByContactName] @ContactName nvarchar(30)
AS
SELECT CustomerID, ContactName
FROM Customers C
WHERE C.ContactName LIKE '%' + @ContactName + '%'
```

3. Download the solution and start testing.

If you have questions, reach out to us at: jalugogarcia@gmail.com.

Happy coding!
