<%@ Page Title="" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="UI_Layer._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <script type="text/javascript">

        function CheckFormValidation() {

            var form = document.getElementById('mainform');

            // Get all form-groups in need of validation
            var validateGroup = document.getElementsByClassName('validate-me');

            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
                //Added validation class to all form-groups in need of validation
                for (var i = 0; i < validateGroup.length; i++) {
                    validateGroup[i].classList.add('was-validated');
                }
            }
            else
            {
                $('#triggerModal').click();
                $('#ConfirmActionMod').on('shown.bs.modal', function (event) {

                    var nameFromForm = document.getElementById('<%= txt_first_name.ClientID %>').value;
                    var lastNameFromForm = document.getElementById('<%= txt_LastName.ClientID %>').value;
                    document.getElementById('<%= lbl_confirm_name.ClientID %>').innerHTML = lastNameFromForm + ', ' + nameFromForm;

                    var IDFromForm = document.getElementById('<%= txt_id_number.ClientID %>').value;                    
                    document.getElementById('<%= lbl_confirm_id.ClientID %>').innerHTML = IDFromForm;

                    var PhoneFromForm = document.getElementById('<%= txt_local_phone.ClientID %>').value;
                    if (PhoneFromForm)
                        document.getElementById('<%= lbl_confirm_phone.ClientID %>').innerHTML = PhoneFromForm;
                    else
                        document.getElementById('<%= lbl_confirm_phone.ClientID %>').innerHTML = '--Did not specify--';

                    var AddressFromForm = document.getElementById('<%= txt_address.ClientID %>').value;
                    if (AddressFromForm)
                    {
                        var CityFromForm = document.getElementById('<%= txt_city.ClientID %>').value;
                        var StateFromForm = document.getElementById('<%= DropDownListState.ClientID %>').value;
                        var ZipFromForm = document.getElementById('<%= txt_zip_code.ClientID %>').value;
                        document.getElementById('<%= lbl_confirm_address.ClientID %>').innerHTML = AddressFromForm + ', ' + CityFromForm + ', ' + StateFromForm + ', ' + ZipFromForm;
                    }
                    else
                        document.getElementById('<%= lbl_confirm_address.ClientID %>').innerHTML = '--Did not specify--';

                    var JustificationFromForm = document.getElementById('<%= txt_justification.ClientID %>').value;
                    if (JustificationFromForm)
                        document.getElementById('<%= lbl_confirm_justification.ClientID %>').innerHTML = JustificationFromForm;
                    else
                        document.getElementById('<%= lbl_confirm_justification.ClientID %>').innerHTML = '--Did not specify--';                   

                })
            }   
        }

        function CheckModalSearchValidation() {

            var form = document.getElementById('mainform');

            // Get all form-groups in need of validation
            var validateModalGroup = document.getElementsByClassName('validate-me-modalSearch');
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
                //Added validation class to all form-groups in need of validation
                for (var i = 0; i < validateModalGroup.length; i++) {
                    validateModalGroup[i].classList.add('was-validated');
                }
            }
        }

    </script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <%--When the page is loading back with UpdateProgress being triggered--%>
    <script type="text/javascript">

        $(document).ready(function () {

            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(DatePickerFunction);

            function DatePickerFunction(sender, args) {
                $('.date').datepicker({
                    changeYear: true,
                    changeMonth: true,
                    yearRange: "c-60:c+0" //last 60 years by default, and expandable
                }
             );
            }

        });

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        function settingModalInputs() {

            var txtInput1 = document.getElementById('<%= txt_cust_contactName.ClientID %>');
            txtInput1.setAttribute("required", "required");
            
        }

    </script>

    <%--When the page is loading back without UpdateProgress being triggered--%>
    <script type="text/javascript">

        $(function () {
            $('.date').datepicker({
                changeYear: true,
                changeMonth: true,
                yearRange: "c-60:c+0" //last 60 years by default, and expandable
            }
            );
        });

    </script>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>

            <div class="loading">
                Loading. Please wait.
                <br />
                <br />
                <img src="../../Img/loader.gif" alt="" />
            </div>

        </ProgressTemplate>

    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
        <ContentTemplate>

            <asp:Panel ID="entry_form_panel" runat="server">

                <br />

                <div class="row">
                    <div class="col">
                        <h2 class="text-center">Employee Registration</h2>
                        <p class="text-center">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl arcu,
                            egestas vel pulvinar a, facilisis ac diam. Etiam non purus ipsum. Fusce condimentum
                            nisi eget justo ultrices, eget sagittis erat pharetra. Sed risus magna, interdum
                            non dolor vel, tincidunt convallis magna. Donec commodo ut est quis vulputate.
                        </p>
                    </div>
                </div>

                <div class="container py-2">
                    <div class="row">
                        <div class="offset-md-2 col-md-8 offset-md-2">

                            <div class="card">

                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group validate-me">
                                                <asp:Label ID="lbl_FirstName" runat="server" Text="First Name:" AssociatedControlID="txt_first_name"></asp:Label>
                                                <asp:TextBox ID="txt_first_name" class="form-control" runat="server" placeholder="Type first name" required="required" ClientIDMode="Static"></asp:TextBox>
                                                <div class="invalid-feedback">
                                                    Please enter first name.  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <asp:Label ID="lbl_mddle_name" runat="server" Text="Middle Name:" AssociatedControlID="txt_mddle_name"></asp:Label>
                                                <asp:TextBox ID="txt_mddle_name" class="form-control" placeholder="Type middle name" runat="server" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group validate-me">
                                                <asp:Label ID="lbl_lastName" runat="server" Text="Last Name:" AssociatedControlID="txt_LastName"></asp:Label>
                                                <asp:TextBox ID="txt_LastName" class="form-control" placeholder="Type last name" runat="server" autocomplete="off" required="required" ClientIDMode="Static"></asp:TextBox>
                                                <div class="invalid-feedback">
                                                    Please enter last name.  
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group validate-me">
                                                <asp:Label ID="lbl_dob" runat="server" Text="Date of Birth:" AssociatedControlID="txt_dt_of_birth"></asp:Label>
                                                <asp:TextBox ID="txt_dt_of_birth" runat="server" placeholder="mm/dd/yyyy" autocomplete="off" MaxLength="10" class="date form-control" required="required" />
                                                <div class="invalid-feedback">
                                                    Please choose date of birth.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group validate-me">
                                                <asp:Label ID="lbl_pers_email" runat="server" Text="Personal Email:" AssociatedControlID="txt_per_email"></asp:Label>
                                                <asp:TextBox ID="txt_per_email" type="email" runat="server" placeholder="Type email" autocomplete="off" class="form-control" required="required" />
                                                <small id="emailHelp" class="form-text text-muted">(Personal)</small>
                                                <div class="invalid-feedback">
                                                    Please provide a valid email.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group validate-me">
                                                <asp:Label ID="lbl_id_number" runat="server" Text="ID Number:" AssociatedControlID="txt_id_number"></asp:Label>
                                                <asp:TextBox ID="txt_id_number" runat="server" placeholder="Type ID number" autocomplete="off" MaxLength="20" class="form-control" onkeypress="return isNumberKey(event)" required="required" ClientIDMode="Static" data-toggle="tooltip" data-placement="right" title="(Passport number or Driver License)"/>
                                                <small id="idNumberHelp" class="form-text text-muted">(i.e Driver license)</small>
                                                <div class="invalid-feedback">
                                                    Please provide ID Number.  
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group validate-me">
                                                <asp:Label ID="lbl_customerID" runat="server" Text="Customer ID:" AssociatedControlID="txt_customer_id"></asp:Label>
                                                <asp:TextBox ID="txt_customer_id" pattern="[A-Za-z]{5}" runat="server" placeholder="Type ID" autocomplete="off" MaxLength="5" class="form-control" onkeypress="return isNumberKey(event)" required="required" />
                                                <small id="srch_customer_id" class="form-text text-muted no-gutters">
                                                    <a href="#Search_CUSTID" data-target="#Search_CUSTID" data-toggle="modal" data-backdrop="static" data-keyboard="false">Search by Contact Name</a>
                                                </small>
                                                <div class="invalid-feedback">
                                                    Please enter 5 characters ID.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <asp:Label ID="lbl_contact_name" runat="server" Text="Contact Name:" AssociatedControlID="txt_contact_name"></asp:Label>
                                                <asp:TextBox ID="txt_contact_name" runat="server" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group validate-me">
                                                <asp:Label ID="lbl_local_phone" runat="server" Text="Local Phone:" AssociatedControlID="txt_local_phone"></asp:Label>
                                                <asp:TextBox pattern="^\d{10}$" ID="txt_local_phone" runat="server" placeholder="Type local phone" autocomplete="off" MaxLength="10" class="form-control" onkeypress="return isNumberKey(event)" required="required" />
                                                <small id="internationalPhone" class="form-text text-muted">
                                                    <asp:CheckBox ID="chk_int_phone" runat="server" AutoPostBack="True" Text="&nbsp International Phone" />
                                                </small>
                                                <div class="invalid-feedback">
                                                    Please enter 10 digit mobile number.  
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12 col-md-12 col-xs-12">
                                            <div class="form-group">
                                                <asp:Label ID="lbl_address" runat="server" Text="Address:" AssociatedControlID="txt_address"></asp:Label>
                                                <asp:TextBox ID="txt_address" runat="server" placeholder="Type address" autocomplete="off" class="form-control expandedbox" ClientIDMode="Static"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <asp:Label ID="lbl_city" runat="server" Text="City:" AssociatedControlID="txt_city"></asp:Label>
                                                <asp:TextBox ID="txt_city" runat="server" placeholder="Type city" autocomplete="off" class="form-control" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <asp:Label ID="lbl_state" runat="server" Text="State:" AssociatedControlID="DropDownListState"></asp:Label>
                                                <asp:DropDownList ID="DropDownListState" class="form-control" runat="server" ClientIDMode="Static">
                                                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                                    <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                                    <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                                    <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                                    <asp:ListItem Value="CA">California</asp:ListItem>
                                                    <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                                    <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                                    <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                                    <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                                    <asp:ListItem Value="FL" Selected="true">Florida</asp:ListItem>
                                                    <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                                    <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                                    <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                                    <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                                    <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                                    <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                                    <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                                    <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                                    <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                                    <asp:ListItem Value="ME">Maine</asp:ListItem>
                                                    <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                                    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                                    <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                                    <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                                    <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                                    <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                                    <asp:ListItem Value="MT">Montana</asp:ListItem>
                                                    <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                                    <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                                    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                                    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                                    <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                                    <asp:ListItem Value="NY">New York</asp:ListItem>
                                                    <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                                    <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                                    <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                                    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                                    <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                                    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                                    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                                    <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                                    <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                                    <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                                    <asp:ListItem Value="TX">Texas</asp:ListItem>
                                                    <asp:ListItem Value="UT">Utah</asp:ListItem>
                                                    <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                                    <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                                    <asp:ListItem Value="WA">Washington</asp:ListItem>
                                                    <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                                    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                                    <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <asp:Label ID="lbl_zip" runat="server" Text="ZIP:" AssociatedControlID="txt_zip_code"></asp:Label>
                                                <asp:TextBox ID="txt_zip_code" runat="server" placeholder="Type ZIP code" autocomplete="off" class="form-control" onkeypress="return isNumberKey(event)" ClientIDMode="Static"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12 col-md-12 col-xs-12">
                                            <div class="form-group">
                                                <asp:Label ID="lbl_justification" runat="server" Text="Justification:" AssociatedControlID="txt_justification"></asp:Label>
                                                <asp:TextBox ID="txt_justification" runat="server" placeholder="Type justification" autocomplete="off" class="form-control expandedbox" MaxLength="300" TextMode="MultiLine" Height="65px" ClientIDMode="Static"/>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row justify-content-center">
                                        <div class="col-auto text-center">
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txt_dt_of_birth" Operator="DataTypeCheck" Type="Date" ForeColor="#CC0000" ValidationGroup="1">Date invalid, please check format.</asp:CompareValidator>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-auto">
                        <div class="row">
                            <div class="col-auto">
                                <button type="button" id="mainRegister" class="btn btn-info" onclick="CheckFormValidation()">Register</button>
                                <button type="button" id="triggerModal" hidden data-target="#ConfirmActionMod" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-info"></button>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- Modal popup for searching EMPLID by lastname --BEGIN --%>
                <div class="modal fade" id="Search_CUSTID" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header text-white bg-dark">
                                <h4 class="modal-title">Search by Contact Name</h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="panel_modal_action" DefaultButton="btn_search_by_ContactName" runat="server" CssClass="row py-2">
                                            <div class="col-sm-9 col-md-9 col-xs-12">
                                                <div class="form-group px-3 validate-me-modalSearch">
                                                    <asp:Label Font-Size="11pt" ID="lbl_contactNameModal" runat="server" Text="Name:"></asp:Label>
                                                    <asp:TextBox runat="server" ID="txt_cust_contactName" autocomplete="off" ClientIDMode="Static" placeholder="Type last name" class="form-control"></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please enter a last name.  
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3 col-md-3 col-xs-12">
                                                <div class="form-group px-3 py-4">
                                                    <asp:Button ID="btn_search_by_ContactName" runat="server" OnClientClick="CheckModalSearchValidation()" OnClick="Show_Customers_Result" Text="Search" CssClass="btn btn-dark" UseSubmitBehavior="False" />
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12 col-xs-12">
                                                <div class="form-group px-3 py-0" style="max-width: 600px;">
                                                    <asp:GridView ID="Gridview_Result_CustomerID" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-condensed"
                                                        BorderStyle="Solid" BorderWidth="5px" EmptyDataText="No data found.">
                                                        <Columns>
                                                            <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" ReadOnly="true">
                                                                <HeaderStyle Width="50px" HorizontalAlign="Left" Wrap="False"></HeaderStyle>
                                                                <ItemStyle Width="50px" HorizontalAlign="Left" Wrap="False" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="ContactName" HeaderText="Contact Name" ReadOnly="true">
                                                                <HeaderStyle Width="300px" HorizontalAlign="Left" Wrap="False"></HeaderStyle>
                                                                <ItemStyle Width="300px" HorizontalAlign="Left" Wrap="True" CssClass="max-width: 300px;" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Button ID="btn_select_user_srch" class="btn btn-link" data-dismiss="modal" runat="server" OnClick="Get_Customer_ID" Text="Select" UseSubmitBehavior="False" ClientIDMode="AutoID" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" runat="server" onserverclick="Clear_SearchFields">Close</button>
                            </div>
                        </div>
                    </div>

                </div>
                <%-- Modal popup for searching EMPLID by lastname --END --%>

                <%-- Modal popup for Confirm Data Entry --BEGIN --%>
                <div class="modal fade" id="ConfirmActionMod" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header text-white bg-dark">
                                <h4 class="modal-title">Information Summary</h4>
                            </div>
                            <div class="modal-body">
                                <asp:Panel ID="panel1" DefaultButton="btn_confirm_submit" runat="server" CssClass="row">
                                    <div class="col-sm-12 col-md-12 col-xs-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <table class="table table-hover table-borderless">
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row" style="width: 190px"><b>Name:</b></th>
                                                            <td>
                                                                <asp:Label ID="lbl_confirm_name" runat="server" Text="" ForeColor="Gray" ClientIDMode="Static"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" style="width: 190px"><b>ID Number:</b></th>
                                                            <td>
                                                                <asp:Label ID="lbl_confirm_id" runat="server" Text="" ForeColor="Gray" ClientIDMode="Static"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" style="width: 190px"><b>Phone:</b></th>
                                                            <td>
                                                                <asp:Label ID="lbl_confirm_phone" runat="server" Text="" ForeColor="Gray" ClientIDMode="Static"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" style="width: 190px"><b>Address:</b></th>
                                                            <td>
                                                                <asp:Label ID="lbl_confirm_address" runat="server" Text="" ForeColor="Gray" ClientIDMode="Static"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" style="width: 190px"><b>Justification:</b></th>
                                                            <td>
                                                                <asp:Label ID="lbl_confirm_justification" runat="server" Text="" ForeColor="Gray" ClientIDMode="Static"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <br />
                                                <div class="row justify-content-center">
                                                    <div class="col-auto">
                                                        <asp:Button ID="btn_confirm_submit" runat="server" data-dismiss="modal" OnClick="Show_Confirmation_Details" Text="Create Record" CssClass="btn btn-dark" UseSubmitBehavior="False" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </asp:Panel>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- Modal popup for Confirm Data Entry --END --%>
            </asp:Panel>
            <%--End of Entry Panel--%>

            <br />

            <div class="row justify-content-center">
                <div class="col-auto">
                    <div class="row text-center">
                        <div class="col-auto">
                            <asp:Label ID="lbl_message" runat="server" Text="Label" Visible="False" ForeColor="#CC0000"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <br />

        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
