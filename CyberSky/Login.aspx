<%@ Page Language="C#" Title="Login"  AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="CyberSky.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-form">
        <div class="login-list">
            <h1>
                <asp:Label ID="Label_Login" runat="server" Text="Login"></asp:Label>
            </h1>
        </div>
        <div class="login-items card">
            <div class="login-content card-body">
                <div class="form-field">
                    <asp:Label ID="Label_Username" runat="server" Text="Username"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Username" runat="server" ErrorMessage="Enter the Username" ControlToValidate="TextBox_Username" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox ID="TextBox_Username" runat="server"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_Password" runat="server" Text="Password"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ErrorMessage="Enter the Password" ControlToValidate="TextBox_Password" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox ID="TextBox_Password" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="ErrorMessage" runat="server" CssClass="error-message" EnableViewState="false"></asp:Label>
                </div>
            </div>
        </div>
        <div class="login-buttons">
            <asp:Button ID="Button_Login" class="btn btn-success" runat="server" Text="Login" />
            <asp:Button ID="Button_Register" class="btn btn-warning" runat="server" Text="Register?" OnClick="Button_Register_Click" />
        </div>
    </div>
</asp:Content>
