<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Cart" CodeBehind="Cart.aspx.cs" Inherits="CyberSky.Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="product-form">
        <div class="product-list">
            <h1>
                <asp:Label ID="Label_Cart" runat="server" Text="Label">Cart</asp:Label>
            </h1>
        </div>

        <div class="cart-items card">
            <div class="cartbox-buttons card-img-top">
                <asp:Button ID="Button_Remove" class="btn btn-danger" onClick="Button_Remove_Click" runat="server" Text="Remove Item"/>
                <asp:Button ID="Button_Clear" class=" btn btn-info" onClick="Button_Clear_Click" runat="server" Text="Clear Cart" />
            </div>
            <div id="cart_content" class="cart-content card-body">
                <asp:Literal ID="Cart_box" runat="server"></asp:Literal>
            </div>
        </div>

        <div class="cart-buttons">
            <asp:Button ID="Button_Checkout" class="btn btn-success" runat="server" Text="Checkout" onClick="Button_Checkout_Click" />
            <asp:Button ID="Button_Continue" class=" btn btn-warning" runat="server" PostBackUrl="~/Products.aspx" Text="Continue Shopping" />
        </div>
    </div>

</asp:Content>
