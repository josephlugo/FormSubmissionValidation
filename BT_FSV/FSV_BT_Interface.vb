Imports Data_Layer

Public Interface FSV_BT_Interface

    Function CRUD_Operation(ByVal parameterValue As String) As GenericResponse
    Function GetCustomerIDByContactName(ByVal ContactName As String) As List(Of GetCustomerIDByContactName_Result)

End Interface
