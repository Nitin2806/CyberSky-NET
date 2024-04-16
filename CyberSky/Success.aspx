<%@ Page Language="C#" AutoEventWireup="true" Title="Order Successful" MasterPageFile="~/Site.Master" CodeBehind="Success.aspx.cs" Inherits="CyberSky.Success" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-form">
        <div class="login-list">
            <h1>
                <asp:Label ID="Label_Success" runat="server" Text="Label">Your order is successful</asp:Label>
            </h1>
        </div>
        <div class="cart-buttons">
            <asp:Button ID="Button_Continue" class=" btn btn-warning" runat="server" Text="Continue Shopping"  PostBackUrl="~/Products.aspx"/>
        </div>
    </div>
</asp:Content>