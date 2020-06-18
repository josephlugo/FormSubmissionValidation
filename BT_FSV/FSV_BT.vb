Imports Data_Layer

Public Class FSV_BT
    Implements FSV_BT_Interface

    Public Function GetCustomerIDByContactName(ContactName As String) As List(Of GetCustomerIDByContactName_Result) Implements FSV_BT_Interface.GetCustomerIDByContactName
        Try
            Return DataController.GetCustomerIDByContactName(ContactName)
        Catch ex As Exception
            Throw ex
        End Try
    End Function


    Public Function CRUD_Operation(parameterValue As String) As GenericResponse Implements FSV_BT_Interface.CRUD_Operation
        Try
            Return New GenericResponse With {.Code = 1, .Success = True, .Message = Nothing}
        Catch ex As Exception
            Return New GenericResponse With {.Code = -1, .Success = False, .Message = ex.Message}
        End Try
    End Function

End Class
