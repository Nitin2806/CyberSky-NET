<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Admin" CodeBehind="Admin.aspx.cs" Inherits="CyberSky.Admin" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label1" runat="server" Text="Choose a Phone Brand" CssClass="mb-4" AssociatedControlID="ddlBrands"></asp:Label>
            </div>
            <div class="col-md-6">
                <asp:DropDownList ID="ddlBrands" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="BrandName" DataValueField="BrandId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cyberskyConnectionString %>" SelectCommand="SELECT * FROM [Brands]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="row  mt-4">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="productId" DataSourceID="PhoneGridView" ForeColor="Black">
                    <Columns>
                        <asp:BoundField DataField="productName" HeaderText="Name" SortExpression="productName" />
                        <asp:BoundField DataField="productPrice" HeaderText="Price" SortExpression="productPrice" />
                        <asp:BoundField DataField="productBrand" HeaderText="Brand" SortExpression="productBrand" />
                        <asp:BoundField DataField="productQuantity" HeaderText="Quantity" SortExpression="productQuantity" />
                        <asp:BoundField DataField="productImage" HeaderText="Image" SortExpression="productImage" />
                        <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="true" CausesValidation="false" ControlStyle-CssClass="btn btn-primary" />
                        <asp:CommandField ButtonType="Button" HeaderText="Edit Fields" ShowEditButton="True" CausesValidation="false" ControlStyle-CssClass="btn btn-warning" />
                        <asp:CommandField ButtonType="Button" HeaderText="Delete Fields" ShowDeleteButton="True" CausesValidation="false" ControlStyle-CssClass="btn btn-danger" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>

                <asp:SqlDataSource ID="PhoneGridView" runat="server" ConnectionString="<%$ ConnectionStrings:cyberskyConnectionString %>"
                    SelectCommand="SELECT * FROM [products] WHERE [BrandId] = @BrandId"
                    InsertCommand="INSERT INTO [products] ([productName], [productPrice], [productBrand], [productQuantity], [productImage]) VALUES (@ProductName, @ProductPrice, @ProductBrand, @ProductQuantity, @ProductImage)"
                    DeleteCommand="DELETE FROM [products] WHERE [productId] = @ProductId"
                    UpdateCommand="UPDATE [products] SET [productName] = @ProductName, [productPrice] = @ProductPrice, [productBrand] = @ProductBrand, [productQuantity] = @ProductQuantity, [productImage] = @ProductImage WHERE [productId] = @ProductId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlBrands" Name="BrandId" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="ProductId" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ProductId" Type="Int32" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="ProductPrice" Type="Decimal" />
                        <asp:Parameter Name="ProductBrand" Type="String" />
                        <asp:Parameter Name="ProductQuantity" Type="Int32" />
                        <asp:Parameter Name="ProductImage" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="ProductPrice" Type="Decimal" />
                        <asp:Parameter Name="ProductBrand" Type="String" />
                        <asp:Parameter Name="ProductQuantity" Type="Int32" />
                        <asp:Parameter Name="ProductImage" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>


                <div class="row mt-4">
                    <div class="col-md-6">
                       <asp:Label ID="DetailsViewHeader" runat="server" CssClass="fw-bold fs-2" EnableViewState="false">Product Details</asp:Label>

                        <asp:DetailsView Visible="False" ID="DetailsView1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="productId" DataSourceID="DetailsDataSource" ForeColor="Black" GridLines="Vertical" Height="50px" Width="525px">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <Fields>
                                <asp:BoundField DataField="productId" HeaderText="productId" InsertVisible="False" ReadOnly="True" SortExpression="productId" />
                                <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                                <asp:BoundField DataField="productPrice" HeaderText="productPrice" SortExpression="productPrice" />
                                <asp:BoundField DataField="productBrand" HeaderText="productBrand" SortExpression="productBrand" />
                                <asp:BoundField DataField="productQuantity" HeaderText="productQuantity" SortExpression="productQuantity" />
                                <asp:BoundField DataField="productImage" HeaderText="productImage" SortExpression="productImage" />
                                <asp:BoundField DataField="BrandId" HeaderText="BrandId" SortExpression="BrandId" />
                            </Fields>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="DetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:cyberskyConnectionString %>"
                            SelectCommand="SELECT * FROM [products] WHERE [productId] = @ProductId">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" Name="ProductId" PropertyName="SelectedDataKey.Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>


                <div class="row mt-4">
                    <div class="col-md-6">
                        <h2>Add New Product</h2>
                        <asp:Panel ID="pnlAddProduct" runat="server">

                            <asp:Label ID="lblProductName" runat="server" Text="Product Name:" CssClass="mb-2"></asp:Label>
                            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control mb-2"></asp:TextBox>

                            <asp:Label ID="lblProductPrice" runat="server" Text="Product Price:" CssClass="mb-2"></asp:Label>
                            <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-control mb-2"></asp:TextBox>

                            <asp:Label ID="lblProductBrand" runat="server" Text="Product Brand:" CssClass="mb-2"></asp:Label>
                            <asp:DropDownList ID="ddlProductBrand" runat="server" CssClass="form-control mb-2" DataSourceID="SqlDataSource1" DataTextField="BrandName" DataValueField="BrandId">
                               
                            </asp:DropDownList>

                            <asp:Label ID="lblProductQuantity" runat="server" Text="Product Quantity:" CssClass="mb-2"></asp:Label>
                            <asp:TextBox ID="txtProductQuantity" runat="server" CssClass="form-control mb-2"></asp:TextBox>

                            <asp:Label ID="lblProductImage" runat="server" Text="Product Image Path:" CssClass="mb-2"></asp:Label>
                            <asp:TextBox ID="txtProductImage" runat="server" CssClass="form-control mb-2"></asp:TextBox>

                            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-primary" OnClick="btnAddProduct_Click" />
                            <asp:Label ID="lblProductError" runat="server" CssClass="mb-2"></asp:Label>
                        </asp:Panel>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
