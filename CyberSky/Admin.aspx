<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Admin" CodeBehind="Admin.aspx.cs" Inherits="CyberSky.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <div class="product-form">

      <div class="product-list">
         <h1>
            <asp:Label ID="Label_User" runat="server"></asp:Label>
         </h1>
      </div>

      <div class="product-list">
         <asp:Label ID="Label1" runat="server" Text="Label">Select a Brand</asp:Label>
         <asp:DropDownList ID="DropDownList_Brand" runat="server" AutoPostBack="True"></asp:DropDownList>
      </div>

      <div class="product-item card">
         <div class="product-image card-img-top">
            <asp:GridView ID="phoneView" runat="server" AutoGenerateColumns="False"  AllowPaging="True" AllowSorting="True" PageSize="2" >
               <Columns>
                  <asp:BoundField DataField="phone_name" HeaderText="phone_name" SortExpression="phone_name"  />
                  <asp:BoundField DataField="phone_price" HeaderText="phone_price" SortExpression="phone_price" />
                  <asp:CommandField ButtonType="Button" ShowSelectButton="True" CausesValidation="False"   ControlStyle-CssClass="btn btn-info"/>
                  <asp:CommandField ButtonType="Button" ShowEditButton="True" CausesValidation="False"  ControlStyle-CssClass="btn btn-warning" />
                  <asp:CommandField ButtonType="Button" ShowDeleteButton="True" CausesValidation="False"  ControlStyle-CssClass="btn btn-danger" />
               </Columns>
            </asp:GridView>
           
         </div>
         <div class="product-content card-body">
            <asp:DetailsView ID="phoneDetailsView" runat="server" AutoGenerateRows="False" width="100%">
               <Fields>
                  <asp:BoundField DataField="phone_name" HeaderText="phone_name" SortExpression="phone_name" />
                  <asp:BoundField DataField="phone_desc" HeaderText="phone_desc" SortExpression="phone_desc" />
                  <asp:BoundField DataField="phone_price" HeaderText="phone_price" SortExpression="phone_price" />
               </Fields>
            </asp:DetailsView>
            
         </div>
      </div>

      <div class="product-item card add-phone">
         <div class="add-content card-body">
            
             <div class="form-field">
                <asp:Label ID="insert_phone_name_label" runat="server" Text="Phone Name"></asp:Label>
                <div class="long-field-messages">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ErrorMessage="Enter Phone Name." ControlToValidate="insert_phone_name" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:TextBox ID="insert_phone_name" runat="server"></asp:TextBox>
            </div>

            <div class="form-field">
                <asp:Label ID="insert_phone_desc_label" runat="server" Text="Phone Description"></asp:Label>
                <div class="long-field-messages">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Desc" runat="server" ErrorMessage="Enter Phone Description." ControlToValidate="insert_phone_desc" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:TextBox ID="insert_phone_desc" runat="server"></asp:TextBox>
            </div>

            <div class="form-field">
                <asp:Label ID="insert_phone_price_label" runat="server" Text="Phone Price"></asp:Label>
                <div class="long-field-messages">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Price" runat="server" ErrorMessage="Enter Phone Price." ControlToValidate="insert_phone_price" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Price" runat="server" ErrorMessage="Enter a valid Phone Price" ControlToValidate="insert_phone_price" ValidationExpression="^\d{1,4}(?:\.\d{1,2})?$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <asp:TextBox ID="insert_phone_price" runat="server"></asp:TextBox>
            </div>

            <div class="form-field">
                <asp:Label ID="insert_phone_brand_label" runat="server" Text="Phone Brand"></asp:Label>
                <div class="long-field-messages">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Brand" runat="server" ErrorMessage="Select Phone Brand." ControlToValidate="insert_phone_brand" InitialValue="Select" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:DropDownList ID="insert_phone_brand" runat="server"></asp:DropDownList>
            </div>

            <div class="product-buttons">
               <asp:Button ID="Button_Insert_Phone" class="btn btn-success" runat="server" Text="Add Phone" />
               <asp:Label ID="Insert_button_label" runat="server" Text=""></asp:Label>
            </div>
         </div>
      </div>





   </div>
</asp:Content>