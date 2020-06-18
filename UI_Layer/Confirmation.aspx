<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Confirmation.aspx.vb" Inherits="UI_Layer.Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="form_panel" runat="server">

        <div class="row">
            <div class="col">
                <h1 class="text-center">Congratulations!</h1>
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

                            <div class="table-responsive">

                                <table class="table table-hover table-borderless">
                                    <tbody>
                                        <tr>
                                            <th scope="row" style="width: 190px"><b>Customer Name:</b></th>
                                            <td>
                                                <asp:Label ID="lbl_customer_name" runat="server" Text="" ForeColor="Gray" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" style="width: 190px"><b>Customer ID:</b></th>
                                            <td>
                                                <asp:Label ID="lbl_customer_id" runat="server" Text="" ForeColor="Gray" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />

        <div class="row justify-content-center">
            <div class="col-auto">
                <div class="row text-center">
                    <div class="col-auto">
                        <asp:Button ID="btn_create_another" runat="server" Text="Main Menu" CssClass="btn btn-dark" />
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>

    <%--End of Panel--%>

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

</asp:Content>
