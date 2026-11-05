<%@ Page Title="Contact | ARU KORE" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ARUKORE.Contact" %>
<asp:Content ID="ContactArea" ContentPlaceHolderID="MainContent" runat="server">
    <section class="section-block contact-block">
        <p class="eyebrow">05 / GET IN TOUCH</p>
        <h2>Let's make<br /><span>something happen.</span></h2>
        <p class="section-copy">Have an opportunity, collaboration or just want to say hello? Send me a message.</p>
        <div class="contact-form">
            <asp:Label runat="server" AssociatedControlID="txtName" Text="Your name" />
            <asp:TextBox ID="txtName" runat="server" MaxLength="100" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter your name." CssClass="validation" Display="Dynamic" />

            <asp:Label runat="server" AssociatedControlID="txtEmail" Text="Email address" />
            <asp:TextBox ID="txtEmail" runat="server" MaxLength="150" TextMode="Email" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter your email." CssClass="validation" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ErrorMessage="Please enter a valid email address." CssClass="validation" Display="Dynamic" />

            <asp:Label runat="server" AssociatedControlID="txtSubject" Text="Subject" />
            <asp:TextBox ID="txtSubject" runat="server" MaxLength="150" CssClass="form-control" />

            <asp:Label runat="server" AssociatedControlID="txtMessage" Text="Message" />
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" ErrorMessage="Please enter a message." CssClass="validation" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revMessage" runat="server" ControlToValidate="txtMessage" ValidationExpression="^[\s\S]{0,2000}$" ErrorMessage="Message must be 2000 characters or fewer." CssClass="validation" Display="Dynamic" />

            <asp:Button ID="btnSend" runat="server" Text="Send message" CssClass="btn-primary" OnClick="btnSend_Click" />
            <asp:Label ID="lblStatus" runat="server" EnableViewState="false" />
        </div>
    </section>
</asp:Content>
