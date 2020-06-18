Public Class GenericResponse

    Private _Success As Boolean
    Private _Code As String
    Private _Message As String

    Property Success As Boolean
        Get
            Return _Success
        End Get
        Set
            _Success = Value
        End Set
    End Property

    Property Code As String
        Get
            Return _Code
        End Get
        Set
            _Code = Value
        End Set
    End Property

    Property Message As String
        Get
            Return _Message
        End Get
        Set
            _Message = Value
        End Set
    End Property
End Class
