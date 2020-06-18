Imports System.Drawing
Imports System.Net
Imports BT_FSV

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Try
            lbl_message.Visible = False
            lbl_message.Text = ""

            'Clear session variables pool
            Clear_Cache()

            lbl_FirstName.Text = "First Name &nbsp;<font color='red'>*</font>"
            lbl_lastName.Text = "Last Name &nbsp;<font color='red'>*</font> "
            lbl_id_number.Text = "ID Number &nbsp;<font color='red'>*</font>"
            lbl_customerID.Text = "Customer ID &nbsp;<font color='red'>*</font>"
            lbl_dob.Text = "Date of Birth &nbsp;<font color='red'>*</font>"
            lbl_pers_email.Text = "Email &nbsp; <font color='red'>*</font>"

            'txt_first_name.Text = "Jose"
            'txt_LastName.Text = "Lugo"
            'txt_id_number.Text = "23213"
            'txt_customer_id.Text = "ARFGC"
            'txt_dt_of_birth.Text = "01/23/1982"
            'txt_local_phone.Text = "4565985562"
            'txt_per_email.Text = "ja@me.com"

            If Not Page.IsPostBack Then

                Dim UserCanProceedToPageInfo As Boolean = True

                If UserCanProceedToPageInfo Then

                    chk_int_phone.Checked = False
                    chk_int_phone_CheckedChanged(sender, e)
                    entry_form_panel.Visible = True

                Else
                    entry_form_panel.Visible = False
                    lbl_message.ForeColor = Color.Red
                    lbl_message.Visible = True
                    lbl_message.Text = "The current user is not authorized to access this application."
                End If

            End If

        Catch ex As Exception
            lbl_message.ForeColor = Color.Red
            lbl_message.Visible = True
            lbl_message.Text = "An unexpected error has occurred."
        End Try

    End Sub

    Private Sub Clear_Cache()

        Try
            If Not Session.Item("CustomerID") Is Nothing Then
                Session.Remove("CustomerID")
            End If

            If Not Session.Item("CustomerFullName") Is Nothing Then
                Session.Remove("CustomerFullName")
            End If

        Catch ex As Exception
            lbl_message.ForeColor = Color.Red
            lbl_message.Visible = True
            lbl_message.Text = "An unexpected error has occurred."
        End Try
    End Sub

    Protected Sub chk_int_phone_CheckedChanged(sender As Object, e As EventArgs) Handles chk_int_phone.CheckedChanged
        Try
            If chk_int_phone.Checked Then
                txt_local_phone.Text = String.Empty
                txt_local_phone.Attributes.Add("disabled", "disabled")
                lbl_local_phone.Text = "Phone Number"
            Else
                txt_local_phone.Enabled = True
                txt_local_phone.Attributes.Remove("disabled")
                lbl_local_phone.Text = "Phone Number &nbsp; <font color='red'>*</font>"
            End If

        Catch ex As Exception
            lbl_message.Visible = True
            lbl_message.Text = "An unexpected error has occurred."
        End Try
    End Sub

    Protected Sub Show_Customers_Result(sender As Object, e As EventArgs)

        Try

            If String.IsNullOrEmpty(txt_cust_contactName.Text) Then

                txt_cust_contactName.Attributes.Remove("class")
                txt_cust_contactName.Attributes.Add("class", "form-control is-invalid")
                Gridview_Result_CustomerID.Visible = False

            Else

                Dim business As FSV_BT_Interface = New FSV_BT()

                Gridview_Result_CustomerID.DataSource = business.GetCustomerIDByContactName(txt_cust_contactName.Text)
                Gridview_Result_CustomerID.DataBind()
                Gridview_Result_CustomerID.Visible = True

                txt_cust_contactName.Attributes.Remove("class")
                txt_cust_contactName.Attributes.Add("class", "form-control")

            End If

        Catch ex As Exception
            lbl_message.ForeColor = Color.Red
            lbl_message.Visible = True
            lbl_message.Text = "An unexpected error has occurred."
        End Try

    End Sub

    Protected Sub Get_Customer_ID(sender As Object, e As EventArgs)

        Try

            Dim lb As Button = CType(sender, Button)
            Dim row As GridViewRow = CType(lb.NamingContainer, GridViewRow)

            If row IsNot Nothing Then
                Dim EMPLID As String = row.Cells(0).Text
                Dim ContactName As String = row.Cells(1).Text

                txt_customer_id.Text = EMPLID.ToString.Trim
                txt_contact_name.Text = HttpUtility.HtmlDecode(ContactName)

            End If

            Gridview_Result_CustomerID.Visible = False
            txt_cust_contactName.Text = String.Empty
            txt_cust_contactName.Attributes.Remove("required")

        Catch ex As Exception
            lbl_message.ForeColor = Color.Red
            lbl_message.Visible = True
            lbl_message.Text = "An unexpected error has occurred."
        End Try

    End Sub

    Protected Sub Clear_SearchFields(sender As Object, e As EventArgs)

        Try

            Gridview_Result_CustomerID.Visible = False
            txt_cust_contactName.Text = String.Empty

            txt_cust_contactName.Attributes.Remove("class")
            txt_cust_contactName.Attributes.Add("class", "form-control")
            txt_cust_contactName.Attributes.Remove("required")

        Catch ex As Exception
            lbl_message.ForeColor = Color.Red
            lbl_message.Visible = True
            lbl_message.Text = "An unexpected error has occurred."
        End Try

    End Sub

    Protected Sub Gridview_Result_CustomerID_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Gridview_Result_CustomerID.RowDataBound

        Try
            If (e.Row.RowType = DataControlRowType.DataRow) Then
                Dim cb As Button = TryCast(e.Row.FindControl("btn_select_user_srch"), Button)
                ScriptManager.GetCurrent(Me).RegisterPostBackControl(cb)
            End If

        Catch ex As Exception
            lbl_message.ForeColor = Color.Red
            lbl_message.Visible = True
            lbl_message.Text = ex.Message
        End Try

    End Sub

    Protected Sub Show_Confirmation_Details(sender As Object, e As EventArgs)

        Try

            Dim business As FSV_BT_Interface = New FSV_BT()

            Dim businessResponse As GenericResponse = business.CRUD_Operation("something")

            If businessResponse.Success Then
                Session("CustomerFullName") = txt_LastName.Text & ", " & txt_first_name.Text
                Session("CustomerID") = txt_customer_id.Text
                Response.Redirect("~/Confirmation.aspx", False)
            Else
                lbl_message.ForeColor = Color.Red
                lbl_message.Text = businessResponse.Message
                lbl_message.Visible = True
                UpdatePanel1.Update()
            End If

        Catch ex As Exception
            lbl_message.ForeColor = Color.Red
            lbl_message.Text = "An unexpected error has occurred."
            lbl_message.Visible = True
            UpdatePanel1.Update()
        End Try

    End Sub

End Class