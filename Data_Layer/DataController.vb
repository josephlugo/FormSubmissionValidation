Imports System.Data.Entity.Core.Objects.DataClasses
Imports System.Data.SqlClient
Imports System.Data.Entity.Core.Objects

Public Class DataController

    Public Shared Function GetCustomerIDByContactName(ByVal IN_ContactName As String) As List(Of GetCustomerIDByContactName_Result)

        Dim resultList As List(Of GetCustomerIDByContactName_Result) = Nothing

        Try
            'In order to dynamic connections works, the name of the entity has to be the same
            'as the specified for the Entity Container Name
            Using dbContext As New FSVEntities(Configuration.CONNECTION_STRING)

                'Calling a mapped stored procedure
                resultList = dbContext.GetCustomerIDByContactName(IN_ContactName).ToList()

                'When finish using the context dispose it
                dbContext.Dispose()

            End Using

        Catch ex As Exception
            Throw ex
        End Try

        Return resultList

    End Function

End Class
