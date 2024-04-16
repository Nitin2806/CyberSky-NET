<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Product" CodeBehind="Products.aspx.cs" Inherits="CyberSky.Products" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div class="product-form">
      <div class="product-list">
         <h1>
            <asp:Label ID="Label_User" runat="server" ></asp:Label>
         </h1>
      </div>
      <div class="product-list">
         <asp:Label ID="Label1" runat="server" Text="Label">Select a Product</asp:Label>
         <asp:DropDownList ID="DropDownList_Product" runat="server" DataSourceID="SqlDataSource1" DataTextField="productName" DataValueField="productId" OnSelectedIndexChanged="DropDownList_Product_SelectedIndexChanged" AutoPostBack="true">
         </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cyberskyConnectionString %>" ProviderName="<%$ ConnectionStrings:cyberskyConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>
      </div>
      <div class="product-item card">
         <div class="product-image card-img-top">
            <asp:Image ID="Image_Product" runat="server" ImageUrl="~/Images/guru.jpg" />
         </div>
         <div class="product-content card-body">
            <h2>
               <asp:Label ID="Label_Name" class="text-dark" runat="server" Text="Label">Samsung Guru</asp:Label>
            </h2>
            <p>
               <asp:Label ID="Label_Desc" class="text-secondary" runat="server" Text="Label">Guru is a samsung phone</asp:Label>
            </p>
            <h5>
               <asp:Label ID="Label_Price" class="text-primary" runat="server" Text="Label">$660.00</asp:Label>
            </h5>
         </div>
      </div>
      <div class="quantity-items card">
         <div class="login-content card-body">
            <div class="form-field">
               <asp:Label ID="Label_Quantity" runat="server" Text="Quantity"></asp:Label>
               <div class="long-field-messages">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator_Quantity" runat="server" ErrorMessage="Enter Quantity." ControlToValidate="TextBox_Quantity" Display="Dynamic"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator_Quantity" runat="server" ErrorMessage="Enter quantity below 50" ControlToValidate="TextBox_Quantity" ValidationExpression="^([1-9]|[1-4][0-9])$" Display="Dynamic"></asp:RegularExpressionValidator>
               </div>
               <asp:TextBox ID="TextBox_Quantity" runat="server"></asp:TextBox>
            </div>
         </div>
      </div>
      <div class="product-buttons">
         <asp:Button ID="Button_Add" class="btn btn-success" runat="server" Text="Add to Cart" OnClick="Button_Add_Click" />
         <asp:Button ID="Button_Cart" class=" btn btn-warning" runat="server" PostBackUrl="~/Cart.aspx" Text="View Cart"/>
      </div>
   </div>
</asp:Content>