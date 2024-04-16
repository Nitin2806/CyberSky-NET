<%@ Page Language="C#" AutoEventWireup="true" Title="Register" MasterPageFile="~/Site.Master" CodeBehind="Register.aspx.cs" Inherits="CyberSky.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="login-form">
        <div class="login-list">
            <h1>
                <asp:Label ID="Label_Register" runat="server" Text="Register"></asp:Label>
            </h1>
        </div>

        <div class="login-items card">
            <div class="login-content card-body">
                <asp:Label ID="SuccessMessage" runat="server" CssClass="success-message" EnableViewState="false"></asp:Label>
                <asp:Label ID="ErrorMessage" runat="server" CssClass="error-message text-danger" EnableViewState="false"></asp:Label>
                <div class="form-field">

                    <asp:Label ID="Label_Username" runat="server" Text="Username"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Username" runat="server" ErrorMessage="Enter a username" ControlToValidate="TextBox_Username" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox ID="TextBox_Username" runat="server"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_Password" runat="server" Text="Password"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ErrorMessage="Enter a password" ControlToValidate="TextBox_Password" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox ID="TextBox_Password" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_ConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_ConfirmPassword" runat="server" ErrorMessage="Confirm your password" ControlToValidate="TextBox_ConfirmPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator_ConfirmPassword" runat="server" ErrorMessage="Passwords do not match" ControlToValidate="TextBox_ConfirmPassword" ControlToCompare="TextBox_Password" Display="Dynamic"></asp:CompareValidator>
                    </div>
                    <asp:TextBox ID="TextBox_ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_Email" runat="server" Text="Email"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ErrorMessage="Enter your email address" ControlToValidate="TextBox_Email" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_Email" runat="server" ErrorMessage="Enter a valid email address" ControlToValidate="TextBox_Email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <asp:TextBox ID="TextBox_Email" runat="server"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_Phone" runat="server" Text="Phone"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Phone" runat="server" ErrorMessage="Enter your phone number." ControlToValidate="TextBox_Phone" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_Phone" runat="server" ErrorMessage="Enter a 10 digit phone number" ControlToValidate="TextBox_Phone" ValidationExpression="^\d{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <asp:TextBox ID="TextBox_Phone" runat="server"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_AddressLine1" runat="server" Text="Address Line 1"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_AddressLine1" runat="server" ErrorMessage="Enter your address" ControlToValidate="TextBox_AddressLine1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox ID="TextBox_AddressLine1" runat="server"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_AddressLine2" runat="server" Text="Address Line 2"></asp:Label>
                    <div class="long-field-messages"></div>
                    <asp:TextBox ID="TextBox_AddressLine2" runat="server"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_City" runat="server" Text="City"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_City" runat="server" ErrorMessage="Enter your city" ControlToValidate="TextBox_City" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox ID="TextBox_City" runat="server"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_Province" runat="server" Text="Province"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Province" runat="server" ErrorMessage="Enter your province" ControlToValidate="TextBox_Province" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <asp:TextBox ID="TextBox_Province" runat="server"></asp:TextBox>
                </div>
                <div class="form-field">
                    <asp:Label ID="Label_Pincode" runat="server" Text="Pincode"></asp:Label>
                    <div class="long-field-messages">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Pincode" runat="server" ErrorMessage="Enter your pincode" ControlToValidate="TextBox_Pincode" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_Pincode" runat="server" ErrorMessage="Enter pincode in X1X1X1 format" ControlToValidate="TextBox_Pincode" ValidationExpression="[A-Za-z]\d[A-Za-z]\d[A-Za-z]\d" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <asp:TextBox ID="TextBox_Pincode" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="login-buttons">
            <asp:Button ID="Button_Register" class="btn btn-success" runat="server" OnClick="OnRegister_Click" Text="Register" />
            <asp:Button ID="Button_Login" class="btn btn-warning" runat="server" PostBackUrl="~/Login.aspx" Text="Login" />
        </div>
    </div>
</asp:Content>
