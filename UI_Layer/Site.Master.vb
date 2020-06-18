Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Dim thisURL As String = Request.Url.Segments(Request.Url.Segments.Count - 1)

        Select Case thisURL
            Case "default.aspx"
                tabContact.Attributes.Remove("active")
                tabHome.Attributes.Add("class", "active")
            Case "Contact"
                tabHome.Attributes.Remove("active")
                tabContact.Attributes.Add("class", "active")
        End Select

    End Sub
End Class