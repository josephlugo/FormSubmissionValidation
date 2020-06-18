Imports System.Drawing

Public Class Confirmation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            lbl_message.Visible = False
            lbl_message.Text = ""

            If Not Page.IsPostBack Then

                If Session.Item("CustomerFullName") IsNot Nothing Then

                    lbl_customer_name.Text = Session.Item("CustomerFullName")
                    lbl_customer_id.Text = Session.Item("CustomerID")

                    form_panel.Visible = True
                Else
                    form_panel.Visible = False
                    lbl_message.ForeColor = Color.Red
                    lbl_message.Visible = True
                    lbl_message.Text = "Not authorized."
                End If

            End If

        Catch ex As Exception
            lbl_message.ForeColor = Color.Red
            lbl_message.Visible = True
            lbl_message.Text = "An unexpected error has occurred."
        End Try

    End Sub

    Protected Sub btn_create_another_Click(sender As Object, e As EventArgs) Handles btn_create_another.Click
        Try

            Response.Redirect("~/Default.aspx", False)

        Catch ex As Exception
            lbl_message.ForeColor = Color.Red
            lbl_message.Visible = True
            lbl_message.Text = "An unexpected error has occurred."
        End Try
    End Sub
End Class