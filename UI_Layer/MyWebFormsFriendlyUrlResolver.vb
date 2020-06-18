Imports Microsoft.AspNet.FriendlyUrls
Public Class MyWebFormsFriendlyUrlResolver
    Inherits Microsoft.AspNet.FriendlyUrls.Resolvers.WebFormsFriendlyUrlResolver

    Protected Overrides Function TrySetMobileMasterPage(httpContext As HttpContextBase, page As Page, mobileSuffix As String) As Boolean
        If (mobileSuffix Is "Mobile") Then
            Return False
        Else
            Return TrySetMobileMasterPage(httpContext, page, mobileSuffix)
        End If
    End Function

End Class
