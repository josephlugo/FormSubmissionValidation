<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="UI_Layer.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <h2 class="text-center" aria-label="Contact address information">Contact</h2>
   <p class="text-center">If you have experienced any problem with this application, please contact us at:</p>

    <address class="text-center">
        Office Name Here<br />
        Company Name Inc.<br />
        12345 NW 14 Street<br />
        City, State ZIP Code<br />
        <abbr title="Phone">Phone:</abbr>
        999-000-0000
    </address>

    <address class="text-center">
        <strong>E-Mail:</strong> <a href="mailto:yourcompany@company.com" aria-label="Support team email">yourcompany@company.com</a><br /> 
        <strong>Website:</strong> <a href="https://www.yourcompany.com/contact_page" target="_blank" aria-label="Support team website URL">https://www.yourcompany.com/contact_page</a><br />       
    </address>
</asp:Content>
